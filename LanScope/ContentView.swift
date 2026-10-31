import SwiftUI

struct ContentView: View {
    @StateObject private var model = ScanViewModel()
    @Environment(\.scenePhase) private var scenePhase
    @State private var showingSettings = false
    @State private var showingHistory = false
    // Written when the language changes; the new id rebuilds every view so all strings re-resolve.
    @AppStorage(AppLanguage.changeKey) private var language = AppLanguage.system.rawValue

    var body: some View {
        NavigationStack {
            ScanHomeView(model: model, showingSettings: $showingSettings, showingHistory: $showingHistory)
                .toolbar(.hidden, for: .navigationBar)
                .navigationDestination(isPresented: $showingHistory) { ScanHistoryView(model: model) }
                .sheet(isPresented: $showingSettings) {
                    AdvancedSettingsView(model: model)
                        .presentationDragIndicator(.visible)
                        .presentationCornerRadius(32)
                        .presentationBackground(Theme.sheet)
                }
        }
        .id(language)
        .environment(\.locale, AppLocalization.locale)
        .tint(Theme.mint)
        .preferredColorScheme(.dark)
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
}

// MARK: - Home

private struct ScanHomeView: View {
    @ObservedObject var model: ScanViewModel
    @Binding var showingSettings: Bool
    @Binding var showingHistory: Bool

    private enum Phase { case idle, running, finished }

    // Idle until a scan has produced progress or hosts; results stay on screen after it stops.
    private var phase: Phase {
        if model.running { return .running }
        if model.completed > 0 || !model.hosts.isEmpty { return .finished }
        return .idle
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                TopBar(model: model, showingSettings: $showingSettings, showingHistory: $showingHistory)
                switch phase {
                case .idle:
                    IdleSection(model: model, showingSettings: $showingSettings, showingHistory: $showingHistory)
                case .running:
                    RunningSection(model: model)
                case .finished:
                    FinishedSection(model: model)
                }
                if phase != .idle {
                    DiscoveredAssetsView(hosts: model.hosts, running: model.running,
                                         localAddress: model.localAddress, localWiFiName: model.currentWiFiName)
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 24)
            .frame(maxWidth: 640)
            .frame(maxWidth: .infinity)
        }
        .scrollDismissesKeyboard(.interactively)
        .appBackground()
        .safeAreaInset(edge: .bottom, spacing: 0) {
            ActionBar(model: model)
        }
    }
}

private struct TopBar: View {
    @ObservedObject var model: ScanViewModel
    @Binding var showingSettings: Bool
    @Binding var showingHistory: Bool

    var body: some View {
        HStack(spacing: 10) {
            HStack(spacing: 10) {
                Image(systemName: "wifi")
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(Theme.mint)
                Text(model.currentWiFiName ?? "Wi-Fi")
                    .font(.subheadline.weight(.semibold))
                    .lineLimit(1)
                    .truncationMode(.middle)
                Spacer(minLength: 0)
            }
            .padding(.horizontal, 14)
            .frame(minHeight: 44)
            .background(Theme.surface, in: Capsule())
            .overlay(Capsule().strokeBorder(Theme.hairline, lineWidth: 1))
            .accessibilityElement(children: .combine)
            .accessibilityLabel("当前 Wi-Fi：\(model.currentWiFiName ?? tr("未获取到名称"))")

            RoundButton(systemName: "clock.arrow.circlepath",
                        label: tr("扫描历史，共 \(model.history.count) 条"),
                        badge: model.history.count) { showingHistory = true }
            RoundButton(systemName: "slider.horizontal.3", label: tr("高级设置")) { showingSettings = true }
                .disabled(model.running)
        }
        .padding(.top, 8)
    }
}

private struct RoundButton: View {
    let systemName: String
    let label: String
    var badge = 0
    let action: () -> Void
    @Environment(\.isEnabled) private var isEnabled

    var body: some View {
        Button(action: action) {
            Image(systemName: systemName)
                .font(.system(size: 17, weight: .semibold))
                .foregroundStyle(Theme.text)
                .frame(width: 44, height: 44)
                .background(Theme.surface, in: Circle())
                .overlay(Circle().strokeBorder(Theme.hairline, lineWidth: 1))
                .overlay(alignment: .topTrailing) {
                    if badge > 0 {
                        Text(String(min(badge, 99)))
                            .font(.system(size: 11, weight: .bold))
                            .foregroundStyle(Theme.onMint)
                            .padding(.horizontal, 5)
                            .frame(minWidth: 18, minHeight: 18)
                            .background(Theme.mint, in: Capsule())
                            .offset(x: 4, y: -4)
                    }
                }
        }
        .buttonStyle(.plain)
        .opacity(isEnabled ? 1 : 0.38)
        .accessibilityLabel(label)
    }
}

