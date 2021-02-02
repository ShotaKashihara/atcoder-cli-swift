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
        guard !SwiftShell.run("which", ojApiPath).stdout.isEmpty else {
            /// Debug で `oj-api` にパスが通ってない場合は、[Edit Scheme] - [Run] - [Arguments Passed on Launch] に
            /// `new abc190 --oj-api-path <oj-api の絶対パス>` を追加してください
            throw "command not found: `oj-api`"
        }
    }

    static func getContest(name: String, ojApiPath: String) throws -> Contest {
        try precheck(ojApiPath: ojApiPath)
        print("[\(name.uppercased()) Contest] >>> Requesting...")
//        let result = SwiftShell.run(ojApiPath, "get-contest", "https://atcoder.jp/contests/\(name)")
//        guard result.succeeded else {
//            throw result.error!
//        }
//        print("[\(name.uppercased()) Contest]     Response Data \(result.stdout.lengthOfBytes(using: .utf8)) bytes")
//        let response = try JSONDecoder().decode(GetContestResponse.self, from: result.stdout.data(using: .utf8)!)
        let response = try JSONDecoder().decode(GetContestResponse.self, from: contest.data(using: .utf8)!)
        print("[\(name.uppercased()) Contest] <<< Finished!")
        return response.result
    }

    static func getProblem(name: String, alphabet: String, url: URL, ojApiPath: String) throws -> Problem {
        try precheck(ojApiPath: ojApiPath)
        print("[\(name.uppercased()) \(alphabet.uppercased())] >>> Requesting...")
//        let result = SwiftShell.run(ojApiPath, "get-problem", url.absoluteString)
//        guard result.succeeded else {
//            throw result.error!
//        }
//        print("[\(name.uppercased()) \(alphabet.uppercased())]     Response Data \(result.stdout.lengthOfBytes(using: .utf8)) bytes")
//        let response = try JSONDecoder().decode(GetProblemResponse.self, from: result.stdout.data(using: .utf8)!)
        let problem: String
        switch alphabet {
        case "A":
            problem = problem_a
        case "B":
            problem = problem_b
        case "C":
            problem = problem_c
        case "D":
            problem = problem_d
        case "E":
            problem = problem_e
        case "F":
            problem = problem_f
        default:
            throw "Invalid alphabet"
        }
        let response = try JSONDecoder().decode(GetProblemResponse.self, from: problem.data(using: .utf8)!)
        print("[\(name.uppercased()) \(alphabet.uppercased())] <<< Finished!")
        return response.result
    }
}

let contest = """
{
  "status": "ok",
  "messages": [],
  "result": {
    "url": "https://atcoder.jp/contests/abc190",
    "problems": [
      {
        "url": "https://atcoder.jp/contests/abc190/tasks/abc190_a",
        "name": "Very Very Primitive Game",
        "context": {
          "contest": {
            "name": "AtCoder Beginner Contest 190",
            "url": "https://atcoder.jp/contests/abc190"
          },
          "alphabet": "A"
        }
      },
      {
        "url": "https://atcoder.jp/contests/abc190/tasks/abc190_b",
        "name": "Magic 3",
        "context": {
          "contest": {
            "name": "AtCoder Beginner Contest 190",
            "url": "https://atcoder.jp/contests/abc190"
          },
          "alphabet": "B"
        }
      },
      {
        "url": "https://atcoder.jp/contests/abc190/tasks/abc190_c",
        "name": "Bowls and Dishes",
        "context": {
          "contest": {
            "name": "AtCoder Beginner Contest 190",
            "url": "https://atcoder.jp/contests/abc190"
          },
          "alphabet": "C"
        }
      },
      {
        "url": "https://atcoder.jp/contests/abc190/tasks/abc190_d",
        "name": "Staircase Sequences",
        "context": {
          "contest": {
            "name": "AtCoder Beginner Contest 190",
            "url": "https://atcoder.jp/contests/abc190"
          },
          "alphabet": "D"
        }
      },
      {
        "url": "https://atcoder.jp/contests/abc190/tasks/abc190_e",
        "name": "Magical Ornament",
        "context": {
          "contest": {
            "name": "AtCoder Beginner Contest 190",
            "url": "https://atcoder.jp/contests/abc190"
          },
          "alphabet": "E"
        }
      },
      {
        "url": "https://atcoder.jp/contests/abc190/tasks/abc190_f",
        "name": "Shift and Inversions",
        "context": {
          "contest": {
            "name": "AtCoder Beginner Contest 190",
            "url": "https://atcoder.jp/contests/abc190"
          },
          "alphabet": "F"
        }
      }
    ],
    "name": "AtCoder Beginner Contest 190"
  }
}
"""

