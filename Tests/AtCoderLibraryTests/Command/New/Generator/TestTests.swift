import XCTest
import Foundation
@testable import AtCoderLibrary

final class TestTests: XCTestCase {
    func test() throws {
        let problem = Problem(
            url: "https://example.com/p_1".url,
            tests: [
                .init(input: "input1", output: "output1"),
                .init(input: "input2", output: "output2"),
                .init(input: "input3", output: "output3"),
            ],
            name: "",
            context: .init(contest: .empty, alphabet: "A"),
            memoryLimit: 1000,
            timeLimit: 1000
        )
        let test = Test(problem: problem)
        print(test.source)
        let expected = """
        import XCTest
        import TestLibrary

        final class ATests: XCTestCase {
            func testExample() throws {
                let cases: [TestCase] = [
                    (#filePath, #line, "input1", "output1"),
                    (#filePath, #line, "input2", "output2"),
                    (#filePath, #line, "input3", "output3"),
                ]
                try cases.forEach(solve)
            }
        }
        """
        XCTAssertEqual(test.source, expected)
    }

    static var allTests = [
        ("test", test),
    ]
}
