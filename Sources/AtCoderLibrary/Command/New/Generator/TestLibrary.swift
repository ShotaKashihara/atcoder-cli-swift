struct TestLibrary: Generator {
    let directory: String? = "Tests/TestLibrary"
    let fileName = "TestLibrary.swift"
    var source: String {
        """
        import XCTest
        import class Foundation.Bundle

        public protocol TimeLimit {
            var timeLimit: TimeInterval { get }
        }

        public typealias TestCase = (file: StaticString, line: UInt, input: String, expected: String)

        public extension TimeLimit where Self: XCTestCase {
            func solve(file: StaticString, line: UInt, input: String, expected: String) throws {
                // Some of the APIs that we use below are available in macOS 10.13 and above.
                guard #available(macOS 10.13, *) else {
                    return
                }
                let expected = expected.last == "\\n" ? expected : expected + "\\n"
                var error = ""
                let exp = expectation(description: "")
                let testTarget = String(describing: type(of: self))
                    .replacingOccurrences(of: "Tests", with: "")
                    .replacingOccurrences(of: "_", with: "")
                let binary = productsDirectory.appendingPathComponent(testTarget)
                let process = Process()
                
                addTeardownBlock {
                    if process.isRunning {
                        process.terminate()
                    }
                }
                
                process.executableURL = binary
                let pipeInput = Pipe()
                process.standardInput = pipeInput
                let pipeOutput = Pipe()
                process.standardOutput = pipeOutput
                let pipeError = Pipe()
                process.standardError = pipeError
                
                DispatchQueue.global().async {
                    do {
                        try process.run()
                        pipeInput.fileHandleForWriting.write(input.data(using: .utf8)!)
                        pipeInput.fileHandleForWriting.closeFile()
                        process.waitUntilExit()
                        exp.fulfill()
                        error = String(data: pipeError.fileHandleForReading.readDataToEndOfFile(), encoding: .utf8)!
                    } catch (let e) {
                        error = e.localizedDescription
                    }
                }
                let result = XCTWaiter.wait(for: [exp], timeout: timeLimit)
                switch result {
                case .completed:
                    if error.isEmpty {
                        let data = pipeOutput.fileHandleForReading.readDataToEndOfFile()
                        let output = String(data: data, encoding: .utf8)!
                        XCTAssertEqual(output, expected, file: file, line: line)
                    } else {
                        XCTFail("RE: \\(error)", file: file, line: line)
                    }
                case .timedOut:
                    XCTFail("TLE: Exceeded timeout of \\(timeLimit) seconds", file: file, line: line)
                default:
                    XCTFail("Unrecognized error.", file: file, line: line)
                }
            }

            private var productsDirectory: URL {
                for bundle in Bundle.allBundles where bundle.bundlePath.hasSuffix(".xctest") {
                    return bundle.bundleURL.deletingLastPathComponent()
                }
                fatalError("couldn't find the products directory")
            }
        }
        """
    }
}
