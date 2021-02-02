// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "ABC190",
    dependencies: [],
    targets: [
        .target(name: "F"),
        .testTarget(name: "FTests", dependencies: ["F", "TestLibrary"]),
        .target(name: "E"),
        .testTarget(name: "ETests", dependencies: ["E", "TestLibrary"]),
        .target(name: "A"),
        .testTarget(name: "ATests", dependencies: ["A", "TestLibrary"]),
        .target(name: "C"),
        .testTarget(name: "CTests", dependencies: ["C", "TestLibrary"]),
        .target(name: "D"),
        .testTarget(name: "DTests", dependencies: ["D", "TestLibrary"]),
        .target(name: "B"),
        .testTarget(name: "BTests", dependencies: ["B", "TestLibrary"]),
        .target(name: "TestLibrary", path: "Tests/TestLibrary"),
    ]
)