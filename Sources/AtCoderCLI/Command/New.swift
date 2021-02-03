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
        try Generator.packageSwift(contestName: contestName, problemsAlphabets: problems.map(\.context.alphabet))
        try Generator.readme(contest: contest, problems: problems)
        try problems.forEach(Generator.source(problem:))
        try problems.forEach(Generator.test(problem:))
        try Generator.testLibrary()
        
        print("""
        Finished.
        $ cd \(contestName) && open Package.swift
        """)
    }
}
