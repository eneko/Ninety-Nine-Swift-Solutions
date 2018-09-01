import Foundation
import Command
import Rainbow
import SolutionTester
import Logger

let arguments = ProcessInfo.processInfo.arguments

func printUserInfo(username: String) {
    Logger.standard.log("Username: " + username.green)
    let solutions: [String] = Solutions.loadSolutions(username: username)
    if solutions.isEmpty {
        printStartSolvingInstructions()
    } else {
        Logger.standard.log("Problems solved: " + "\(solutions.count)".green)
        Logger.standard.log("You are all set!".green)
        Logger.standard.log()
        printStartSolvingNextInstructions()
    }
}

func setupUser(username: String) {
    Logger.standard.log("Setting up user: \(username)")
    let path = "Solutions/\(username)"
    do {
        try Username.set(username: username)
    } catch {
        Logger.standard.log("Error: failed to write username configuration".red)
        exit(-1)
    }
    if FileManager.default.fileExists(atPath: path) {
        Logger.standard.log("Solutions directory found at '\(path)'")
        printSetupComplete()
        printStartSolvingInstructions()
        return
    }

    do {
        try Solutions.createFolder(username: username)
        try Solutions.writeMain(username: username, solutions: [])
    } catch {
        Logger.standard.log("Error: failed to create solutions folder at '\(path)'".red)
        exit(-1)
    }
}

if let username = Username() {
    printWelcome()
    printUserInfo(username: username.value)
} else if arguments.count == 2 {
    setupUser(username: arguments[1])
} else {
    printWelcome()
    printSetupInstructions()
}
printCourage()
