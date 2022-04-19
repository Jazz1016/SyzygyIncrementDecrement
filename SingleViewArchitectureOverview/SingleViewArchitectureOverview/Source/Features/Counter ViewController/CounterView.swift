//
//  CounterView.swift
//  SingleViewArchitectureOverview
//
//  Created by Ben Tincher on 4/19/22.
//

import UIKit

class CounterView: BaseView {
    
    // MARK: - UI Elements
    
    let countButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Bump", for: .normal)
        button.setTitleColor(.link, for: .normal)
        
        return button
    }()
    
    let decrementButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Decrement", for: .normal)
        button.setTitleColor(.link, for: .normal)
        
        return button
    }()
    
    let countLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    // MARK: - Button Actions
    
    var bumpAction: UIAction {
        UIAction { [weak self] _ in
            self?.bumpCount()
        }
    }
    
    var decrementAction: UIAction {
        UIAction { [weak self] _ in
            self?.decrementCount()
        }
    }
    
    // MARK: - Properties
    
    let viewModel: CounterViewModel
    
    // MARK: - Initialization
    
    init(viewModel: CounterViewModel) {
        self.viewModel = viewModel
        
        super.init()
        
        setUp()
        setSubscriptions()
    }
}

// MARK: - Set Up

extension CounterView {
    private func setUp() {
        backgroundColor = .systemBackground
        
        addAndConstrainViews()
        
        countButton.addAction(bumpAction, for: .touchUpInside)
        decrementButton.addAction(decrementAction, for: .touchUpInside)
    }
    
    private func addAndConstrainViews() {
        addSubview(countLabel)
        addSubview(countButton)
        addSubview(decrementButton)
        
        subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            countLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            countLabel.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -20),
            
            countButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 50),
            countButton.topAnchor.constraint(equalTo: centerYAnchor, constant: 20),
            
            decrementButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -50),
            decrementButton.topAnchor.constraint(equalTo: centerYAnchor, constant: 20)
        ])
    }
}

// MARK: - Subscriptions

extension CounterView {
    private func setSubscriptions() {
        viewModel.$count
            .receive(on: RunLoop.main)
            .sink { [weak self] in
                self?.countLabel.text = "\($0)"
            }
            .store(in: &cancellables)
    }
}

// MARK: - Button Actions

extension CounterView {
    private func bumpCount() {
        viewModel.send(.bumpCountTapped)
    }
    private func decrementCount(){
        viewModel.send(.decrementCountTapped)
    }
}
