struct Readme: CodeTemplate {
    let contest: Contest
    let problems: [Problem]
    let fileName = "README.md"
    let directory: String? = nil
    var source: String {
        let problems = self.problems.sorted(by: {
            $0.context.alphabet < $1.context.alphabet
        })
        return """
        # [\(contest.name)](\(contest.url))

        問題名 | 実行時間制限 | メモリ制限
        :-- | --: | --:
        \(problems.map { problem in """
        [\(problem.context.alphabet) \(problem.name)](\(problem.url)) | \(Double(problem.timeLimit)/1000) sec | \(problem.memoryLimit) MB
        """}.joined(separator: "\n"))

        """
    }
}
