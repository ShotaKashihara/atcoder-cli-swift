import Foundation
import ArgumentParser
import SwiftShell

public struct Submit: ParsableCommand {
    public init() {}
    public static var configuration = CommandConfiguration(
        abstract: "Submit a your code."
    )

    @Argument(help: "Alphabet of the problem to be submitted.", transform: Character.init)
    var task: Character
    
    @Flag(name: .shortAndLong, help: "Run a UnitTest before submitting.")
    var runTest: Bool = false

    @Option(help: "Specify the path to oj-api.")
    var ojApiPath: String = "oj-api"

    public mutating func run() throws {
        guard FileManager.default.fileExists(atPath: "./Package.swift") else {
            throw """
                Could not resolve the contest name.
                Please move Package.swift directory.
                """
        }
        let currentDirectory = FileManager.default.currentDirectoryPath
            .split(separator: "/")
            .last!
        let contestName = String(currentDirectory)
        if runTest {
            try RunTest.sampleCase(task: task)
        }
        let submitUrl = try OjApiCommand.submitCode(contestName: contestName, task: task, ojApiPath: ojApiPath)
        SwiftShell.run("open", submitUrl.absoluteString)
    }
}
