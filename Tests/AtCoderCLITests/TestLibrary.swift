import Foundation

enum Exec {
    static func run(_ executable: String, _ args: String ...) throws -> String {
        guard #available(macOS 10.13, *) else {
            throw "Requires macOS 10.13 or higher."
        }

        let binary = productsDirectory.appendingPathComponent(executable)

        let process = Process()
        process.executableURL = binary
        process.arguments = args

        let pipe = Pipe()
        process.standardOutput = pipe

        try process.run()
        process.waitUntilExit()

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        var stdout = String(data: data, encoding: .utf8)!
        stdout.removeLast() // Remove last `\n`
        return stdout
    }

    /// Returns path to the built products directory.
    static var productsDirectory: URL {
      #if os(macOS)
        for bundle in Bundle.allBundles where bundle.bundlePath.hasSuffix(".xctest") {
            return bundle.bundleURL.deletingLastPathComponent()
        }
        fatalError("couldn't find the products directory")
      #else
        return Bundle.main.bundleURL
      #endif
    }
}
