import XCTest
import TestLibrary

final class FTests: XCTestCase {
    func testExample() throws {
        let cases: [(file: StaticString, line: UInt, input: String, expected: String)] = [
            (#filePath, #line, "4\n0 1 2 3\n", "0\n3\n4\n3\n"),
            (#filePath, #line, "10\n0 3 1 5 4 2 9 6 8 7\n", "9\n18\n21\n28\n27\n28\n33\n24\n21\n14\n"),
        ]
        try cases.forEach(solve)
    }
}