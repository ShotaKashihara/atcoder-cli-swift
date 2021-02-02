import XCTest
import TestLibrary

final class ETests: XCTestCase {
    func testExample() throws {
        let cases: [(file: StaticString, line: UInt, input: String, expected: String)] = [
            (#filePath, #line, "4 3\n1 4\n2 4\n3 4\n3\n1 2 3\n", "5\n"),
            (#filePath, #line, "4 3\n1 4\n2 4\n1 2\n3\n1 2 3\n", "-1\n"),
            (#filePath, #line, "10 10\n3 9\n3 8\n8 10\n2 10\n5 8\n6 8\n5 7\n6 7\n1 6\n2 4\n4\n1 2 7 9\n", "11\n"),
        ]
        try cases.forEach(solve)
    }
}