import Foundation
import SwiftShell

enum OjApiCommand {
    static func getAllTasks(name: String, ojApiPath: String) throws -> (contest: Contest, problems: [Problem]) {
        let contest = try OjApiCommand.getContest(name: name, ojApiPath: ojApiPath)
        let problems = try contest.problems.map {
            try OjApiCommand.getProblem(name: name, alphabet: $0.context.alphabet, url: $0.url, ojApiPath: ojApiPath)
        }
        return (contest, problems)
    }
}

private extension OjApiCommand {
    static func precheck(ojApiPath: String) throws {
        guard SwiftShell.run("which", ojApiPath).stdout.isEmpty else {
            /// Debug で `oj-api` にパスが通ってない場合は、[Edit Scheme] - [Run] - [Arguments Passed on Launch] に
            /// `new abc190 --oj-api-path <oj-api の絶対パス>` を追加してください
            throw "command not found: `oj-api`"
        }
    }

    static func getContest(name: String, ojApiPath: String) throws -> Contest {
        try precheck(ojApiPath: ojApiPath)
        print("[\(name.uppercased()) Contest] >>> Requesting...")
        let result = SwiftShell.run(ojApiPath, "get-contest", "https://atcoder.jp/contests/\(name)")
        guard result.succeeded else {
            throw result.error!
        }
        print("[\(name.uppercased()) Contest]     Response Data \(result.stdout.lengthOfBytes(using: .utf8)) bytes")
        let response = try JSONDecoder().decode(GetContestResponse.self, from: result.stdout.data(using: .utf8)!)
        print("[\(name.uppercased()) Contest] <<< Finished!")
        return response.result
    }

    static func getProblem(name: String, alphabet: String, url: URL, ojApiPath: String) throws -> Problem {
        try precheck(ojApiPath: ojApiPath)
        print("[\(name.uppercased()) \(alphabet.uppercased())] >>> Requesting...")
        let result = SwiftShell.run(ojApiPath, "get-problem", url.absoluteString)
        guard result.succeeded else {
            throw result.error!
        }
        print("[\(name.uppercased()) \(alphabet.uppercased())]     Response Data \(result.stdout.lengthOfBytes(using: .utf8)) bytes")
        let response = try JSONDecoder().decode(GetProblemResponse.self, from: result.stdout.data(using: .utf8)!)
        print("[\(name.uppercased()) \(alphabet.uppercased())] <<< Finished!")
        return response.result
    }
}
