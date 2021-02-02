// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "ABC190",
    dependencies: [],
    targets: [
        .target(name: "A"),
        .target(name: "B"),
        .target(name: "C"),
        .target(name: "D"),
        .target(name: "E"),
        .target(name: "F"),
        .testTarget(name: "ATests", dependencies: ["A", "TestLibrary"]),
        .testTarget(name: "BTests", dependencies: ["B", "TestLibrary"]),
        .testTarget(name: "CTests", dependencies: ["C", "TestLibrary"]),
        .testTarget(name: "DTests", dependencies: ["D", "TestLibrary"]),
        .testTarget(name: "ETests", dependencies: ["E", "TestLibrary"]),
        .testTarget(name: "FTests", dependencies: ["F", "TestLibrary"]),
        .target(name: "TestLibrary", path: "Tests/TestLibrary"),
    ]
)
