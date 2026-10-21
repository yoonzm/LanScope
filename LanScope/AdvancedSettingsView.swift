import SwiftUI

@MainActor
struct AdvancedSettingsView: View {
    @ObservedObject var model: ScanViewModel
    @Environment(\.dismiss) private var dismiss
    @State private var pingOnly: Bool
    @State private var portsText: String
    @State private var error: String?

    init(model: ScanViewModel) {
        self.model = model
        _pingOnly = State(initialValue: model.settings.pingOnly)
        _portsText = State(initialValue: model.settings.portsText)
    }

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Toggle("只扫描 ping 成功的设备", isOn: $pingOnly)
                } footer: {
                    Text("开启后先进行 ICMP ping，只有回应的设备才会扫描端口。关闭后直接探测所有目标的指定 TCP 端口。不回应 ping 不代表设备离线。")
                }
                Section {
                    TextField("80, 443, 22, 445", text: $portsText, axis: .vertical)
                        .keyboardType(.numbersAndPunctuation)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .accessibilityLabel("TCP 扫描端口")
                    if let error { Text(error).font(.footnote).foregroundStyle(.red) }
                } header: {
                    Text("TCP 扫描端口")
                } footer: {
                    Text("输入 1–65535 的端口号，以逗号或空格分隔。重复端口自动合并；端口越多，扫描耗时越长。")
                }
                Section {
                    Button("恢复默认设置") {
                        pingOnly = true
                        portsText = ScanSettings().portsText
                        error = nil
                    }
                } footer: {
                    Text("点击保存后仅保存在当前设备，下次启动自动沿用。")
                }
            }
            .navigationTitle("高级设置")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) { Button("取消") { dismiss() } }
                ToolbarItem(placement: .confirmationAction) {
                    Button("保存") {
                        do {
                            try model.saveSettings(pingOnly: pingOnly, portsText: portsText)
                            dismiss()
                        } catch { self.error = error.localizedDescription }
                    }
                    .disabled(model.running)
                }
            }
        }
    }
}