// MARK: - Idle

private struct IdleSection: View {
    @ObservedObject var model: ScanViewModel
    @Binding var showingSettings: Bool
    @Binding var showingHistory: Bool

    // Addresses in the typed range, before the local address is excluded at scan time.
    private var addressCount: Int? {
        (try? IPv4Range(model.cidr))?.addresses.count
    }

    var body: some View {
        VStack(spacing: 14) {
            RadarView()
                .frame(maxWidth: 300)
                .overlay {
                    VStack(spacing: 6) {
                        Text(addressCount.map { String($0) } ?? "—")
                            .font(.system(size: 46, weight: .bold))
                            .monospacedDigit()
                            .minimumScaleFactor(0.5)
                            .lineLimit(1)
                        Text(addressCount == nil ? tr("请输入有效网段") : tr("个地址待扫描"))
                            .font(.footnote)
                            .foregroundStyle(Theme.secondary)
                    }
                    .frame(maxWidth: 110)
                    .accessibilityElement(children: .combine)
                }

            RangeCard(model: model)

            HStack(spacing: 10) {
                SettingChip(title: tr("Ping 筛选"),
                            value: model.settings.pingOnly ? tr("已开启") : tr("已关闭")) {
                    showingSettings = true
                }
                SettingChip(title: tr("TCP 端口"),
                            value: tr("\(model.settings.ports.count) 个")) {
                    showingSettings = true
                }
            }

            StatusMessages(model: model, showsStatus: true)

            if let last = model.history.first {
                Button { showingHistory = true } label: {
                    HStack(spacing: 10) {
                        Image(systemName: "clock.arrow.circlepath")
                            .foregroundStyle(Theme.secondary)
                        Text("上次扫描 · \(last.startedAt.lanScopeStamp) · 发现 \(last.hosts.count) 台")
                            .font(.footnote)
                            .foregroundStyle(Theme.secondary)
                            .lineLimit(1)
                        Spacer(minLength: 0)
                        Image(systemName: "chevron.right")
                            .font(.footnote.weight(.semibold))
                            .foregroundStyle(Theme.tertiary)
                    }
                    .padding(.horizontal, 14)
                    .frame(minHeight: 48)
                    .overlay(RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .strokeBorder(Color.white.opacity(0.14), style: StrokeStyle(lineWidth: 1, dash: [4, 4])))
                    .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
            }

            Text("仅 Wi-Fi · 私有 IPv4 / 链路本地地址 · 最多 1024 个地址。扫描时自动排除本机地址。更换 Wi-Fi 后请确认扫描范围。")
                .font(.caption)
                .foregroundStyle(Theme.tertiary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 8)
        }
    }
}

private struct RangeCard: View {
    @ObservedObject var model: ScanViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("扫描范围")
                .font(.footnote.weight(.medium))
                .foregroundStyle(Theme.secondary)
            TextField("例如 192.168.1.0/24", text: $model.cidr)
                .font(Font.mono(.title2, weight: .semibold))
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .keyboardType(.numbersAndPunctuation)
                .disabled(model.running)
                .accessibilityLabel("IPv4 网段")
            if let message = model.networkMessage {
                Text(tr(message))
                    .font(.footnote)
                    .foregroundStyle(Theme.secondary)
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .card(radius: 22)
    }
}

private struct SettingChip: View {
    let title: String
    let value: String
    let action: () -> Void
    @Environment(\.isEnabled) private var isEnabled

    var body: some View {
        Button(action: action) {
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.caption)
                        .foregroundStyle(Theme.secondary)
                    Text(value)
                        .font(.subheadline.weight(.semibold))
                        .foregroundStyle(Theme.text)
                }
                Spacer(minLength: 4)
                Image(systemName: "chevron.right")
                    .font(.footnote.weight(.semibold))
                    .foregroundStyle(Theme.tertiary)
            }
            .padding(.horizontal, 14)
            .frame(maxWidth: .infinity, minHeight: 56, alignment: .leading)
            .card(radius: 16)
        }
        .buttonStyle(.plain)
        .opacity(isEnabled ? 1 : 0.38)
        .accessibilityElement(children: .combine)
        .accessibilityHint("打开高级设置")
    }
}

