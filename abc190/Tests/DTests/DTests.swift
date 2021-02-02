import XCTest
import TestLibrary

final class DTests: XCTestCase {
    func testExample() throws {
        let cases: [(file: StaticString, line: UInt, input: String, expected: String)] = [
            (#filePath, #line, "12\n", "4\n"),
            (#filePath, #line, "1\n", "2\n"),
            (#filePath, #line, "963761198400\n", "1920\n"),
        ]
        try cases.forEach(solve)
    }
}