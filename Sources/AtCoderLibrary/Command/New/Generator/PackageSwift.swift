struct PackageSwift: Generator {
    let contestName: String
    let alphabets: [Character]
    let fileName = "Package.swift"
    let directory: String? = nil
    var source: String {
        """
        // swift-tools-version:5.3
        import PackageDescription

        let package = Package(
            name: "\(contestName.uppercased())",
            dependencies: [],
            targets: [
        \(alphabets.sorted()
                    .map {
        """
                .target(name: "\($0)", swiftSettings: [.unsafeFlags(["-Ounchecked"])]),
                .testTarget(name: "\($0)Tests", dependencies: ["\($0)", "TestLibrary"]),
        """
                    }
                    .joined(separator: "\n"))
                .target(name: "TestLibrary", path: "Tests/TestLibrary"),
            ]
        )
        """
    }
}
