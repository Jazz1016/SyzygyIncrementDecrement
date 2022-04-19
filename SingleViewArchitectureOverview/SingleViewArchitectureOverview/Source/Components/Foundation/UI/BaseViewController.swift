//
//  BaseViewController.swift
//  iTAK
//
//  Created by Yas Tabasam on 2/4/21.
//

import Combine
import SwiftUI
import UIKit

/// Base controller for UIKit views
open class BaseViewController: UIViewController {

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

/// Base table view controller for UIKit views
open class BaseListViewController: UITableViewController {

    // MARK: - Properties

    open var cancellables = Set<AnyCancellable>()

    // MARK: -

    override public init(style: UITableView.Style = .plain) {
        super.init(style: style)
    }

    @available(*, unavailable)
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        debugPrint("deinit: \(Self.self)")
    }
}

// MARK: - BaseHostingController

/// Base controller for SwiftUI views
open class BaseHostingController<RootView: SwiftUI.View>: UIHostingController<RootView> {

    // MARK: - Properties

    open var cancellables = Set<AnyCancellable>()

    // MARK: -

    override public init(rootView: RootView) {
        super.init(rootView: rootView)
    }

    @available(*, unavailable)
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        debugPrint("deinit: \(Self.self)")
    }
}
