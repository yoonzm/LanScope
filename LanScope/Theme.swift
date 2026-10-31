import SwiftUI

// Visual language of the radar-style interface: ink background, one mint "signal" colour,
// monospaced numerals for everything that is an address or a port.
enum Theme {
    static let background = Color(hex: 0x080C10)
    static let sheet = Color(hex: 0x0E141A)
    static let surface = Color(hex: 0x10161D)
    static let raised = Color(hex: 0x161E27)
    static let inset = Color(hex: 0x0B1015)
    static let selected = Color(hex: 0x252F3B)
    static let hairline = Color.white.opacity(0.07)
    static let text = Color(hex: 0xEAF0F4)
    static let secondary = Color(hex: 0x93A1AD)
    static let tertiary = Color(hex: 0x7C8996)
    static let mint = Color(hex: 0x4FE3B3)
    static let sky = Color(hex: 0x7DB7FF)
    static let amber = Color(hex: 0xFFB454)
    static let coral = Color(hex: 0xFF8A78)
    static let onMint = Color(hex: 0x04130E)
}

extension Color {
    init(hex: UInt32, opacity: Double = 1) {
        self.init(.sRGB,
                  red: Double((hex >> 16) & 0xFF) / 255,
                  green: Double((hex >> 8) & 0xFF) / 255,
                  blue: Double(hex & 0xFF) / 255,
                  opacity: opacity)
    }
}

extension Font {
    // Text-style based so Dynamic Type keeps working for addresses and ports.
    static func mono(_ style: Font.TextStyle, weight: Font.Weight = .regular) -> Font {
        Font.system(style, design: .monospaced, weight: weight)
    }
}

extension Date {
    // "今天 18:42" / "昨天 09:41" / "2026/10/27 20:30"
    var lanScopeStamp: String {
        let calendar = Calendar.current
        let time = formatted(date: .omitted, time: .shortened)
        if calendar.isDateInToday(self) { return "今天 \(time)" }
        if calendar.isDateInYesterday(self) { return "昨天 \(time)" }
        return formatted(date: .numeric, time: .shortened)
    }
}

// MARK: - Background

private struct DotGrid: View {
    var body: some View {
        Canvas { context, size in
            let step: CGFloat = 22
            var path = Path()
            var y: CGFloat = 0
            while y < size.height {
                var x: CGFloat = 0
                while x < size.width {
                    path.addEllipse(in: CGRect(x: x, y: y, width: 1, height: 1))
                    x += step
                }
                y += step
            }
            context.fill(path, with: .color(Color.white.opacity(0.045)))
        }
        .allowsHitTesting(false)
        .accessibilityHidden(true)
    }
}

extension View {
    func appBackground() -> some View {
        background {
            ZStack {
                Theme.background
                DotGrid()
            }
            .ignoresSafeArea()
        }
    }

    func card(radius: CGFloat = 20) -> some View {
        background(Theme.surface, in: RoundedRectangle(cornerRadius: radius, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: radius, style: .continuous)
                .strokeBorder(Theme.hairline, lineWidth: 1))
    }
}

// MARK: - Controls

struct Chip: View {
    enum Tone { case mint, sky, amber, neutral }

    let text: String
    var tone: Tone = .mint
    var mono = true

    private var foreground: Color {
        switch tone {
        case .mint: return Theme.mint
        case .sky: return Theme.sky
        case .amber: return Theme.amber
        case .neutral: return Theme.secondary
        }
    }

    private var fill: Color {
        switch tone {
        case .mint: return Theme.mint.opacity(0.12)
        case .sky: return Theme.sky.opacity(0.12)
        case .amber: return Theme.amber.opacity(0.12)
        case .neutral: return Theme.raised
        }
    }

    private var stroke: Color {
        switch tone {
        case .mint: return Theme.mint.opacity(0.25)
        case .sky: return Theme.sky.opacity(0.28)
        case .amber: return Theme.amber.opacity(0.3)
        case .neutral: return Color.white.opacity(0.08)
        }
    }

