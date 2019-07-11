//
//  PriceStackItem.swift
//  Movy-ios
//
//  Created by Fernando de la Fuente on 6/5/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import UIKit

class PriceStackItem: UIStackView {

    private let firstItem: UILabel = {
        let item = UILabel()
        item.font = UIFont.movyBodyText
        item.textColor = UIColor.movyGreyBody
        item.sizeToFit()
        return item
    }()

    private let secondItem: UILabel = {
        let item = UILabel()
        item.font = UIFont.movyBodyText
        item.textColor = UIColor.movyGreyBody
        item.sizeToFit()
        return item
    }()

    private let thirdItem: UILabel = {
        let item = UILabel()
        item.font = UIFont.movyBodyText
        item.textColor = UIColor.movyGreyBody
        item.sizeToFit()
        return item
    }()

    private let firstSeparatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 1).isActive = true
        view.backgroundColor = UIColor.movyGrey
        return view
    }()

    private let secondSeparatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 1).isActive = true
        view.backgroundColor = UIColor.movyGrey
        return view
    }()

    required init(firstItem: String, secondItem: String, thirdItem: String) {
        super.init(frame: .zero)
        self.firstItem.text = firstItem
        self.secondItem.text = secondItem
        self.thirdItem.text = thirdItem
        setupView()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        axis = .horizontal
        distribution = .equalSpacing
        alignment = .center
        addArrangedSubview(firstItem)
        addArrangedSubview(firstSeparatorView)
        addArrangedSubview(secondItem)
        addArrangedSubview(secondSeparatorView)
        addArrangedSubview(thirdItem)

        NSLayoutConstraint.activate([
            firstSeparatorView.heightAnchor.constraint(equalTo: heightAnchor),
            secondSeparatorView.heightAnchor.constraint(equalTo: heightAnchor)
        ])
    }
}
