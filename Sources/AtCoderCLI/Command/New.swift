import Foundation
import ArgumentParser
import SwiftShell

struct New: ParsableCommand {
    static var configuration = CommandConfiguration(
        abstract: "Create a new contest project."
    )
    
    @Argument(help: "Name of the contest to create.\nex. \"abc111\"")
    var contestName: String
    
    @Option(help: "Specify the path to oj-api.")
    var ojApiPath: String = "oj-api"

    mutating func run() throws {
        let (contest, problems) = try OjApiCommand.getAllTasks(name: contestName, ojApiPath: ojApiPath)
        try FileManager.default.createDirectory(atPath: contestName, withIntermediateDirectories: true)
        FileManager.default.changeCurrentDirectoryPath(contestName)

        try Package(contestName: contestName, problemsAlphabets: problems.map(\.context.alphabet)).write()
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
