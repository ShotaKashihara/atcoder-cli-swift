import Foundation

extension Generator {
    static func test(problem: Problem) throws {
        let className = "\(problem.context.alphabet)Tests"
        let source = """
        import XCTest
        import TestLibrary

        final class \(className): XCTestCase {
            func testExample() throws {
                let cases: [(file: StaticString, line: UInt, input: String, expected: String)] = [
        \(problem.tests.map { """
                    (#filePath, #line, \"\($0.input.replacingOccurrences(of: "\n", with: "\\n"))\", \"\($0.output.replacingOccurrences(of: "\n", with: "\\n"))\"),
        """ }.joined(separator: "\n"))
                ]
                try cases.forEach(solve)
            }
        }
        """
        let directory = "Tests/\(className)"
        let fileName = "\(className).swift"
        try FileManager.default.createDirectory(atPath: directory, withIntermediateDirectories: true)
        try source.write(toFile: "\(directory)/\(fileName)", atomically: true, encoding: .utf8)
    }
}
