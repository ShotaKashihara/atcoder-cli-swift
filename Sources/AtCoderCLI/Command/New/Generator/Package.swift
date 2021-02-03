struct Package: Generator {
    let contestName: String
    let problemsAlphabets: [String]
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
        \(problemsAlphabets
                    .map {
        """
                .target(name: "\($0)"),
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