let problem_a = """
{
    "status": "ok",
    "messages": [],
    "result": {
        "url": "https://atcoder.jp/contests/abc190/tasks/abc190_a",
        "tests": [
            {
                "input": "2 1 0\\n",
                "output": "Takahashi\\n"
            },
            {
                "input": "2 2 0\\n",
                "output": "Aoki\\n"
            },
            {
                "input": "2 2 1\\n",
                "output": "Takahashi\\n"
            }
        ],
        "name": "Very Very Primitive Game",
        "context": {
            "contest": {
                "name": "AtCoder Beginner Contest 190",
                "url": "https://atcoder.jp/contests/abc190"
            },
            "alphabet": "A"
        },
        "memoryLimit": 1024,
        "timeLimit": 2000
    }
}
"""

let problem_b = """
{"status": "ok", "messages": [], "result": {"url": "https://atcoder.jp/contests/abc190/tasks/abc190_b", "tests": [{"input": "4 9 9\\n5 5\\n15 5\\n5 15\\n15 15\\n", "output": "Yes\\n"}, {"input": "3 691 273\\n691 997\\n593 273\\n691 273\\n", "output": "No\\n"}, {"input": "7 100 100\\n10 11\\n12 67\\n192 79\\n154 197\\n142 158\\n20 25\\n17 108\\n", "output": "Yes\\n"}], "name": "Magic 3", "context": {"contest": {"name": "AtCoder Beginner Contest 190", "url": "https://atcoder.jp/contests/abc190"}, "alphabet": "B"}, "memoryLimit": 1024, "timeLimit": 2000}}
"""

let problem_c = """
{"status": "ok", "messages": [], "result": {"url": "https://atcoder.jp/contests/abc190/tasks/abc190_c", "tests": [{"input": "4 4\\n1 2\\n1 3\\n2 4\\n3 4\\n3\\n1 2\\n1 3\\n2 3\\n", "output": "2\\n"}, {"input": "4 4\\n1 2\\n1 3\\n2 4\\n3 4\\n4\\n3 4\\n1 2\\n2 4\\n2 4\\n", "output": "4\\n"}, {"input": "6 12\\n2 3\\n4 6\\n1 2\\n4 5\\n2 6\\n1 5\\n4 5\\n1 3\\n1 2\\n2 6\\n2 3\\n2 5\\n5\\n3 5\\n1 4\\n2 6\\n4 6\\n5 6\\n", "output": "9\\n"}], "name": "Bowls and Dishes", "context": {"contest": {"name": "AtCoder Beginner Contest 190", "url": "https://atcoder.jp/contests/abc190"}, "alphabet": "C"}, "memoryLimit": 1024, "timeLimit": 2000}}
"""

let problem_d = """
{"status": "ok", "messages": [], "result": {"url": "https://atcoder.jp/contests/abc190/tasks/abc190_d", "tests": [{"input": "12\\n", "output": "4\\n"}, {"input": "1\\n", "output": "2\\n"}, {"input": "963761198400\\n", "output": "1920\\n"}], "name": "Staircase Sequences", "context": {"contest": {"name": "AtCoder Beginner Contest 190", "url": "https://atcoder.jp/contests/abc190"}, "alphabet": "D"}, "memoryLimit": 1024, "timeLimit": 2000}}
"""

let problem_e = """
{"status": "ok", "messages": [], "result": {"url": "https://atcoder.jp/contests/abc190/tasks/abc190_e", "tests": [{"input": "4 3\\n1 4\\n2 4\\n3 4\\n3\\n1 2 3\\n", "output": "5\\n"}, {"input": "4 3\\n1 4\\n2 4\\n1 2\\n3\\n1 2 3\\n", "output": "-1\\n"}, {"input": "10 10\\n3 9\\n3 8\\n8 10\\n2 10\\n5 8\\n6 8\\n5 7\\n6 7\\n1 6\\n2 4\\n4\\n1 2 7 9\\n", "output": "11\\n"}], "name": "Magical Ornament", "context": {"contest": {"name": "AtCoder Beginner Contest 190", "url": "https://atcoder.jp/contests/abc190"}, "alphabet": "E"}, "memoryLimit": 1024, "timeLimit": 2000}}
"""

let problem_f = """
{"status": "ok", "messages": [], "result": {"url": "https://atcoder.jp/contests/abc190/tasks/abc190_f", "tests": [{"input": "4\\n0 1 2 3\\n", "output": "0\\n3\\n4\\n3\\n"}, {"input": "10\\n0 3 1 5 4 2 9 6 8 7\\n", "output": "9\\n18\\n21\\n28\\n27\\n28\\n33\\n24\\n21\\n14\\n"}], "name": "Shift and Inversions", "context": {"contest": {"name": "AtCoder Beginner Contest 190", "url": "https://atcoder.jp/contests/abc190"}, "alphabet": "F"}, "memoryLimit": 1024, "timeLimit": 2000}}
"""
