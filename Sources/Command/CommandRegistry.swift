//
//  CommandRegistry.swift
//  Command
//
//  Created by Eneko Alonso on 3/3/18.
//

import Foundation
import Utility
import Basic
import Rainbow
import Logger

public struct CommandRegistry {

    private let parser: ArgumentParser
    private var commands: [Command] = []

    public init(usage: String, overview: String) {
        parser = ArgumentParser(usage: usage, overview: overview)
    }

    public mutating func register(command: Command.Type) {
        commands.append(command.init(parser: parser))
    }

    public func run() {
        do {
            let parsedArguments = try parse()
            try process(arguments: parsedArguments)
        } catch let error as ArgumentParserError {
            Logger.error.log(error.description.red)
        } catch let error {
            Logger.error.log(error.localizedDescription.red)
        }
    }

    private func parse() throws -> ArgumentParser.Result {
        let arguments = Array(ProcessInfo.processInfo.arguments.dropFirst())
        return try parser.parse(arguments)
    }

    private func process(arguments: ArgumentParser.Result) throws {
        guard let subparser = arguments.subparser(parser),
            let command = commands.first(where: { $0.command == subparser }) else {
                parser.printUsage(on: stdoutStream)
                return
        }
        try command.run(with: arguments)
    }

}
