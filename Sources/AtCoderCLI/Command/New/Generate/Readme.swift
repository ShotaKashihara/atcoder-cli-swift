extension Generator {
    static func readme(contest: Contest, problems: [Problem]) throws {
        let readme = """
        # [\(contest.name)](\(contest.url))
        
        問題名 | 実行時間制限 | メモリ制限
        :-- | --: | --:
        \(problems.map { problem in """
        [\(problem.context.alphabet) \(problem.name)](\(problem.url)) | \(problem.timeLimit/1000) sec | \(problem.memoryLimit) MB
        """}.joined(separator: "\n"))

        """
        try readme.write(toFile: "README.md", atomically: true, encoding: .utf8)
    }
}
