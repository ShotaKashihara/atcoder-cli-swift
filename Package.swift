// swift-tools-version:5.3
import PackageDescription
import class Foundation.ProcessInfo

let macOSPlatform: SupportedPlatform
if let deploymentTarget = ProcessInfo.processInfo.environment["SWIFTPM_MACOS_DEPLOYMENT_TARGET"] {
    macOSPlatform = .macOS(deploymentTarget)
} else {
    macOSPlatform = .macOS(.v10_10)
}

let package = Package(
    name: "AtCoderCLI",
    platforms: [macOSPlatform],
    products: [
        .executable(name: "accs", targets: ["AtCoderCLI"]),
        .library(name: "AtCoderLibrary", targets: ["AtCoderLibrary"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.3.0"),
        .package(url: "https://github.com/kareman/SwiftShell", from: "5.1.0")
    ],
    targets: [
        .target(
            name: "AtCoderCLI",
            dependencies: ["AtCoderLibrary"]
        ),
        .target(
            name: "AtCoderLibrary",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                "SwiftShell",
            ]
        ),
        .testTarget(
            name: "AtCoderLibraryTests",
            dependencies: ["AtCoderLibrary"]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
