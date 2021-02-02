extension Generator {
    static func packageSwift(taskName: String, problemsAlphabets: [String]) throws {
        let package = """
        // swift-tools-version:5.3
        import PackageDescription

        let package = Package(
            name: "\(taskName.uppercased())",
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
        let fileName = "Package.swift"
        try package.write(toFile: fileName, atomically: true, encoding: .utf8)
    }
}
