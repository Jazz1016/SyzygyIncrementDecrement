//
//  BaseTableHeaderFooterView.swift
//  iTAK
//
//  Created by Frank Martin on 6/21/21.
//

import UIKit

open class BaseTableHeaderFooterView: UITableViewHeaderFooterView {

    // MARK: -

    static var reuseIdentifier: String {
        String(describing: Self.self)
    }

    // MARK: -

    override public init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }

    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
