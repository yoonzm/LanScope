import SwiftUI

struct ContentView: View {
    @StateObject private var model = ScanViewModel()
    @Environment(\.scenePhase) private var scenePhase
    @State private var showingSettings = false

    var body: some View {
        scanView
        .onChange(of: scenePhase) { _, phase in
            if phase == .background { model.stop(background: true) }
        }
        .task(id: scenePhase) {
            guard scenePhase == .active else { return }
            while !Task.isCancelled {
                await model.refreshWiFiName()
                do { try await Task.sleep(nanoseconds: 3_000_000_000) }
                catch { return }
            }
        }
    }

    private var scanView: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink {
                        ScanHistoryView(model: model)
                    } label: {
                        Label("扫描历史（\(model.history.count)）", systemImage: "clock.arrow.circlepath")
                    }
                    if let error = model.historyError {
                        Text(error).font(.footnote).foregroundStyle(.orange)
                    }
                }
                Section {
                    TextField("例如 192.168.1.0/24", text: $model.cidr)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .keyboardType(.numbersAndPunctuation)
                        .disabled(model.running)
                        .accessibilityLabel("IPv4 网段")
                    if let message = model.networkMessage {
                        Text(message).font(.footnote).foregroundStyle(.secondary)
                    }
                    if model.canResume {
                        Button("继续扫描", systemImage: "play.circle.fill") { model.resume() }
                    }
                    Button(model.running ? "停止扫描" : (model.canResume ? "重新开始扫描" : "开始扫描"),
                           systemImage: model.running ? "stop.circle.fill" : "antenna.radiowaves.left.and.right") {
                        if model.running { model.stop() } else { model.start() }
                    }
                } header: {
                    HStack {
                        Label(model.currentWiFiName ?? "Wi-Fi", systemImage: "wifi")
                            .lineLimit(1)
                            .truncationMode(.middle)
                            .textCase(nil)
                            .accessibilityLabel("当前 Wi-Fi：\(model.currentWiFiName ?? "未获取到名称")")
                        Spacer(minLength: 8)
                        Button {
                            showingSettings = true
                        } label: {
                            Image(systemName: "slider.horizontal.3")
                                .font(.body)
                                .frame(width: 44, height: 44)
                                .contentShape(Rectangle())
                        }
                        .buttonStyle(.borderless)
                        .accessibilityLabel("高级设置")
                        .disabled(model.running)
                    }
                } footer: {
                    Text("仅 Wi-Fi · 私有 IPv4 / 链路本地地址 · 最多 1024 个地址。扫描时自动排除本机地址。打开时自动填入网段，可直接修改；更换 Wi-Fi 后请确认扫描范围。")
                }

                Section("扫描状态") {
                    HStack {
                        Label("发现 \(model.hosts.count) 台", systemImage: "network")
                        Spacer()
                        Text("\(model.completed) / \(model.total)")
                            .monospacedDigit().foregroundStyle(.secondary)
                    }
                    ProgressView(value: Double(model.completed), total: Double(max(1, model.total)))
                    Text(model.status).font(.footnote).foregroundStyle(.secondary)
                    if let diagnostic = model.diagnostic {
                        Label(diagnostic, systemImage: "exclamationmark.triangle")
                            .font(.footnote).foregroundStyle(.orange)
                    }
                }

                DiscoveredAssetsSection(hosts: model.hosts, running: model.running)
            }
            .navigationTitle("LanScope")
            .sheet(isPresented: $showingSettings) { AdvancedSettingsView(model: model) }
        }
    }
}

private struct ScanHistoryView: View {
    @ObservedObject var model: ScanViewModel

    private var groups: [(title: String, records: [ScanRecord])] {
        let calendar = Calendar.current
        return [
            ("今天", model.history.filter { calendar.isDateInToday($0.startedAt) }),
            ("昨天", model.history.filter { calendar.isDateInYesterday($0.startedAt) }),
            ("更早", model.history.filter {
                !calendar.isDateInToday($0.startedAt) && !calendar.isDateInYesterday($0.startedAt)
            })
        ]
    }

