import Foundation

protocol Generator {
    var fileName: String { get }
    var directory: String? { get }
    var source: String { get }
}

extension Generator {
    func write() throws {
        if let directory = directory {
            try FileManager.default.createDirectory(atPath: directory, withIntermediateDirectories: true)
        }
        try source.write(toFile: "\(directory ?? ".")/\(fileName)", atomically: true, encoding: .utf8)
    }
}
