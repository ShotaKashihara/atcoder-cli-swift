struct Source: CodeTemplate {
    let problem: Problem
    let fileName = "main.swift"
    var directory: String? { "Sources/\(problem.context.alphabet)" }
    var source: String {
        """
        // \(problem.context.alphabet) - \(problem.name)
        // \(problem.url)
        // 実行制限時間: \(Double(problem.timeLimit)/1000) sec
        import Foundation

        """
    }
}
