import XCTest
import Foundation
@testable import AtCoderLibrary

final class TestTests: XCTestCase {
    func test() throws {
        let problem = Problem(
            url: "https://example.com/p_1".url,
            tests: [
                .init(input: "10 2\n20 3\n30 4\n", output: "5\n20\n3\n"),
                .init(input: "199 2\n", output: "1992\n"),
            ],
            name: "",
            context: .init(contest: .empty, alphabet: "A"),
            memoryLimit: 1000,
            timeLimit: 2000
        )
        let test = Test(problem: problem)
        let expected = """
        import XCTest
        import TestLibrary

        final class ATests: XCTestCase, TimeLimit {
            let timeLimit: TimeInterval = 2.0

            func testExample() throws {
                let cases: [TestCase] = [
                    (#filePath, #line, \"""
                        10 2
                        20 3
                        30 4
                        \""", \"""
                        5
                        20
                        3
                        \"""),
                    (#filePath, #line, \"""
                        199 2
                        \""", \"""
                        1992
                        \"""),
                ]
                try cases.forEach(solve)
            }
        }
        """
        XCTAssertEqual(test.source, expected)
    }
}
