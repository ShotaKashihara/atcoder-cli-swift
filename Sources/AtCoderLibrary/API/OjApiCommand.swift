import Foundation
import SwiftShell

enum OjApiCommand {
    static func getAllTasks(url: String, ojApiPath: String) throws -> (contest: Contest, problems: [Problem]) {
        let contest = try OjApiCommand.getContest(url: url, ojApiPath: ojApiPath)
        var problems = [Problem]()
        for problem in contest.problems {
            let problem = try OjApiCommand.getProblem(url: problem.url, ojApiPath: ojApiPath)
                .apply(context: problem.context)
            problems.append(problem)
        }
        return (contest, problems)
    }

    static func submitCode(contestName: String, task: String, ojApiPath: String) throws -> URL {
        try precheck(path: ojApiPath)
        let contestURL = "https://atcoder.jp/contests/\(contestName)"
        let contest = try getContest(url: contestURL, ojApiPath: ojApiPath)
        guard let problem = contest.problems.first(where: {
            $0.context.alphabet.uppercased() == task.uppercased()
        }) else {
            throw "The contest name or the task name is invalid."
        }
        let filePath = "Sources/\(task.uppercased())/main.swift"
        let language = try guessLanguage(url: problem.url, filePath: filePath, ojApiPath: ojApiPath)
        return try submitCode(url: problem.url, filePath: filePath, language: language, ojApiPath: ojApiPath)
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

    static func getContest(url: String, ojApiPath: String) throws -> Contest {
        try precheck(path: ojApiPath)
        let result = run(ojApiPath, "get-contest", url)
        guard result.succeeded else {
            throw result.stderror
        }
        print(result.stdout)
        let response = try JSONDecoder().decode(GetContestResponse.self, from: result.stdout.data(using: .utf8)!)
        return response.result
    }

    static func getProblem(url: URL, ojApiPath: String) throws -> Problem {
        try precheck(path: ojApiPath)
        let result = run(ojApiPath, "get-problem", url.absoluteString)
        guard result.succeeded else {
            throw result.stderror
        }
        print(result.stdout)
        let response = try JSONDecoder().decode(GetProblemResponse.self, from: result.stdout.data(using: .utf8)!)
        return response.result
    }
    
    static func guessLanguage(url: URL, filePath: String, ojApiPath: String) throws -> Language {
        try precheck(path: ojApiPath)
        let result = run(ojApiPath, "guess-language-id", url.absoluteString, "--file=\(filePath)")
        guard result.succeeded else {
            throw result.stderror
        }
        print(result.stdout)
        let response = try JSONDecoder().decode(GuessLanguageResponse.self, from: result.stdout.data(using: .utf8)!)
        return response.result
    }
    
    static func submitCode(url: URL, filePath: String, language: Language, ojApiPath: String) throws -> URL {
        let result = run(
            ojApiPath,
            "submit-code",
            "--file",
            filePath,
            "--language",
            language.id,
            url.absoluteString
        )
        guard result.succeeded else {
            throw result.stderror
        }
        print(result.stdout)
        let response = try JSONDecoder().decode(SubmitCodeResponse.self, from: result.stdout.data(using: .utf8)!)
        return response.result.url
    }
}
