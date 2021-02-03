struct Source: Generator {
    let problem: Problem
    let fileName = "main.swift"
    var directory: String? { "Sources/\(problem.context.alphabet)" }
    var source: String {
        """
        // \(problem.context.alphabet) - \(problem.name)
        // \(problem.url)
        import Foundation

        """
    }
}
