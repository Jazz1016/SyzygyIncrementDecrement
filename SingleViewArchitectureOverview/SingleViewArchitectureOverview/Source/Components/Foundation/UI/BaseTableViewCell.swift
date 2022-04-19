//
//  BaseTableViewCell.swift
//  iTAK
//
//  Created by Yas Tabasam on 2/1/21.
//

import Combine
import UIKit

open class BaseTableViewCell: UITableViewCell {

    // MARK: -

    public static var reuseIdentifier: String { String(describing: Self.self) }

    open var cancellables = Set<AnyCancellable>()

    // MARK: - Initialization

    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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

    deinit {
        debugPrint("deinit: \(Self.self)")
    }
}
