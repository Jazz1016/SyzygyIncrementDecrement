//
//  BaseTabBarController.swift
//  FoundationInterface iOS
//
//  Created by Ben Tincher on 1/24/22.
//

import Combine
import UIKit

// MARK: - Base Tab Bar Controller

/// Base tab bar view controller for UIKit views
open class BaseTabBarController: UITabBarController {

    // MARK: - Properties

    open var cancellables = Set<AnyCancellable>()

    // MARK: -

    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        debugPrint("deinit: \(Self.self)")
    }
}
