//
//  BaseCollectionReusableView.swift
//  iTAK
//
//  Created by Frank Martin on 9/8/21.
//

import UIKit

open class BaseCollectionReusableView: UICollectionReusableView {

    // MARK: -

    public static var reuseIdentifier: String {
        String(describing: Self.self)
    }

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
