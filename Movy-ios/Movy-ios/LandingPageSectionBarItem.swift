//
//  LandingPageSectionViewItem.swift
//  Movy-ios
//
//  Created by Fernando de la Fuente on 6/4/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import UIKit

class LandingPageSectionBarItem: UIStackView {

    private var iconImage: UIImage?
    private var text: String?
    var isSelected: Bool? {
        didSet {
            isSelected == true ?
                (selectionIndicatorView.backgroundColor = UIColor.movyMainSkyBlue) :
                (selectionIndicatorView.backgroundColor = .clear)
            setNeedsDisplay()
        }
    }

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: SectionBarItemConstants.ImageView.height),
            imageView.widthAnchor.constraint(equalToConstant: SectionBarItemConstants.ImageView.height)
        ])
        return imageView
    }()

    lazy var textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = UIColor.movyWhite
        textLabel.sizeToFit()
        return textLabel
    }()

    lazy var paddingView: UIView = {
        let paddingView = UIView()
        paddingView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            paddingView.heightAnchor.constraint(equalToConstant: SectionBarItemConstants.PaddingView.height)
        ])
        return paddingView
    }()

    lazy var selectionIndicatorView: UIView = {
        let selectionIndicatorView = UIView()
        selectionIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        return selectionIndicatorView
    }()

    required init(iconImage: UIImage, text: String, isSelected: Bool = false) {
        super.init(frame: .zero)
        self.iconImage = iconImage
        self.text = text
        self.isSelected = isSelected
        setupView()
        setupLayout()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupLayout()
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupLayout()
    }

    private func setupView() {
        imageView.image = iconImage
        textLabel.text = text

        axis = .vertical
        alignment = .center
        distribution = .equalSpacing
        translatesAutoresizingMaskIntoConstraints = false

        isSelected == true ?
            (selectionIndicatorView.backgroundColor = UIColor.movyMainSkyBlue) :
            (selectionIndicatorView.backgroundColor = .clear)

        addArrangedSubview(paddingView)
        addArrangedSubview(imageView)
        addArrangedSubview(textLabel)
        addArrangedSubview(selectionIndicatorView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            paddingView.leadingAnchor.constraint(equalTo: leadingAnchor),
            paddingView.trailingAnchor.constraint(equalTo: trailingAnchor),

            selectionIndicatorView.heightAnchor.constraint(
                equalToConstant: SectionBarItemConstants.SelectionIndicator.height
            ),
            selectionIndicatorView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: SectionBarItemConstants.SelectionIndicator.leftMargin
            ),
            selectionIndicatorView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: SectionBarItemConstants.SelectionIndicator.rightMargin
            )
        ])
    }
}

private struct SectionBarItemConstants {
    struct SelectionIndicator {
        static let height: CGFloat = 4
        static let leftMargin: CGFloat = 4
        static let rightMargin: CGFloat = -4
    }

    struct PaddingView {
        static let height: CGFloat = 10
    }

    struct ImageView {
        static let height: CGFloat = 27.2
    }
}
