import XCTest
import Foundation
@testable import AtCoderLibrary

final class ReadmeTests: XCTestCase {
    func test() throws {
        let url = "https://example.com/contest".url
        let name = "Example Contest 001"
        let contest = Contest(url: url, problems: [], name: name)
        let problems: [Problem] = [
            .init(url: "https://example.com/p_1".url,
                  tests: [],
                  name: "task1",
                  context: .init(contest: .empty, alphabet: "A"),
                  memoryLimit: 1000,
                  timeLimit: 1000),
            .init(url: "https://example.com/p_2".url,
                  tests: [],
                  name: "task2",
                  context: .init(contest: .empty, alphabet: "B"),
                  memoryLimit: 2000,
                  timeLimit: 2000),
            .init(url: "https://example.com/p_3".url,
                  tests: [],
                  name: "task3",
                  context: .init(contest: .empty, alphabet: "C"),
                  memoryLimit: 3000,
                  timeLimit: 3000),
        ]
        let readme = Readme(contest: contest, problems: problems)
        print(readme.source)
        let expected = """
        # [Example Contest 001](https://example.com/contest)

        問題名 | 実行時間制限 | メモリ制限
        :-- | --: | --:
        [A task1](https://example.com/p_1) | 1 sec | 1000 MB
        [B task2](https://example.com/p_2) | 2 sec | 2000 MB
        [C task3](https://example.com/p_3) | 3 sec | 3000 MB

        """
        XCTAssertEqual(readme.source, expected)
    }

    static var allTests = [
        ("test", test),
    ]
}
