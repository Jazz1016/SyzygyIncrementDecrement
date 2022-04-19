//
//  Command.swift
//  iTAK
//
//  Created by Yas Tabasam on 1/22/21.
//

import Combine

enum CommandError: Error {
    case undoNotImplemented
}

/// Base class for all commands
public protocol Command {
    associatedtype Output
    associatedtype Failure: Error

    func execute() -> AnyPublisher<Output, Failure>
    func undo() -> AnyPublisher<Void, Failure>
    func validate() -> [Failure]
    func canExecute() -> Bool
}

// MARK: -

extension Command {
    func undo() -> AnyPublisher<Void, Error> {
        Just(())
            .tryMap {
                throw CommandError.undoNotImplemented
            }
            .eraseToAnyPublisher()
    }
}
