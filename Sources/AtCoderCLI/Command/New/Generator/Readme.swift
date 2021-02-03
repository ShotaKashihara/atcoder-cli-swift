struct Readme: Generator {
    let contest: Contest
    let problems: [Problem]
    let fileName = "README.md"
    let directory: String? = nil
    var source: String {
        """
        # [\(contest.name)](\(contest.url))

        問題名 | 実行時間制限 | メモリ制限
        :-- | --: | --:
        \(problems.map { problem in """
        [\(problem.context.alphabet) \(problem.name)](\(problem.url)) | \(problem.timeLimit/1000) sec | \(problem.memoryLimit) MB
        """}.joined(separator: "\n"))

        """
    }
}
