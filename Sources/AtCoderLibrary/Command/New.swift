import Foundation
import ArgumentParser
import SwiftShell

public struct New: ParsableCommand {
    public init() {}
    public static var configuration = CommandConfiguration(
        abstract: "Create a new contest project."
    )
    
    @Argument(help: "Name of the contest to create.\nex. \"abc111\"")
    var contestName: String
    
    @Option(help: "Specify the path to oj-api.")
    var ojApiPath: String = "oj-api"

    public mutating func run() throws {
        let (contest, problems) = try OjApiCommand.getAllTasks(name: contestName, ojApiPath: ojApiPath)
        try FileManager.default.createDirectory(atPath: contestName, withIntermediateDirectories: true)
        FileManager.default.changeCurrentDirectoryPath(contestName)

        let alphabets = problems.map(\.context.alphabet).map(Character.init)
        try PackageSwift(contestName: contestName, alphabets: alphabets).write()
        try Readme(contest: contest, problems: problems).write()
        try problems.forEach {
            try Source(problem: $0).write()
        }
        try problems.forEach {
            try Test(problem: $0).write()
        }
        try TestLibrary().write()
        
        print("""
        Finished.
        $ cd \(contestName) && open Package.swift
        """)
    }
}
