//
//  NavigationController.swift
//  FoundationInterface iOS
//
//  Created by Ben Tincher on 1/24/22.
//

import UIKit

public protocol NavigationControllerDelegate: UINavigationControllerDelegate {
    func controllerDidDisappear(controller: UIViewController)
    func controllerDidDisappear(controller: UINavigationController)
}

// MARK: -

open class NavigationController: UINavigationController {
    private weak var customDelegate: NavigationControllerDelegate? {
        delegate as? NavigationControllerDelegate
    }

    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        customDelegate?.controllerDidDisappear(controller: self)
    }
}
