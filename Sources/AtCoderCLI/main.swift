import ArgumentParser
import SwiftShell

struct Command: ParsableCommand {
    static var configuration = CommandConfiguration(
        subcommands: [New.self, Doctor.self],
        defaultSubcommand: New.self
    )
}

Command.main()
