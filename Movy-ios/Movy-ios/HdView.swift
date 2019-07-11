//
//  HdView.swift
//  Movy-ios
//
//  Created by Fernando de la Fuente on 6/18/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import UIKit

class HdView: UIView {
    private let hdLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.movyWhite
        label.font = UIFont.hdViewFont
        label.text = Constants.Profile.HdLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        setupLayout()
    }

    private func setupView() {
        layer.cornerRadius = HdViewConstants.cornerRadius
        layer.borderWidth = HdViewConstants.borderWidth
        layer.borderColor = UIColor.movyWhite.cgColor
        addSubview(hdLabel)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            hdLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            hdLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

private struct HdViewConstants {
    static let cornerRadius: CGFloat = 5
    static let borderWidth: CGFloat = 1
    static let height: CGFloat = 23.1
    static let width: CGFloat = 50
}
