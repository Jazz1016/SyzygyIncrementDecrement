//
//  BaseLabel.swift
//  iTAK
//
//  Created by Frank Martin on 8/2/21.
//

import UIKit

open class BaseLabel: UILabel {

    // MARK: -

    override public init(frame: CGRect) {
        super.init(frame: frame)
    }

    @available(*, unavailable)
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        debugPrint("deinit: \(Self.self)")
    }
}
