import Foundation
import SwiftShell

enum OjApiCommand {
    static func getAllTasks(name: String, ojApiPath: String) throws -> (contest: Contest, problems: [Problem]) {
        let contest = try OjApiCommand.getContest(name: name, ojApiPath: ojApiPath)
        var problems = [Problem]()
        let operation = BlockOperation()
        var error: Error?
        contest.problems.forEach { problem in
            operation.addExecutionBlock {
                do {
                    let problem = try OjApiCommand.getProblem(name: name, alphabet: problem.context.alphabet, url: problem.url, ojApiPath: ojApiPath)
                    problems.append(problem)
                } catch(let e) {
                    error = e
                    operation.cancel()
                }
            }
        }
        operation.start()

        if operation.isCancelled, let error = error {
            throw error
        }
        return (contest, problems)
    }

    static func submitCode(contestName: String, task: Character, ojApiPath: String) throws -> URL {
        try precheck(path: ojApiPath)
        let result = run(
            ojApiPath,
            "submit-code",
            "--file",
            "Sources/\(task.uppercased())/main.swift",
            "--language",
            "4055",
            "https://atcoder.jp/contests/\(contestName)/tasks/\(contestName)_\(task.lowercased())"
        )
        guard result.succeeded else {
            throw result.stderror
        }
        print(result.stdout)
        let response = try JSONDecoder().decode(SubmitCodeResponse.self, from: result.stdout.data(using: .utf8)!)
        return response.result.url
    }
}

private extension OjApiCommand {
    static func precheck(path: String) throws {
        guard !run("which", path).stdout.isEmpty else {
            /// Debug で `oj-api` にパスが通ってない場合は、[Edit Scheme] - [Run] - [Arguments Passed on Launch] に
            /// `new abc190 --oj-api-path <oj-api の絶対パス>` を追加してください
            throw "command not found: `\(path)`"
        }
    }

    static func getContest(name: String, ojApiPath: String) throws -> Contest {
        try precheck(path: ojApiPath)
        let result = run(ojApiPath, "get-contest", "https://atcoder.jp/contests/\(name)")
        guard result.succeeded else {
            throw result.stderror
        }
        print(result.stdout)
        let response = try JSONDecoder().decode(GetContestResponse.self, from: result.stdout.data(using: .utf8)!)
        return response.result
    }

    static func getProblem(name: String, alphabet: String, url: URL, ojApiPath: String) throws -> Problem {
        try precheck(path: ojApiPath)
        let result = run(ojApiPath, "get-problem", url.absoluteString)
        guard result.succeeded else {
            throw result.stderror
        }
        print(result.stdout)
        let response = try JSONDecoder().decode(GetProblemResponse.self, from: result.stdout.data(using: .utf8)!)
        return response.result
    }
}