    var body: some View {
        Text(text)
            .font(mono ? Font.mono(.caption) : Font.caption)
            .foregroundStyle(foreground)
            .lineLimit(1)
            .padding(.horizontal, 8)
            .padding(.vertical, 3)
            .background(fill, in: Capsule())
            .overlay(Capsule().strokeBorder(stroke, lineWidth: 1))
    }
}

struct IconTile: View {
    let systemName: String
    var tint: Color = Theme.mint

    var body: some View {
        Image(systemName: systemName)
            .font(.system(size: 20, weight: .semibold))
            .foregroundStyle(tint)
            .frame(width: 44, height: 44)
            .background(Theme.raised, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
            .accessibilityHidden(true)
    }
}

struct ActionButtonStyle: ButtonStyle {
    enum Kind { case primary, danger, secondary }

    var kind: Kind = .primary
    var compact = false

    private var foreground: Color {
        switch kind {
        case .primary: return Theme.onMint
        case .danger: return Theme.coral
        case .secondary: return Theme.text
        }
    }

    private var fill: Color {
        switch kind {
        case .primary: return Theme.mint
        case .danger: return Theme.coral.opacity(0.14)
        case .secondary: return Color.clear
        }
    }

    private var stroke: Color {
        switch kind {
        case .primary: return Color.clear
        case .danger: return Theme.coral.opacity(0.5)
        case .secondary: return Color.white.opacity(0.16)
        }
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(compact ? Font.body.weight(.semibold) : Font.headline.weight(.bold))
            .foregroundStyle(foreground)
            .frame(maxWidth: .infinity, minHeight: compact ? 48 : 56)
            .background(fill, in: RoundedRectangle(cornerRadius: compact ? 16 : 18, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: compact ? 16 : 18, style: .continuous)
                .strokeBorder(stroke, lineWidth: 1))
            .opacity(configuration.isPressed ? 0.8 : 1)
    }
}

// Wraps its children onto new lines, used for port and server chips.
struct FlowLayout: Layout {
    var spacing: CGFloat = 6

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let maxWidth = proposal.width ?? .infinity
        let limit = ProposedViewSize(width: maxWidth.isFinite ? maxWidth : nil, height: nil)
        var x: CGFloat = 0
        var y: CGFloat = 0
        var rowHeight: CGFloat = 0
        var width: CGFloat = 0
        for subview in subviews {
            let size = subview.sizeThatFits(limit)
            if x > 0, x + size.width > maxWidth {
                y += rowHeight + spacing
                x = 0
                rowHeight = 0
            }
            x += size.width + spacing
            width = max(width, x - spacing)
            rowHeight = max(rowHeight, size.height)
        }
        return CGSize(width: width, height: y + rowHeight)
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let limit = ProposedViewSize(width: bounds.width, height: nil)
        var x = bounds.minX
        var y = bounds.minY
        var rowHeight: CGFloat = 0
        for subview in subviews {
            let size = subview.sizeThatFits(limit)
            if x > bounds.minX, x + size.width > bounds.maxX {
                y += rowHeight + spacing
                x = bounds.minX
                rowHeight = 0
            }
            subview.place(at: CGPoint(x: x, y: y), proposal: ProposedViewSize(size))
            x += size.width + spacing
            rowHeight = max(rowHeight, size.height)
        }
    }
}

// Thin progress bar for unfinished history records.
struct SlimProgress: View {
    let value: Double
    var tint: Color = Theme.amber

    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .leading) {
                Capsule().fill(Color(hex: 0x1B2530))
                Capsule().fill(tint)
                    .frame(width: proxy.size.width * CGFloat(min(max(value, 0), 1)))
            }
        }
        .frame(height: 4)
        .accessibilityHidden(true)
    }
}
