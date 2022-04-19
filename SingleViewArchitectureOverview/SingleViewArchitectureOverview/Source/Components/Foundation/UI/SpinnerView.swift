//
//  SpinnerView.swift
//  iTAK
//
//  Created by Yas Tabasam on 5/19/21.
//

import UIKit

public protocol HasSpinner: UIViewController {
    var spinner: SpinnerView { get }
}

public extension HasSpinner {
    var spinner: SpinnerView {
        let spinner = SpinnerView()
        
        view.addSubview(spinner)
        
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        return spinner
    }
}

open class SpinnerView: UIVisualEffectView {

    // MARK: -
    
    static var spinnerColor: UIColor = .secondaryLabel
    static var backgroundColor: UIColor = .clear
    static var hasBlurEffect: Bool = false
    
    static var blurEffect: UIVisualEffect? {
        return hasBlurEffect ? UIBlurEffect(style: .regular) : nil
    }

    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)

        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.color = spinnerColor
        
        return spinner
    }()

    open var animate: Bool = false {
        didSet {
            animate ? showSpinner() : hideSpinner()
        }
    }

    // MARK: - 

    public init() {
        super.init(effect: nil)
        setUp()
    }

    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        debugPrint("deinit: \(Self.self)")
    }
}

// MARK: - Internal Methods

extension SpinnerView {
    public static func customizeSpinnerView(
        backgroundColor: UIColor?,
        spinnerColor: UIColor?,
        hasBlurEffect: Bool
    ) {
        if let backgroundColor = backgroundColor {
            SpinnerView.backgroundColor = backgroundColor
        }
        
        if let spinnerColor = spinnerColor {
            SpinnerView.spinnerColor = spinnerColor
        }
        
        SpinnerView.hasBlurEffect = hasBlurEffect
    }
}

// MARK: - Private Methods

extension SpinnerView {
    private func setUp() {
        effect = SpinnerView.blurEffect
        layer.cornerRadius = 10
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = false
        alpha = 0
        backgroundColor = SpinnerView.backgroundColor

        contentView.addSubview(spinner)

        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 100),
            heightAnchor.constraint(equalToConstant: 100),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    private func showSpinner() {
        spinner.startAnimating()

        UIView.animate(withDuration: 0.35) {
            self.alpha = 1
        }
    }

    private func hideSpinner() {
        spinner.stopAnimating()

        UIView.animate(withDuration: 0.35) {
            self.alpha = 0
        }
    }
}
