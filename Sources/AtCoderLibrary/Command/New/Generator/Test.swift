struct Test: Generator {
    let problem: Problem
    var className: String { "\(problem.context.alphabet)Tests" }
    var fileName: String { "\(className).swift" }
    var directory: String? { "Tests/\(className)" }
    var source: String {
        """
        import XCTest
        import TestLibrary

        final class \(className): XCTestCase, TimeLimit {
            let timeLimit: TimeInterval = \(Double(problem.timeLimit)/1000)

            func testExample() throws {
                let cases: [TestCase] = [
        \(problem.tests.map { """
                    (#filePath, #line, \"\($0.input.replacingOccurrences(of: "\n", with: "\\n"))\", \"\($0.output.replacingOccurrences(of: "\n", with: "\\n"))\"),
        """ }.joined(separator: "\n"))
                ]
                try cases.forEach(solve)
            }
        }
        """
    }
}