// Status text, diagnostics and storage errors that the original list showed under the scan controls.
private struct StatusMessages: View {
    @ObservedObject var model: ScanViewModel
    let showsStatus: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            if showsStatus {
                Text(tr(model.status))
                    .font(.footnote)
                    .foregroundStyle(Theme.secondary)
            }
            if let diagnostic = model.diagnostic {
                Label(diagnostic, systemImage: "exclamationmark.triangle")
                    .font(.footnote)
                    .foregroundStyle(Theme.amber)
            }
            if let error = model.historyError {
                Text(tr(error))
                    .font(.footnote)
                    .foregroundStyle(Theme.amber)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - Running

private struct RunningSection: View {
    @ObservedObject var model: ScanViewModel

    private var progress: Double {
        model.total > 0 ? Double(model.completed) / Double(model.total) : 0
    }

    var body: some View {
        VStack(spacing: 14) {
            RadarView(progress: progress, sweeping: true, blips: RadarBlip.blips(from: model.hosts))
                .frame(maxWidth: 300)
                .overlay {
                    VStack(spacing: 6) {
                        Text(String(model.hosts.count))
                            .font(.system(size: 52, weight: .bold))
                            .monospacedDigit()
                            .minimumScaleFactor(0.5)
                            .lineLimit(1)
                        Text("台设备")
                            .font(.footnote)
                            .foregroundStyle(Theme.secondary)
                    }
                    .frame(maxWidth: 110)
                    .accessibilityElement(children: .combine)
                }

            HStack(alignment: .center, spacing: 12) {
                VStack(alignment: .leading, spacing: 3) {
                    HStack(spacing: 8) {
                        Circle().fill(Theme.mint).frame(width: 7, height: 7)
                        Text(tr(model.status))
                            .font(.subheadline.weight(.semibold))
                    }
                    Text("已完成 \(model.completed) / \(model.total) · \(model.cidr)")
                        .font(.caption)
                        .foregroundStyle(Theme.secondary)
                }
                Spacer(minLength: 8)
                Text("\(Int(progress * 100))%")
                    .font(Font.mono(.title2, weight: .semibold))
                    .foregroundStyle(Theme.mint)
            }
            .accessibilityElement(children: .combine)
            .accessibilityValue("进度 \(Int(progress * 100))%")

            StatusMessages(model: model, showsStatus: false)
        }
    }
}

// MARK: - Finished

private struct FinishedSection: View {
    @ObservedObject var model: ScanViewModel

    private var fraction: Double {
        model.total > 0 ? Double(model.completed) / Double(model.total) : 0
    }
    private var complete: Bool { model.total > 0 && model.completed >= model.total }
    private var tint: Color { complete ? Theme.mint : Theme.amber }
    private var title: String {
        if complete { return tr("扫描完成") }
        return model.canResume ? tr("扫描已暂停") : tr("扫描未完成")
    }
    private var symbol: String {
        if complete { return "checkmark" }
        return model.canResume ? "pause.fill" : "exclamationmark"
    }

    var body: some View {
        VStack(spacing: 12) {
            HStack(spacing: 16) {
                RadarBadge(progress: complete ? 1 : fraction, tint: tint, symbol: symbol,
                           blips: RadarBlip.blips(from: model.hosts))
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.caption.weight(.semibold))
                        .tracking(1)
                        .foregroundStyle(tint)
                    Text("发现 \(model.hosts.count) 台")
                        .font(.title.weight(.bold))
                    Text("已扫描 \(model.completed)/\(model.total) 个地址")
                        .font(.caption)
                        .foregroundStyle(Theme.secondary)
                }
                Spacer(minLength: 0)
            }
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .card(radius: 24)
            .accessibilityElement(children: .combine)

            StatusMessages(model: model, showsStatus: true)
            RangeCard(model: model)
        }
    }
}

// MARK: - Bottom bar

private struct ActionBar: View {
    @ObservedObject var model: ScanViewModel

    private var hasResult: Bool { model.completed > 0 || !model.hosts.isEmpty }

    var body: some View {
        VStack(spacing: 8) {
            if model.running {
                Button { model.stop() } label: {
                    Label("停止扫描", systemImage: "stop.fill")
                }
                .buttonStyle(ActionButtonStyle(kind: .danger))
            } else if model.canResume {
                Button { model.resume() } label: {
                    Label("继续扫描", systemImage: "play.fill")
                }
                .buttonStyle(ActionButtonStyle(kind: .primary))
                Button { model.start() } label: {
                    Label("重新开始扫描", systemImage: "arrow.counterclockwise")
                }
                .buttonStyle(ActionButtonStyle(kind: .secondary, compact: true))
            } else {
                Button { model.start() } label: {
                    Label(hasResult ? tr("重新开始扫描") : tr("开始扫描"),
                          systemImage: hasResult ? "arrow.counterclockwise" : "antenna.radiowaves.left.and.right")
                }
                .buttonStyle(ActionButtonStyle(kind: .primary))
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 12)
        .padding(.bottom, 8)
        .frame(maxWidth: .infinity)
        .background(Theme.background.opacity(0.92).ignoresSafeArea(edges: .bottom))
        .overlay(alignment: .top) {
            Rectangle().fill(Theme.hairline).frame(height: 1)
        }
    }
}
