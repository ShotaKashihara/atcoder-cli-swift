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
        /// `TODO`
        /// - Copy Project Files
        /// - [x] Generate `Package.swift`
        /// - [x] Generate `README.md`
        /// - [ ] Generate `Sources - main.swift`
        /// - [ ] Generate `Tests - A.swift`
        /// - [ ] Generate `TestLibrary.swift`
        try Generator.packageSwift(taskName: taskName, problemsAlphabets: problems.map(\.context.alphabet))
        try Generator.readme(contest: contest, problems: problems)
    }
}
