//
//  ViewModel.swift
//  iTAK
//
//  Created by Yas Tabasam on 1/20/21.
//

import Combine
import Foundation

/// Base class for all view models
open class ViewModel<Output>: NSObject, ObservableObject, Identifiable, Publisher {
    public typealias Failure = Never

    private let action = PassthroughSubject<Output, Failure>()

    public func send(_ input: Output) {
        action.send(input)
    }

    public func receive<S>(subscriber: S) where S: Subscriber, Failure == S.Failure, Output == S.Input {
        action.subscribe(subscriber)
    }

    deinit {
        debugPrint("deinit: \(Self.self)")
    }
}
