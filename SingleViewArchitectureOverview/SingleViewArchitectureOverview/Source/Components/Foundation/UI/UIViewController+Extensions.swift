//
//  UIViewController+Extensions.swift
//  FoundationInterface iOS
//
//  Created by Ben Tincher on 1/24/22.
//

import UIKit

public extension UIViewController {
    /// Convenience method to present error popup
    func show(error: Error) {
        let alert = UIAlertController(
            title: "Error",
            message: error.localizedDescription,
            preferredStyle: .alert
        )

        alert.addAction(UIAlertAction(title: "OK", style: .cancel))

        present(alert, animated: true)
    }
}