    var body: some View {
        List {
            if let error = model.historyError {
                Text(error).font(.footnote).foregroundStyle(.orange)
            }
            if model.history.isEmpty {
                ContentUnavailableView("暂无扫描历史", systemImage: "clock",
                                       description: Text("扫描结束后自动保存，有进度的未完成扫描也会保留。"))
            }
            ForEach(groups, id: \.title) { group in
                if !group.records.isEmpty {
                    Section(group.title) {
                        ForEach(group.records) { record in
                            NavigationLink {
                                ScanRecordView(record: record)
                            } label: {
                                VStack(alignment: .leading, spacing: 4) {
                                    HStack(alignment: .firstTextBaseline, spacing: 8) {
                                        Label(record.wifiName.flatMap { $0.isEmpty ? nil : $0 } ?? "未记录 Wi-Fi",
                                              systemImage: "wifi")
                                            .font(.headline)
                                            .lineLimit(1)
                                            .truncationMode(.middle)
                                        Spacer(minLength: 0)
                                        Text(record.startedAt.formatted(
                                            date: group.title == "更早" ? .numeric : .omitted,
                                            time: .shortened))
                                            .font(.caption).foregroundStyle(.secondary)
                                            .fixedSize()
                                    }
                                    Text(record.cidr).font(.subheadline).monospaced()
                                    Text("发现 \(record.hosts.count) 台 · \(record.outcome.title)")
                                        .font(.subheadline)
                                    if record.outcome != .completed {
                                        Text("已扫描 \(record.completed)/\(record.total) 个地址")
                                            .font(.caption).foregroundStyle(.secondary)
                                    }
                                }.padding(.vertical, 2)
                            }
                        }
                        .onDelete { offsets in
                            model.deleteHistory(ids: Set(offsets.map { group.records[$0].id }))
                        }
                    }
                }
            }
            Section {
                Text("仅保存在本机，保留最近 30 次扫描。向左滑动可删除记录。")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
        .navigationTitle("扫描历史")
    }
}

private struct ScanRecordView: View {
    let record: ScanRecord

    var body: some View {
        List {
            Section("扫描信息") {
                LabeledContent("网段", value: record.cidr)
                if let settings = record.settings {
                    LabeledContent("仅扫描 ping 成功的设备", value: settings.pingOnly ? "是" : "否")
                    LabeledContent("扫描端口", value: settings.portsText)
                }
                LabeledContent("扫描时 Wi-Fi",
                               value: record.wifiName.flatMap { $0.isEmpty ? nil : $0 } ?? "未记录 Wi-Fi")
                LabeledContent("开始时间", value: record.startedAt.formatted(date: .abbreviated, time: .standard))
                LabeledContent("结束时间", value: record.endedAt.formatted(date: .abbreviated, time: .standard))
                LabeledContent("状态", value: record.outcome.title)
                LabeledContent("已扫描地址", value: "\(record.completed)/\(record.total)")
                if let diagnostic = record.diagnostic {
                    Text(diagnostic).font(.footnote).foregroundStyle(.orange)
                }
            }
            DiscoveredAssetsSection(hosts: record.hosts, historical: true)
        }
        .navigationTitle("扫描结果")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct HostResultRow: View {
    let host: HostResult

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(host.ip).font(.headline).monospaced()
            if let name = host.identity?.displayName {
                Text(name).font(.subheadline).lineLimit(2)
            }
            if let summary = host.identity?.summary {
                Text(summary).font(.caption).foregroundStyle(.secondary)
            }
            // String(port) avoids locale grouping such as "5,000" in port numbers.
            let openPorts = (host.ports ?? []).filter { $0.state == .open }
            if host.ports != nil {
                ForEach(openPorts) { result in
                    Text("TCP \(String(result.port))")
                        .font(.subheadline)
                }
            } else if let port = host.port, host.open == true {
                Text("TCP \(String(port))")
                    .font(.subheadline)
            }
            if let hint = emptyHint(openPorts: openPorts) {
                Text(hint).font(.caption).foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 4)
    }

    // Explain rows that would otherwise show nothing below the address.
    private func emptyHint(openPorts: [PortResult]) -> String? {
        guard openPorts.isEmpty, host.ports != nil, host.open != true else { return nil }
        if host.pingMilliseconds != nil { return "仅响应 Ping，未发现开放端口" }
        if host.identity != nil { return "仅通过 Bonjour 发现，未发现开放端口" }
        return nil
    }
}

private struct DiscoveredAssetsSection: View {
    let hosts: [HostResult]
    var running = false
    var historical = false
    @State private var showingWeb = false

    var body: some View {
        Section {
            Picker("资产类型", selection: $showingWeb) {
                Text("IP（\(hosts.count)）").tag(false)
                Text("Web（\(hosts.reduce(0) { $0 + ($1.webServices?.count ?? 0) })）").tag(true)
            }
            .pickerStyle(.segmented)
            if showingWeb {
                WebAssetRows(hosts: hosts, running: running)
            } else {
                if hosts.isEmpty {
                    Text(running ? "正在扫描…" : "暂无已发现资产")
                        .foregroundStyle(.secondary)
                }
                ForEach(hosts) { host in
                    HostResultRow(host: host)
                }
            }
        } header: {
            Text("已发现资产")
        } footer: {
            if historical {
                Text("这是扫描当时的结果，不代表设备当前状态。")
            }
        }
    }
}

private struct WebAssetRows: View {
    let hosts: [HostResult]
    let running: Bool

    private var services: [WebService] {
        hosts.flatMap { $0.webServices ?? [] }
    }

    var body: some View {
        Group {
            if services.isEmpty {
                Text(running ? "正在扫描…" : "暂无已确认的 Web 资产").foregroundStyle(.secondary)
            }
            ForEach(services) { service in
                if let url = URL(string: service.url) {
                    Link(destination: url) {
                        VStack(alignment: .leading, spacing: 6) {
                            Label(service.title ?? service.url, systemImage: "globe")
                                .font(.headline)
                                .lineLimit(2)
                            if service.title != nil {
                                Text(service.url).font(.subheadline).foregroundStyle(.secondary)
                            }
                            Text("\(url.scheme?.uppercased() ?? "HTTP") · 状态码 \(service.statusCode) · 点击打开")
                                .font(.subheadline).foregroundStyle(.secondary)
                            if let server = service.server {
                                Text("服务器：\(server)").font(.caption).foregroundStyle(.secondary)
                            }
                            if service.certificateTrusted == false {
                                Label("证书校验未通过", systemImage: "exclamationmark.shield")
                                    .font(.caption).foregroundStyle(.orange)
                            }
                            if let redirect = service.redirectURL {
                                Text("跳转至：\(redirect)").font(.caption).foregroundStyle(.secondary)
                                    .lineLimit(2)
                            }
                        }.padding(.vertical, 4)
                    }
                }
            }
        }
    }
}
