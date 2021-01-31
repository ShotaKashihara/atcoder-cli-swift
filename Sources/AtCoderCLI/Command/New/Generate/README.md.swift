extension Generate {
    static func readme(taskName: String, problemsAlphabets: [String]) throws {
//        let readme = """
//# AtCoder Beginner Contest 190
//
//  | 問題名 | 実行時間制限 | メモリ制限
//-- | :-- | --: | --:
//A | Very Very Primitive Game | 2 sec | 1024 MB
//B | Magic 3 | 2 sec | 1024 MB
//C | Bowls and Dishes | 2 sec | 1024 MB
//D | Staircase Sequences | 2 sec | 1024 MB
//E | Magical Ornament | 2 sec | 1024 MB
//F | Shift and Inversions | 2 sec | 1024 MB
//
//
//        // swift-tools-version:5.3
//        import PackageDescription
//
//        let package = Package(
//            name: "\(taskName.uppercased())",
//            dependencies: [],
//            targets: [
//        \(problemsAlphabets
//                    .map {
//        """
//                .target(name: "\($0)"),
//                .testTarget(name: "\($0)Tests", dependencies: ["\($0)", "TestLibrary"]),
//        """
//                    }
//                    .joined(separator: "\n"))
//                .target(name: "TestLibrary", path: "Tests/TestLibrary"),
//            ]
//        )
//        """
//        try readme.write(toFile: "README.md", atomically: true, encoding: .utf8)
    }
}
