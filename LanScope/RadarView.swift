import SwiftUI

// A discovered host drawn as a dot on the radar. Position is derived from the address so the
// same device always lands on the same spot; it carries no network meaning.
struct RadarBlip: Identifiable, Equatable {
    let id: String
    let angle: Double   // radians, clockwise from 12 o'clock
    let depth: Double   // 0...1, from the inner ring to the outer ring
    let isWeb: Bool

    static func blips(from hosts: [HostResult]) -> [RadarBlip] {
        hosts.map { host in
            let octets = host.ip.split(separator: ".").compactMap { Int($0) }
            let last = octets.last ?? 0
            let third = octets.count > 2 ? octets[2] : 0
            return RadarBlip(id: host.ip,
                             angle: Double(last) / 256 * 2 * Double.pi,
                             depth: Double((last * 37 + third * 17) % 100) / 100,
                             isWeb: !(host.webServices ?? []).isEmpty)
        }
    }
}

// The large scan radar. Content for the centre is supplied by the caller as an overlay.
struct RadarView: View {
    var progress: Double? = nil
    var sweeping = false
    var blips: [RadarBlip] = []
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    var body: some View {
        GeometryReader { proxy in
            let side = min(proxy.size.width, proxy.size.height)
            let inner = side * 260 / 300
            ZStack {
                if sweeping && !reduceMotion {
                    RadarSweep()
                        .frame(width: inner, height: inner)
                }
                RadarFace(blips: blips)
                    .frame(width: side, height: side)
                if let progress {
                    Circle()
                        .trim(from: 0, to: CGFloat(min(max(progress, 0), 1)))
                        .stroke(Theme.mint, style: StrokeStyle(lineWidth: max(2, side * 4 / 300), lineCap: .round))
                        .rotationEffect(.degrees(-90))
                        .frame(width: inner, height: inner)
                        .animation(.easeOut(duration: 0.3), value: progress)
                }
            }
            .frame(width: proxy.size.width, height: proxy.size.height)
        }
        .aspectRatio(1, contentMode: .fit)
        .accessibilityHidden(true)
    }
}

private struct RadarFace: View {
    let blips: [RadarBlip]

    var body: some View {
        Canvas { context, size in
            let s = size.width / 300
            let center = CGPoint(x: size.width / 2, y: size.height / 2)

            func ring(_ radius: CGFloat) -> Path {
                Path(ellipseIn: CGRect(x: center.x - radius * s, y: center.y - radius * s,
                                       width: radius * 2 * s, height: radius * 2 * s))
            }

            context.stroke(ring(144), with: .color(Color.white.opacity(0.2)),
                           style: StrokeStyle(lineWidth: 5 * s, dash: [1.2 * s, 23.93 * s]))
            context.stroke(ring(130), with: .color(Color.white.opacity(0.1)), lineWidth: 1.5 * s)
            context.stroke(ring(94), with: .color(Color.white.opacity(0.1)),
                           style: StrokeStyle(lineWidth: 1.5 * s, lineCap: .round, dash: [2 * s, 6 * s]))
            context.stroke(ring(58), with: .color(Color.white.opacity(0.08)), lineWidth: 1.5 * s)

            var cross = Path()
            cross.move(to: CGPoint(x: center.x - 130 * s, y: center.y))
            cross.addLine(to: CGPoint(x: center.x + 130 * s, y: center.y))
            cross.move(to: CGPoint(x: center.x, y: center.y - 130 * s))
            cross.addLine(to: CGPoint(x: center.x, y: center.y + 130 * s))
            context.stroke(cross, with: .color(Color.white.opacity(0.05)), lineWidth: 1)

            for blip in blips {
                let radius = CGFloat(66 + blip.depth * 58) * s
                let point = CGPoint(x: center.x + radius * CGFloat(sin(blip.angle)),
                                    y: center.y - radius * CGFloat(cos(blip.angle)))
                let color = blip.isWeb ? Theme.sky : Theme.mint
                context.fill(Path(ellipseIn: CGRect(x: point.x - 9 * s, y: point.y - 9 * s,
                                                    width: 18 * s, height: 18 * s)),
                             with: .color(color.opacity(0.18)))
                context.fill(Path(ellipseIn: CGRect(x: point.x - 4.5 * s, y: point.y - 4.5 * s,
                                                    width: 9 * s, height: 9 * s)),
                             with: .color(color))
            }
        }
    }
}

// Rotating wedge. The centre is masked out so the number in the middle stays readable.
private struct RadarSweep: View {
    @State private var rotation = 0.0

    var body: some View {
        GeometryReader { proxy in
            Circle()
                .fill(AngularGradient(stops: [
                    .init(color: Theme.mint.opacity(0), location: 0),
                    .init(color: Theme.mint.opacity(0), location: 0.75),
                    .init(color: Theme.mint.opacity(0.3), location: 0.992),
                    .init(color: Theme.mint.opacity(0), location: 1)
                ], center: .center, angle: .degrees(-90)))
                .mask {
                    RadialGradient(stops: [
                        .init(color: Color.clear, location: 0),
                        .init(color: Color.clear, location: 0.46),
                        .init(color: Color.black, location: 0.5),
                        .init(color: Color.black, location: 1)
                    ], center: .center, startRadius: 0, endRadius: proxy.size.width / 2)
                }
                .rotationEffect(.degrees(rotation))
        }
        .onAppear {
            withAnimation(.linear(duration: 4).repeatForever(autoreverses: false)) {
                rotation = 360
            }
        }
    }
}

// Compact radar used as the status badge once a scan has stopped.
struct RadarBadge: View {
    let progress: Double
    let tint: Color
    let symbol: String
    var blips: [RadarBlip] = []

    var body: some View {
        ZStack {
            Canvas { context, size in
                let s = size.width / 88
                let center = CGPoint(x: size.width / 2, y: size.height / 2)

                func ring(_ radius: CGFloat) -> Path {
                    Path(ellipseIn: CGRect(x: center.x - radius * s, y: center.y - radius * s,
                                           width: radius * 2 * s, height: radius * 2 * s))
                }

                context.stroke(ring(40), with: .color(Color.white.opacity(0.1)), lineWidth: 3 * s)
                context.stroke(ring(27), with: .color(Color.white.opacity(0.1)),
                               style: StrokeStyle(lineWidth: 1.2 * s, lineCap: .round, dash: [2 * s, 4 * s]))
                context.stroke(ring(14), with: .color(Color.white.opacity(0.08)), lineWidth: 1.2 * s)

                for blip in blips {
                    let radius = CGFloat(18 + blip.depth * 18) * s
                    let point = CGPoint(x: center.x + radius * CGFloat(sin(blip.angle)),
                                        y: center.y - radius * CGFloat(cos(blip.angle)))
                    let color = blip.isWeb ? Theme.sky : Theme.mint
                    context.fill(Path(ellipseIn: CGRect(x: point.x - 2.4 * s, y: point.y - 2.4 * s,
                                                        width: 4.8 * s, height: 4.8 * s)),
                                 with: .color(color))
                }
            }
            Circle()
                .trim(from: 0, to: CGFloat(min(max(progress, 0), 1)))
                .stroke(tint, style: StrokeStyle(lineWidth: 3, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .padding(4)
            Image(systemName: symbol)
                .font(.system(size: 17, weight: .bold))
                .foregroundStyle(tint)
        }
        .frame(width: 88, height: 88)
        .accessibilityHidden(true)
    }
}
