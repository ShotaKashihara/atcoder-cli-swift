import Foundation
import ArgumentParser
import SwiftShell

public struct New: ParsableCommand {
    public init() {}
    public static var configuration = CommandConfiguration(
        abstract: "Create a new contest project."
    )
    
    @Argument(help: "Name of the contest to create.\nex. 'abc123'")
    var contestName: String
    
    @Option(name: .shortAndLong, help: "Contest URL. \nIf no value is given, then 'https://atcoder.jp/contests/:contest_name' is used.")
    var contestUrl: String?

    @Flag(name: .shortAndLong, help: "Open Package.swift after creation.")
    var open: Bool = false
    
    @Option(help: "Specify the path to oj-api.")
    var ojApiPath: String = "oj-api"

    public mutating func run() throws {
        let contestUrl = self.contestUrl ?? "https://atcoder.jp/contests/\(contestName)"
        let (contest, problems) = try OjApiCommand.getAllTasks(url: contestUrl, ojApiPath: ojApiPath)
        try FileManager.default.createDirectory(atPath: contestName, withIntermediateDirectories: true)
        FileManager.default.changeCurrentDirectoryPath(contestName)

        let alphabets = problems.map(\.context.alphabet)
        try PackageSwift(contestName: contestName, alphabets: alphabets).codeGenerate()
        try Readme(contest: contest, problems: problems).codeGenerate()
        try problems.forEach {
            try Source(problem: $0).codeGenerate()
        }
        try problems.forEach {
            try Test(problem: $0).codeGenerate()
        }
        try TestLibrary().codeGenerate()
        try problems.forEach {
            try XCScheme(problem: $0).codeGenerate()
        }

        if open {
            SwiftShell.run("cd", contestName)
            SwiftShell.run("open", "Package.swift")
            return
        }
        print("""
        Finished.
        $ cd \(contestName) && open Package.swift
        """)
    }
}
