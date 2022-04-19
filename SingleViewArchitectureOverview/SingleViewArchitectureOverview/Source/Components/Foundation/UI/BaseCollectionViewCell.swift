//
//  BaseViewCell.swift
//  iTAK
//
//  Created by Yas Tabasam on 2/25/21.
//

import Combine
import UIKit

open class BaseCollectionViewCell: UICollectionViewCell {

    // MARK: -

    public static var reuseIdentifier: String { String(describing: Self.self) }

    // MARK: -

    open var cancellables = Set<AnyCancellable>()

    // MARK: -

    override public init(frame: CGRect = .zero) {
        super.init(frame: frame)
    }

    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    public override func prepareForReuse() {
        super.prepareForReuse()
        cancellables.forEach { $0.cancel() }
    }
}
