import XCTest
import TestLibrary

final class BTests: XCTestCase {
    func testExample() throws {
        let cases: [(line: UInt, input: String, expected: String)] = [
            /// `Case 1`
            (#line,  """
            4 9 9
            5 5
            15 5
            5 15
            15 15
            """,
            """
            Yes
            """
            ),
            /// `Case 2`
            (#line,  """
            3 691 273
            691 997
            593 273
            691 273
            """, """
            No
            """
            ),
            /// `Case 3`
            (#line,  """
            7 100 100
            10 11
            12 67
            192 79
            154 197
            142 158
            20 25
            17 108
            """, """
            Yes
            """
            ),
        ]
        try cases.forEach(solve)
    }
}
