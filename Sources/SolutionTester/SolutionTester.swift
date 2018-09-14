import Foundation
import NinetyNineSwiftProblems
import Command
import Basic
import Logger

var passes = 0
var failures = 0
var totalDuration: TimeInterval = 0

public class SolutionTester {

    public init() {}

    public func showResults() {
        Logger.standard.log("")
        let totalTests = passes + failures
        if failures == 0 {
            Logger.standard.log("  ✔ OK ".green + "> executed \(totalTests) tests, with \(failures) failures in \(totalDuration.secs)")
        } else {
            Logger.standard.log("  ⅹ FAIL ".red + "> executed \(totalTests) tests, with \(failures) failures in \(totalDuration.secs)")
        }
        Logger.standard.log("")
    }

    public var exitCode: Int32 {
        return failures == 0 ? 0 : -1
    }

    public struct Test {
        @discardableResult
        public init(_ desc: String, function: StaticString = #function, assertions: () -> Void) {
            let beforePasses = passes
            let beforeFailures = failures
            let beforeDuration = totalDuration
            assertions()
            let deltaFailures = failures - beforeFailures
            let deltaPasses = passes - beforePasses
            let deltaDuration = totalDuration - beforeDuration
            if deltaFailures > 0 {
                Logger.standard.log("[" + "FAIL".red + "] \(function) '\(desc)' failed: \(deltaFailures) failures (\(deltaDuration.secs)) " + "ⅹ".red)
            } else if passes > beforePasses {
                Logger.standard.log("[" + "PASS".green + "] \(function) '\(desc)' passed: \(deltaPasses) assertions (\(deltaDuration.secs)) " + "✔".green)
            } else {
                // No tests?
            }
        }
    }

    private func meassure<T>(block: () -> T) -> (T, TimeInterval) {
        let start = Date()
        let result = block()
        return (result, Date().timeIntervalSince(start))
    }

}

// MARK: - Assertions

extension SolutionTester {
    public func assertSuccess(_ message: String) {
        passes += 1
//        Logger.standard.log("[" + "PASS".green + "] assertion success: " + "\(message)".green + " (\(0.secs)) " + "✔".green)
    }

    public func assertFailure(_ message: String) {
        failures += 1
        Logger.standard.log("[" + "FAIL".red + "] assertion failed: " + "\(message)".red + " (\(0.secs)) " + "ⅹ".red)
    }

    public func assertEquals<T: Equatable>(_ expression: @autoclosure () -> T?, _ isEqualTo: @autoclosure () -> T?) {
        assert(expression, isEqualTo, { $0 == $1 })
    }

    public func assert<T: Equatable>(_ expression: @autoclosure () -> T?, _ rightExpression: @autoclosure () -> T?, _ assertion: (T?, T?) -> Bool) {
        let (value, duration) = meassure {
            expression()
        }
        let expectation = rightExpression()
        if assertion(value, expectation) {
            passes += 1
        } else {
            failures += 1
            Logger.standard.log("[" + "FAIL".red + "] assertion failed: " + "\(value.unwrapped) != \(expectation.unwrapped)".red + " (\(duration.secs)) " + "ⅹ".red)
        }
        totalDuration += duration
    }
}
