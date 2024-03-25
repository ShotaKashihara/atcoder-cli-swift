import Foundation
import SwiftShell

enum RunTest {
    static func sampleCase(task: String) throws {
        try runAndPrint("swift", "test", "--filter", "\(task.uppercased())Tests/testExample")
    }
}
