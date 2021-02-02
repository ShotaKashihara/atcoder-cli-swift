import XCTest
import TestLibrary

final class CTests: XCTestCase {
    func testExample() throws {
        let cases: [(file: StaticString, line: UInt, input: String, expected: String)] = [
            (#filePath, #line, "4 4\n1 2\n1 3\n2 4\n3 4\n3\n1 2\n1 3\n2 3\n", "2\n"),
            (#filePath, #line, "4 4\n1 2\n1 3\n2 4\n3 4\n4\n3 4\n1 2\n2 4\n2 4\n", "4\n"),
            (#filePath, #line, "6 12\n2 3\n4 6\n1 2\n4 5\n2 6\n1 5\n4 5\n1 3\n1 2\n2 6\n2 3\n2 5\n5\n3 5\n1 4\n2 6\n4 6\n5 6\n", "9\n"),
        ]
        try cases.forEach(solve)
    }
}