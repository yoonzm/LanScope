import SwiftUI

enum AssetTab { case ip, web }

// "IP / Web" tabs plus the matching list. Shared by the live scan page and the history detail.
struct DiscoveredAssetsView: View {
    let hosts: [HostResult]
    var running = false
    var historical = false
    var localAddress: String?
    var localWiFiName: String?
    @State private var tab: AssetTab = .ip

    private var services: [WebService] { hosts.flatMap { $0.webServices ?? [] } }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("已发现资产")
                .font(.footnote.weight(.semibold))
                .foregroundStyle(Theme.secondary)
                .accessibilityAddTraits(.isHeader)
            AssetPicker(tab: $tab, ipCount: hosts.count, webCount: services.count)

            VStack(spacing: 10) {
                switch tab {
                case .ip:
                    if let localAddress {
                        LocalDeviceCard(address: localAddress, wifiName: localWiFiName)
                    }
                    if hosts.isEmpty {
                        EmptyAssetsRow(text: running ? String(localized: "正在扫描…") : String(localized: "暂无已发现资产"))
                    }
                    ForEach(hosts) { host in
                        HostCard(host: host)
                    }
                case .web:
                    if services.isEmpty {
                        EmptyAssetsRow(text: running ? String(localized: "正在扫描…") : String(localized: "暂无已确认的 Web 资产"))
                    }
                    ForEach(services) { service in
                        WebServiceCard(service: service)
                    }
                }
            }

            if historical {
                Text("这是扫描当时的结果，不代表设备当前状态。")
                    .font(.footnote)
                    .foregroundStyle(Theme.tertiary)
            }
        }
    }
}

private struct AssetPicker: View {
    @Binding var tab: AssetTab
    let ipCount: Int
    let webCount: Int

    var body: some View {
        HStack(spacing: 0) {
            segment("IP", count: ipCount, target: .ip, tint: Theme.mint)
            segment("Web", count: webCount, target: .web, tint: Theme.sky)
        }
        .padding(3)
        .background(Theme.inset, in: RoundedRectangle(cornerRadius: 13, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: 13, style: .continuous)
            .strokeBorder(Color.white.opacity(0.06), lineWidth: 1))
        .accessibilityElement(children: .contain)
        .accessibilityLabel("资产类型")
    }

    private func segment(_ title: String, count: Int, target: AssetTab, tint: Color) -> some View {
        let selected = tab == target
        return Button {
            tab = target
        } label: {
            HStack(spacing: 4) {
                Text(title)
                Text(String(count))
                    .font(Font.mono(.footnote))
                    .foregroundStyle(selected ? tint : Theme.secondary)
            }
            .font(.subheadline.weight(.semibold))
            .foregroundStyle(selected ? Theme.text : Theme.secondary)
            .frame(maxWidth: .infinity, minHeight: 34)
            .contentShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .background(selected ? Theme.selected : Color.clear,
                        in: RoundedRectangle(cornerRadius: 10, style: .continuous))
        }
        .buttonStyle(.plain)
        .accessibilityLabel("\(title)，\(count) 项")
        .accessibilityAddTraits(selected ? AccessibilityTraits.isSelected : [])
    }
}

private struct EmptyAssetsRow: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.subheadline)
            .foregroundStyle(Theme.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(16)
            .card()
    }
}

// MARK: - IP

enum DeviceSymbol {
    // Icon for the untranslated type label produced by DeviceIdentity.kind; unknown devices get a generic one.
    static func name(for kind: String?) -> String {
        guard let kind else { return "network" }
        if kind.contains("Apple TV") || kind.contains("Android TV") || kind.contains("Chromecast") { return "tv" }
        if kind.contains("HomePod") { return "hifispeaker" }
        if kind.contains("iPhone") { return "iphone" }
        if kind.contains("iPad") { return "ipad" }
        if kind.contains("Watch") { return "applewatch" }
        if kind.contains("笔记本") { return "laptopcomputer" }
        if kind.contains("NAS") { return "externaldrive" }
        if kind.contains("打印机") { return "printer" }
        if kind.contains("HomeKit") { return "house" }
        if kind == "Mac" || kind == "电脑" { return "desktopcomputer" }
        return "dot.radiowaves.left.and.right"
    }
}

struct HostCard: View {
    let host: HostResult

    // Only ports that accepted a connection are shown; older single-port records are kept readable.
    private var openPorts: [UInt16] {
        if let ports = host.ports { return ports.filter { $0.state == .open }.map { $0.port } }
        if let port = host.port, host.open == true { return [port] }
        return []
    }

