// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "LanScopeCore",
    products: [.library(name: "LanScopeCore", targets: ["LanScopeCore"])],
    targets: [
        .target(name: "LanScopeCore", path: "Core"),
        .testTarget(name: "LanScopeCoreTests", dependencies: ["LanScopeCore"], path: "Tests")
    ]
)
