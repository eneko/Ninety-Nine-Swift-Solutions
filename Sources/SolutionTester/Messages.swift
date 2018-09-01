import Foundation
import Command
import Logger

public func printWelcome() {
    let welcome = """
       ___  ___    ____       _ _____    ___           __   __
      / _ \\/ _ \\  / __/    __(_) _/ /_  / _ \\_______  / /  / /__ __ _  ___
      \\_, /\\_, / _\\ \\| |/|/ / / _/ __/ / ___/ __/ _ \\/ _ \\/ / -_)  ' \\(_-<
     /___//___/ /___/|__,__/_/_/ \\__/ /_/  /_/  \\___/_.__/_/\\__/_/_/_/___/
    """

    Logger.standard.log(welcome.blue)
    Logger.standard.log()
    Logger.standard.log("×º°”˜`”°º× Welcome to Ninety-Nine Swift Problems & Solutions ×º°”˜`”°º×".blue)
    Logger.standard.log()
}

public func printSetupInstructions() {
    Logger.standard.log("To get started, run the following command:")
    Logger.standard.log()
    Logger.standard.log("  $ swift run setup <github_username>".yellow)
    Logger.standard.log()
}

public func printSetupComplete() {
    Logger.standard.log("You are all set!".green)
}

public func printStartSolvingInstructions() {
    Logger.standard.log("To start solving your first problem, enter:")
    Logger.standard.log()
    Logger.standard.log("  $ swift run solve p01".yellow)
    Logger.standard.log()
}

public func printStartSolvingNextInstructions() {
    Logger.standard.log("To start solving your next problem, enter:")
    Logger.standard.log()
    Logger.standard.log("  $ swift run solve <problem_id>".yellow)
    Logger.standard.log()
}

public func printUserStats(username: String, solutions: [String]) {
    Logger.standard.log("Username: " + username.green)
    Logger.standard.log("Problems solved: " + "\(solutions.count)".green)
    Logger.standard.log()
}

public func printCourage() {
    Logger.standard.log("If you get stuck on a problem, don't give up. Move to the next one and come back later. Good luck!")
    Logger.standard.log()
}

public func printUsernameError() {
    Logger.error.log("Username not set.".red)
    Logger.standard.log()
    printSetupInstructions()
}
