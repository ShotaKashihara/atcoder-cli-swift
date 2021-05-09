import Foundation

extension OjApiCommand {
    struct GetContestResponse: Decodable {
        let result: Contest
    }

    struct GetProblemResponse: Decodable {
        let result: Problem
    }
    
    struct SubmitCodeResponse: Decodable {
        let result: Result
        
        struct Result: Decodable {
            let url: URL
        }
    }
}

struct Contest: Decodable {
    let url: URL
    let problems: [Problem]
    let name: String

    struct Problem: Decodable {
        let url: URL
        let name: String
        let context: Context
    }
}

struct Problem: Decodable {
    let url: URL
    let tests: [Test]
    let name: String
    let context: Context
    let memoryLimit: Int
    let timeLimit: Int
    
    struct Test: Decodable {
        let input: String
        let output: String
    }
    
    func apply(context: Context) -> Self {
        .init(url: url, tests: tests, name: name, context: context, memoryLimit: memoryLimit, timeLimit: timeLimit)
    }
}

struct Context: Decodable {
    let contest: Contest
    let alphabet: String
    
    struct Contest: Decodable {
        let name: String
        let url: URL
    }
}
