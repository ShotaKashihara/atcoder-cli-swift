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
        \(problem.tests.map(Self.testCase).joined(separator: "\n"))
                ]
                try cases.forEach(solve)
            }
        }
        """
    }

    private static func testCase(_ test: Problem.Test) -> String {
        let inputs = test.input.split(separator: "\n")
        let outputs = test.output.split(separator: "\n")
        return """
                        (#filePath, #line, \"""
            \(inputs.map { "                \($0)" }.joined(separator: "\n"))
                            \""", \"""
            \(outputs.map { "                \($0)" }.joined(separator: "\n"))
                            \"""),
            """
    }
}
