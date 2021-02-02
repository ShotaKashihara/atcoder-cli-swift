import XCTest
import TestLibrary

final class BTests: XCTestCase {
    func testExample() throws {
        let cases: [(file: StaticString, line: UInt, input: String, expected: String)] = [
            (#filePath, #line, "4 9 9\n5 5\n15 5\n5 15\n15 15\n", "Yes\n"),
            (#filePath, #line, "3 691 273\n691 997\n593 273\n691 273\n", "No\n"),
            (#filePath, #line, "7 100 100\n10 11\n12 67\n192 79\n154 197\n142 158\n20 25\n17 108\n", "Yes\n"),
        ]
        try cases.forEach(solve)
    }
}