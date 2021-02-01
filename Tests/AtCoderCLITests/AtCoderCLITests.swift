import XCTest
import class Foundation.Bundle

final class AtCoderCLITests: XCTestCase {
    func testDoctor() throws {
        let stdout = try Exec.run("acc-swift", "doctor")
        XCTAssertEqual(stdout, "TBD")
    }

    static var allTests = [
        ("testDoctor", testDoctor),
    ]
}
