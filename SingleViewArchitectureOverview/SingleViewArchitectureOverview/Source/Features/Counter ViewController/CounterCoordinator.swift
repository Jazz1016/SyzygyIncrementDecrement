//
//  CounterCoordinator.swift
//  SingleViewArchitectureOverview
//
//  Created by Ben Tincher on 4/19/22.
//

import Combine
import Foundation

// MARK: - ViewModel

class CounterViewModel: ViewModel<CounterCoordinator.Action> {
    @Published var count: Int = 0
}

// MARK: - Coordinator

class CounterCoordinator: Coordinator<CounterCoordinator.Action> {
    
    // MARK: - Actions
    
    enum Action {
        case bumpCountTapped
        case decrementCountTapped
        case resetCountTapped
    }
    
    enum UIAction {
        case presentTenAlert
    }
    
    // MARK: - Properties
    
    let userInterface = PassthroughSubject<UIAction, Never>()
    let viewModel: CounterViewModel
    
    // MARK: - Intialization
    
    override init() {
        viewModel = CounterViewModel()
        
        super.init()
        
        merge(with: viewModel)
            .receive(on: dispatchQueue)
            .sink { [weak self] in
                self?.perform(action: $0)
            }
            .store(in: &cancellables)
    }
}

// MARK: - Action Methods

extension CounterCoordinator {
    private func perform(action: Action) {
        switch action {
        case .bumpCountTapped:
            bumpCountTappedAction()
        case .decrementCountTapped:
            decrementTappedAction()
        case .resetCountTapped:
            resetCountTappedAction()
        }
    }
    
    private func bumpCountTappedAction() {
        viewModel.count += 1
        
        if viewModel.count % 10 == 0 {
            userInterface.send(.presentTenAlert)
        }
    }
    
    private func decrementTappedAction() {
        viewModel.count -= 1
        if viewModel.count % 10 == 0 {
            userInterface.send(.presentTenAlert)
        }
    }
    
    private func resetCountTappedAction() {
        viewModel.count = 0
    }
}
