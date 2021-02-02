import Foundation
import ArgumentParser
import SwiftShell

struct New: ParsableCommand {
    @Argument(help: "ex. \"abc111\"")
    var taskName: String = "abc189"
    
    @Option(help: "Default: --oj-api-path oj-api")
    var ojApiPath: String = "oj-api"

    mutating func run() throws {
        let (contest, problems) = try OjApiCommand.getAllTasks(name: taskName, ojApiPath: ojApiPath)
        try FileManager.default.createDirectory(atPath: taskName, withIntermediateDirectories: true)
        FileManager.default.changeCurrentDirectoryPath(taskName)
        try Generator.packageSwift(taskName: taskName, problemsAlphabets: problems.map(\.context.alphabet))
        try Generator.readme(contest: contest, problems: problems)
        try problems.forEach(Generator.source(problem:))
        try problems.forEach(Generator.test(problem:))
        try Generator.testLibrary()
    }
}
