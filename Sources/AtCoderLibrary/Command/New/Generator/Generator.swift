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
        let filePath = "\(directory ?? ".")/\(fileName)"
        guard !FileManager.default.fileExists(atPath: filePath) else {
            print("Skip file creation because the file exists.", "path: ", filePath)
            return
        }
        try source.write(toFile: filePath, atomically: true, encoding: .utf8)
    }
}
