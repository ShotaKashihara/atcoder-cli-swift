import XCTest
import TestLibrary

final class ATests: XCTestCase {
    func testExample() throws {
        let cases: [(line: UInt, input: String, expected: String)] = [
            (#line,  "2 1 0", "Takahashi"),
            (#line,  "2 2 0", "Aoki"),
            (#line,  "2 2 1", "Takahashi"),
        ]
        try cases.forEach(solve)
    }
}
