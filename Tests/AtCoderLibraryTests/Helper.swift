import Foundation
@testable import AtCoderLibrary

extension String {
    var url: URL {
        URL(string: self)!
    }
}

extension Context.Contest {
    static let empty: Context.Contest = .init(name: "", url: "file://".url)
}