    // Explain cards that would otherwise show nothing below the address.
    private var hint: String? {
        guard openPorts.isEmpty, host.ports != nil, host.open != true else { return nil }
        if host.pingMilliseconds != nil { return String(localized: "仅响应 Ping，未发现开放端口") }
        if host.identity != nil { return String(localized: "仅通过 Bonjour 发现，未发现开放端口") }
        return nil
    }

    var body: some View {
        let identity = host.identity
        HStack(alignment: .top, spacing: 12) {
            IconTile(systemName: DeviceSymbol.name(for: identity?.kind),
                     tint: identity?.kind == nil ? Theme.secondary : Theme.mint)
            VStack(alignment: .leading, spacing: 3) {
                if let name = identity?.displayName {
                    Text(name)
                        .font(.headline)
                        .lineLimit(2)
                    Text(host.ip)
                        .font(Font.mono(.footnote))
                        .foregroundStyle(Theme.secondary)
                } else {
                    Text(host.ip)
                        .font(Font.mono(.headline, weight: .semibold))
                }
                if let summary = identity?.summary {
                    Text(summary)
                        .font(.footnote)
                        .foregroundStyle(Theme.secondary)
                }
                if !openPorts.isEmpty {
                    FlowLayout {
                        // String(port) avoids locale grouping such as "5,000".
                        ForEach(openPorts, id: \.self) { port in
                            Chip(text: String(port))
                        }
                    }
                    .padding(.top, 4)
                }
                if let hint {
                    Text(hint)
                        .font(.caption)
                        .foregroundStyle(Theme.tertiary)
                        .padding(.top, 1)
                }
            }
            Spacer(minLength: 0)
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .card()
        .accessibilityElement(children: .combine)
    }
}


// This device. Listed so the user can tell which address is their own; it is never scanned.
struct LocalDeviceCard: View {
    let address: String
    let wifiName: String?

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            IconTile(systemName: "iphone", tint: Theme.sky)
            VStack(alignment: .leading, spacing: 3) {
                Text("本机")
                    .font(.headline)
                Text(address)
                    .font(Font.mono(.footnote))
                    .foregroundStyle(Theme.secondary)
                if let wifiName, !wifiName.isEmpty {
                    Text(wifiName)
                        .font(.footnote)
                        .foregroundStyle(Theme.secondary)
                }
                Chip(text: String(localized: "不参与扫描"), tone: .neutral, mono: false)
                    .padding(.top, 4)
            }
            Spacer(minLength: 0)
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .card()
        .accessibilityElement(children: .combine)
    }
}

// MARK: - Web


struct WebServiceCard: View {
    let service: WebService

    var body: some View {
        if let url = URL(string: service.url) {
            Link(destination: url) {
                content(scheme: url.scheme?.uppercased() ?? "HTTP")
            }
            .buttonStyle(.plain)
            .accessibilityHint("在浏览器中打开")
        }
    }

    private func content(scheme: String) -> some View {
        HStack(alignment: .top, spacing: 12) {
            IconTile(systemName: "globe", tint: Theme.sky)
            VStack(alignment: .leading, spacing: 4) {
                if let title = service.title {
                    Text(title)
                        .font(.headline)
                        .lineLimit(2)
                    Text(service.url)
                        .font(Font.mono(.caption))
                        .foregroundStyle(Theme.secondary)
                        .lineLimit(2)
                } else {
                    // No page title: fall back to the address.
                    Text(service.url)
                        .font(Font.mono(.subheadline, weight: .semibold))
                        .lineLimit(2)
                }
                FlowLayout {
                    Chip(text: "\(scheme) · \(service.statusCode)", tone: .sky)
                    if let server = service.server {
                        Chip(text: server, tone: .neutral)
                    }
                }
                .padding(.top, 4)
                if service.certificateTrusted == false {
                    Label("证书校验未通过", systemImage: "exclamationmark.shield")
                        .font(.caption)
                        .foregroundStyle(Theme.amber)
                        .padding(.top, 2)
                }
                if let redirect = service.redirectURL {
                    Text("跳转至：\(redirect)")
                        .font(.caption)
                        .foregroundStyle(Theme.secondary)
                        .lineLimit(2)
                }
            }
            Spacer(minLength: 0)
            Image(systemName: "arrow.up.right")
                .font(.footnote.weight(.semibold))
                .foregroundStyle(Theme.tertiary)
                .padding(.top, 4)
                .accessibilityHidden(true)
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .card()
    }
}
