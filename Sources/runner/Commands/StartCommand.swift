//
//  StartCommand.swift
//  runner
//
//  Created by Eneko Alonso on 3/3/18.
//

import Utility
import Command
import SolutionTester

struct StartCommand: Command {

    let command = "start"
    let overview = "Create file for a Swift challenge solution."

    private let number: PositionalArgument<Int>

    init(parser: ArgumentParser) {
        let subparser = parser.add(subparser: command, overview: overview)
        number = subparser.add(positional: "number", kind: Int.self, usage: "Challenge Number to create.")
    }

    func run(with arguments: ArgumentParser.Result) throws {
        guard let number = arguments.get(number) else {
            return
        }
        guard let username = Username() else {
            printUsernameError()
            return
        }
        let filename = String(format: "p%02d_%@.swift", number, username.value)
        Logger.log("Creating template for problem #\(number) at \(filename)")
    }

}
