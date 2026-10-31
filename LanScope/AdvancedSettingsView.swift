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

    // Live count of the ports that would be saved; nil while the text is not valid yet.
    private var portCount: Int? {
        (try? ScanSettings.parsePorts(portsText))?.count
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 12) {
                    VStack(alignment: .leading, spacing: 10) {
                        Toggle("只扫描 ping 成功的设备", isOn: $pingOnly)
                            .font(.headline)
                            .tint(Theme.mint)
                        Text("开启后先进行 ICMP ping，只有回应的设备才会扫描端口。关闭后直接探测所有目标的指定 TCP 端口。不回应 ping 不代表设备离线。")
                            .font(.footnote)
                            .foregroundStyle(Theme.secondary)
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .card(radius: 22)

                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Text("TCP 扫描端口")
                                .font(.headline)
                            Spacer(minLength: 8)
                            if let portCount {
                                Chip(text: "\(portCount) 个")
                            }
                        }
                        TextField(ScanSettings().portsText, text: $portsText, axis: .vertical)
                            .lineLimit(3...8)
                            .font(Font.mono(.subheadline))
                            .keyboardType(.numbersAndPunctuation)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                            .accessibilityLabel("TCP 扫描端口")
                            .padding(12)
                            .background(Theme.background, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                            .overlay(RoundedRectangle(cornerRadius: 14, style: .continuous)
                                .strokeBorder(Color.white.opacity(0.1), lineWidth: 1))
                        if let error {
                            Text(error)
                                .font(.footnote)
                                .foregroundStyle(Theme.coral)
                        }
                        Text("输入 1–65535 的端口号，以逗号或空格分隔。重复端口自动合并；端口越多，扫描耗时越长。")
                            .font(.footnote)
                            .foregroundStyle(Theme.secondary)
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .card(radius: 22)

                    Button {
                        pingOnly = true
                        portsText = ScanSettings().portsText
                        error = nil
                    } label: {
                        Label("恢复默认设置", systemImage: "arrow.counterclockwise")
                    }
                    .buttonStyle(ActionButtonStyle(kind: .secondary, compact: true))

                    Text("点击保存后仅保存在当前设备，下次启动自动沿用。")
                        .font(.footnote)
                        .foregroundStyle(Theme.tertiary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 8)
                }
                .padding(.horizontal, 20)
                .padding(.top, 8)
                .padding(.bottom, 24)
                .frame(maxWidth: 640)
                .frame(maxWidth: .infinity)
            }
            .scrollDismissesKeyboard(.interactively)
            .background(Theme.sheet)
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
                    .fontWeight(.bold)
                    .disabled(model.running)
                }
            }
        }
        .tint(Theme.mint)
        .preferredColorScheme(.dark)
    }
}
