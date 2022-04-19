//
//  CounterViewController.swift
//  SingleViewArchitectureOverview
//
//  Created by Ben Tincher on 4/19/22.
//

import UIKit

class CounterViewController: BaseViewController {
    
    // MARK: - Properties
    
    private let coordinator: CounterCoordinator
    
    // MARK: - Initialization
    
    override init() {
        coordinator = CounterCoordinator()
        
        super.init()
        
        view = CounterView(viewModel: coordinator.viewModel)
        
        coordinator
            .userInterface
            .receive(on: RunLoop.main)
            .sink { [weak self] in
                self?.perform(action: $0)
            }
            .store(in: &cancellables)
    }
}

// MARK: - Action Methods

extension CounterViewController {
    private func perform(action: CounterCoordinator.UIAction) {
        switch action {
        case .presentTenAlert:
            presentTenAlertAction()
        }
    }
    
    private func presentTenAlertAction() {
        let alert = UIAlertController(title: "Woot Woot", message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        
        alert.addAction(UIAlertAction(title: "Reset", style: .default, handler: { [weak self] _ in
            self?.coordinator.send(.resetCountTapped)
        }))
        
        present(alert, animated: true)
    }
}
