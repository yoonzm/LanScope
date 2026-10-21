import SwiftUI

struct ContentView: View {
    @StateObject private var model = ScanViewModel()
    @Environment(\.scenePhase) private var scenePhase
    @State private var showingSettings = false

    var body: some View {
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
                    Button(model.running ? "停止扫描" : "开始扫描",
                           systemImage: model.running ? "stop.circle.fill" : "antenna.radiowaves.left.and.right") {
                        if model.running { model.stop() } else { model.start() }
                    }
                } header: {
                    HStack {
                        Text("扫描范围")
                        Spacer()
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
                    Text("仅 Wi-Fi · 私有 IPv4 / 链路本地地址 · 最多 1024 个地址。打开时自动填入网段，可直接修改；更换 Wi-Fi 后请确认扫描范围。")
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

                Section {
                    if model.hosts.isEmpty {
                        Text(model.running ? "等待设备响应…" : "暂无已发现主机")
                            .foregroundStyle(.secondary)
                    }
                    ForEach(model.hosts) { host in
                        HostResultRow(host: host)
                    }
                } header: {
                    Text("已发现主机")
                } footer: {
                    Text("Ping 与 TCP 耗时分别标注。未响应不代表离线；开启 ping 筛选会跳过不回应 ping 的设备。首次允许局域网权限后，请重新扫描。")
                }
            }
            .navigationTitle("LanScope")
            .sheet(isPresented: $showingSettings) { AdvancedSettingsView(model: model) }
            .onChange(of: scenePhase) { _, phase in
                if phase == .background { model.stop(background: true) }
            }
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
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(record.cidr).font(.headline).monospaced()
                                    if let name = record.wifiName, !name.isEmpty {
                                        Label(name, systemImage: "wifi").font(.subheadline)
                                    }
                                    Text(record.startedAt.formatted(date: .abbreviated, time: .shortened))
                                        .font(.caption).foregroundStyle(.secondary)
                                    Text("发现 \(record.hosts.count) 台 · \(record.outcome.title)")
                                        .font(.subheadline)
                                    if record.outcome != .completed {
                                        Text("已扫描 \(record.completed)/\(record.total) 个地址")
                                            .font(.caption).foregroundStyle(.secondary)
                                    }
                                }.padding(.vertical, 4)
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
                if let name = record.wifiName, !name.isEmpty {
                    LabeledContent("扫描时 Wi-Fi", value: name)
                }
                LabeledContent("开始时间", value: record.startedAt.formatted(date: .abbreviated, time: .standard))
                LabeledContent("结束时间", value: record.endedAt.formatted(date: .abbreviated, time: .standard))
                LabeledContent("状态", value: record.outcome.title)
                LabeledContent("已扫描地址", value: "\(record.completed)/\(record.total)")
                if let diagnostic = record.diagnostic {
                    Text(diagnostic).font(.footnote).foregroundStyle(.orange)
                }
            }
            Section {
                if record.hosts.isEmpty {
                    Text("本次未发现有响应的主机").foregroundStyle(.secondary)
                }
                ForEach(record.hosts) { host in
                    HostResultRow(host: host)
                }
            } header: {
                Text("已发现主机（\(record.hosts.count)）")
            } footer: {
                Text("这是扫描当时的结果，不代表设备当前状态。未发现不代表离线；中断的扫描可能尚未检查完全部端口。")
            }
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
            if let ping = host.pingMilliseconds {
                Text("Ping 成功 · \(ping) ms").font(.subheadline)
            }
            if let ports = host.ports {
                if ports.isEmpty {
                    Text("尚无端口探测结果").font(.caption).foregroundStyle(.secondary)
                }
                ForEach(ports) { result in
                    Text("TCP \(result.port) · \(result.state.title) · \(result.milliseconds) ms")
                        .font(.subheadline)
                }
            } else if let port = host.port, let open = host.open {
                Text("TCP \(port) · \(open ? "连接成功" : "连接被拒绝") · \(host.milliseconds) ms")
                    .font(.subheadline)
            }
            Text(host.discoveredAt, style: .time).font(.caption).foregroundStyle(.secondary)
        }
        .padding(.vertical, 4)
    }
}
