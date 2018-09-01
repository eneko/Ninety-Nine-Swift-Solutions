//
//  UsernameCommand.swift
//  runner
//
//  Created by Eneko Alonso on 3/3/18.
//

import Utility
import Basic
import Command
import SolutionTester
import Logger

struct UsernameCommand: Command {

    let command = "username"
    let overview = "Configure GitHub username for solutions."

    private let username: PositionalArgument<String>

    init(parser: ArgumentParser) {
        let subparser = parser.add(subparser: command, overview: overview)
        username = subparser.add(positional: "username", kind: String.self, optional: true, usage: "GitHub username.")
    }

    func run(with arguments: ArgumentParser.Result) throws {
        if let username = arguments.get(username) {
            try Username.set(username: username)
            Logger.standard.log("Username has been set to '\(username)'")
        } else if let username = Username() {
            Logger.standard.log("Username: \(username.value)")
        } else {
            printUsernameError()
        }
    }

}
