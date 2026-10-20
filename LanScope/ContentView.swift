import SwiftUI

struct ContentView: View {
    @StateObject private var model = ScanViewModel()
    @Environment(\.scenePhase) private var scenePhase

    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("例如 192.168.1.0/24", text: $model.cidr)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .keyboardType(.numbersAndPunctuation)
                        .disabled(model.running)
                        .accessibilityLabel("IPv4 网段")
                    Button(model.running ? "停止扫描" : "开始扫描",
                           systemImage: model.running ? "stop.circle.fill" : "antenna.radiowaves.left.and.right") {
                        if model.running { model.stop() } else { model.start() }
                    }
                } header: {
                    Text("扫描范围")
                } footer: {
                    Text("仅 Wi-Fi · 私有 IPv4 / 链路本地地址 · 最多 1024 个地址。可在 iPhone 的 Wi-Fi 详情中查看 IP 和子网掩码；255.255.255.0 对应 /24。")
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
                        VStack(alignment: .leading, spacing: 6) {
                            HStack {
                                Text(host.ip).font(.headline).monospaced()
                                Spacer()
                                Text("\(host.milliseconds) ms")
                                    .font(.caption).foregroundStyle(.secondary)
                            }
                            Text(host.open
                                 ? "TCP \(host.port) 连接成功"
                                 : "TCP \(host.port) 连接被拒绝 · 有响应证据")
                                .font(.subheadline)
                            Text(host.discoveredAt, style: .time)
                                .font(.caption).foregroundStyle(.secondary)
                        }
                        .padding(.vertical, 4)
                    }
                } header: {
                    Text("已发现主机")
                } footer: {
                    Text("时间为单次 TCP 探测耗时，不是 ICMP 延迟。拒绝响应也可能来自中间设备；超时不代表离线。首次授权后若扫描中止，请重新开始。")
                }
            }
            .navigationTitle("LanScope")
            .onChange(of: scenePhase) { _, phase in
                if phase == .background { model.stop(background: true) }
            }
        }
    }
}
