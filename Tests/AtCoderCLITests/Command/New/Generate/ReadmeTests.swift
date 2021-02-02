import XCTest
import class Foundation.Bundle

final class ReadmeTests: XCTestCase {
    func test() throws {
        let stdout = try Exec.run("acc-swift", "doctor")
        XCTAssertEqual(stdout, "TBD")
    }

    static var allTests = [
        ("test", test),
    ]
}
