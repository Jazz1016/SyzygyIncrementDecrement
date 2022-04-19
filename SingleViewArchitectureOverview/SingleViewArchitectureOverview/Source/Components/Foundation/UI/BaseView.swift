//
//  BaseView.swift
//  iTAK
//
//  Created by Yas Tabasam on 2/16/21.
//

import Combine
import UIKit

// MARK: - Base View

open class BaseView: UIView {

    // MARK: - Properties

    open var cancellables = Set<AnyCancellable>()

    // MARK: - Initialization

    public init() {
        super.init(frame: .zero)
    }

    @available(*, unavailable)
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        debugPrint("deinit: \(Self.self)")
    }
}

// MARK: - Base Stack View

open class BaseStackView: UIStackView {

    // MARK: - Properties

    open var cancellables = Set<AnyCancellable>()

    // MARK: - Initialization

    override public init(frame: CGRect = .zero) {
        super.init(frame: frame)
    }

    @available(*, unavailable)
    required public init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        debugPrint("deinit: \(Self.self)")
    }
}

// MARK: - Base Table View

open class BaseTableView: UITableView {

    // MARK: - Properties

    open var cancellables = Set<AnyCancellable>()

    // MARK: - Initialization

    override public init(frame: CGRect = .zero, style: UITableView.Style = .plain) {
        super.init(frame: frame, style: style)
        tableFooterView = UIView()
    }

    @available(*, unavailable)
    required public init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        debugPrint("deinit: \(Self.self)")
    }
}

// MARK: - Base ImageView

open class BaseImageView: UIImageView {
    
    // MARK: - Properties

    open var cancellables = Set<AnyCancellable>()

    // MARK: - Initialization

    override public init(frame: CGRect = .zero) {
        super.init(frame: frame)
    }

    @available(*, unavailable)
    required public init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        debugPrint("deinit: \(Self.self)")
    }
}
