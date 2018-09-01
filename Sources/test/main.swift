import Foundation
import Basic
import Command
import SolutionTester
import Logger

struct TestRunner {

    func run() throws {
        let arguments = ProcessInfo.processInfo.arguments
        if arguments.count == 2 {
            try runTests(username: arguments[1])
        } else {
            try runTests(usernames: loadUsernames())
        }
    }

    private func loadUsernames() throws -> [String] {
        var usernames = (try? FileManager.default.contentsOfDirectory(atPath: "Solutions")) ?? []
        usernames = usernames.filter { $0.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false }
            .filter { $0.hasPrefix(".") == false }
            .filter { $0 != "_tests" }
        return usernames.sorted()
    }

    private func runTests(usernames: [String]) throws {
        if usernames.isEmpty {
            Logger.standard.log("Could not find any tests to run :(")
            return
        }
        try usernames.forEach(runTests)
    }

    private func runTests(username: String) throws {
        let solutions = Solutions.loadSolutions(username: username)
        guard solutions.isEmpty == false else {
            Logger.standard.log("Bummer, could not find any solutions for user '\(username)' at Solutions/\(username)".red)
            Logger.standard.log()
            printSetupInstructions()
            printStartSolvingInstructions()
            printCourage()
            return
        }
        Logger.standard.log("Running tests for: ".blue + username)
        try Solutions.createFolder(username: username)
        try Solutions.writeMain(username: username, solutions: solutions)
        try copyTestFiles(username: username, solutions: solutions)
        try executeTests(username: username)
    }

    private func copyTestFiles(username: String, solutions: [String]) throws {
        let destination = "Solutions/\(username)/includes/"
        for solution in solutions {
            try FileManager.default.copyItem(atPath: "Solutions/_tests/\(solution)_tests.swift", toPath: destination + "\(solution)_tests.swift")
        }
    }

    private func executeTests(username: String) throws {
        let process = Basic.Process(arguments: ["swift", "run", username], redirectOutput: false)
        try process.launch()
        let result = try process.waitUntilExit()
        switch result.exitStatus {
        case let .signalled(signal):
            Logger.error.log("Test process was stopped with signal code \(signal))")
            exit(-1)
        case let .terminated(code) where code != 0:
            exit(code)
        default:
            break
        }
    }
}

try TestRunner().run()
