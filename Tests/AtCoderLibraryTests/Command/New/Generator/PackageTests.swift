import XCTest
import Foundation
@testable import AtCoderLibrary

final class PackageTests: XCTestCase {
    func test() throws {
        let contestName = "abc001"
        let alphabets: [Character] = ["A", "B", "C"]
        let package = PackageSwift(contestName: contestName, alphabets: alphabets)
        let expected = """
        // swift-tools-version:5.3
        import PackageDescription

        let package = Package(
            name: "ABC001",
            dependencies: [],
            targets: [
                .target(name: "A"),
                .testTarget(name: "ATests", dependencies: ["A", "TestLibrary"]),
                .target(name: "B"),
                .testTarget(name: "BTests", dependencies: ["B", "TestLibrary"]),
                .target(name: "C"),
                .testTarget(name: "CTests", dependencies: ["C", "TestLibrary"]),
                .target(name: "TestLibrary", path: "Tests/TestLibrary"),
            ]
        )
        """
        XCTAssertEqual(package.source, expected)
    }
}
