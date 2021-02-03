import Foundation

extension Generator {
    static func source(problem: Problem) throws {
        let source = """
        // \(problem.context.alphabet) - \(problem.name)
        // \(problem.url)
        import Foundation
        
        """
        let directory = "Sources/\(problem.context.alphabet)"
        let fileName = "main.swift"
        try FileManager.default.createDirectory(atPath: directory, withIntermediateDirectories: true)
        try source.write(toFile: "\(directory)/\(fileName)", atomically: true, encoding: .utf8)
    }
}
