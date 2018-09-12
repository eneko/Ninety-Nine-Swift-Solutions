import Foundation

public struct MiscellaneousProblems {}




public func die<T>(_ message: @autoclosure () -> String, file: StaticString = #file, line: UInt = #line) -> T {
    preconditionFailure("💥 " + message(), file: file, line: line)
}

