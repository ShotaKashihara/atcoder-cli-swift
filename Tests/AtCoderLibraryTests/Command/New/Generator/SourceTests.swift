import XCTest
import Foundation
@testable import AtCoderLibrary

final class SourceTests: XCTestCase {
    func test() throws {
        let problem = Problem(
            url: "https://example.com/p_1".url,
            tests: [],
            name: "task1",
            context: .init(contest: .empty, alphabet: "A"),
            memoryLimit: 1000,
            timeLimit: 1000
        )
        let source = Source(problem: problem)
        print(source.source)
        let expected = """
        // A - task1
        // https://example.com/p_1
        import Foundation

        """
        XCTAssertEqual(source.source, expected)
    }

    static var allTests = [
        ("test", test),
    ]
}
