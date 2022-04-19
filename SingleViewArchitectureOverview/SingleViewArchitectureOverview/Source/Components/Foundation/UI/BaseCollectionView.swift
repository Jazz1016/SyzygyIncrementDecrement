//
//  BaseCollectionView.swift
//  iTAK
//
//  Created by Frank Martin on 6/16/21.
//

import Combine
import UIKit

open class BaseCollectionView: UICollectionView {

    // MARK: - Properties

    open var cancellables = Set<AnyCancellable>()

    // MARK: -

    override public init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }

    @available(*, unavailable)
    required public init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        debugPrint("deinit: \(Self.self)")
    }
}

// MARK: -

open class BaseCollectionViewController: UICollectionViewController {

    // MARK: -

    open var cancellables = Set<AnyCancellable>()

    // MARK: -

    public init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required public init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        debugPrint("deinit: \(Self.self)")
    }
}
