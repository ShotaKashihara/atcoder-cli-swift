import AtCoderLibrary
import ArgumentParser
import SwiftShell

struct Command: ParsableCommand {
    static var configuration = CommandConfiguration(
        abstract: "AtCoder CLI for Swift.",
        version: "1.0.5",
        subcommands: [
            New.self,
            Submit.self,
        ]
    )
}

Command.main()
