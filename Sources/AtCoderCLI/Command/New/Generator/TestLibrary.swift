import Foundation

extension Generator {
    static func testLibrary() throws {
        let testLibrary = """
        import XCTest
        import class Foundation.Bundle

        public typealias TestCase = (file: StaticString, line: UInt, input: String, expected: String)

        public extension XCTestCase {
            func solve(file: StaticString, line: UInt, input: String, expected: String) throws {
                // Some of the APIs that we use below are available in macOS 10.13 and above.
                guard #available(macOS 10.13, *) else {
                    return
                }

                let testTarget = String(describing: type(of: self)).replacingOccurrences(of: \"Tests\", with: \"\")
                let binary = productsDirectory.appendingPathComponent(testTarget)
                let process = Process()
                process.executableURL = binary
                let pipeInput = Pipe()
                process.standardInput = pipeInput
                let pipeOutput = Pipe()
                process.standardOutput = pipeOutput
                try process.run()
                pipeInput.fileHandleForWriting.write(input.data(using: .utf8)!)
                pipeInput.fileHandleForWriting.closeFile()
                process.waitUntilExit()
                let data = pipeOutput.fileHandleForReading.readDataToEndOfFile()
                let output = String(data: data, encoding: .utf8)!
                XCTAssertEqual(output, expected, file: file, line: line)
            }

            private var productsDirectory: URL {
                for bundle in Bundle.allBundles where bundle.bundlePath.hasSuffix(\".xctest\") {
                    return bundle.bundleURL.deletingLastPathComponent()
                }
                fatalError(\"couldn't find the products directory\")
            }
        }
        """
        let directory = "Tests/TestLibrary"
        let fileName = "Library.swift"
        try FileManager.default.createDirectory(atPath: directory, withIntermediateDirectories: true)
        try testLibrary.write(toFile: "\(directory)/\(fileName)", atomically: true, encoding: .utf8)
    }
}
