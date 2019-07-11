//
//  CancelView.swift
//  Movy-ios
//
//  Created by Fernando de la Fuente on 6/5/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import UIKit

class CancelSection: UIView {
    private let descriptionText: UILabel = {
        let text = UILabel()
        text.text = Constants.LandingPage.cancelDescriptionText
        text.font = UIFont.movyHeader3Text
        text.textColor = UIColor.movyWhite
        text.translatesAutoresizingMaskIntoConstraints = false
        text.numberOfLines = 3
        text.textAlignment = .center
        text.sizeToFit()
        return text
    }()

    private let monthFreeButton: MovyButton = {
        let button = MovyButton()
        button.setTitle(Constants.LandingPage.freeMonthButton, for: .normal)
        button.titleLabel?.font = UIFont.smallTextButton
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let laptopImage: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "cancel_laptop"))
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private let cancelIconImage: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "cancel_icon"))
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
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
        addSubview(descriptionText)
        addSubview(monthFreeButton)
        addSubview(laptopImage)
        addSubview(cancelIconImage)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            descriptionText.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionText.topAnchor.constraint(
                equalTo: topAnchor,
                constant: CancelSectionConstants.DescriptionText.topMargin
            ),
            descriptionText.widthAnchor.constraint(
                equalTo: widthAnchor,
                multiplier: CancelSectionConstants.DescriptionText.widtPercentage
            ),

            monthFreeButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            monthFreeButton.topAnchor.constraint(
                equalTo: descriptionText.bottomAnchor,
                constant: CancelSectionConstants.MonthFreeButton.topMargin
            ),
            monthFreeButton.widthAnchor.constraint(equalToConstant: CancelSectionConstants.MonthFreeButton.width),
            monthFreeButton.heightAnchor.constraint(equalToConstant: CancelSectionConstants.MonthFreeButton.height),

            laptopImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            laptopImage.widthAnchor.constraint(equalToConstant: CancelSectionConstants.LaptopImage.width),
            laptopImage.heightAnchor.constraint(equalToConstant: CancelSectionConstants.LaptopImage.height),
            laptopImage.topAnchor.constraint(
                equalTo: monthFreeButton.bottomAnchor,
                constant: CancelSectionConstants.LaptopImage.topMargin
            ),

            cancelIconImage.widthAnchor.constraint(equalToConstant: CancelSectionConstants.CancelIcon.width),
            cancelIconImage.heightAnchor.constraint(equalToConstant: CancelSectionConstants.CancelIcon.width),
            cancelIconImage.bottomAnchor.constraint(
                equalTo: laptopImage.topAnchor,
                constant: CancelSectionConstants.CancelIcon.margin
            ),
            cancelIconImage.leadingAnchor.constraint(
                equalTo: laptopImage.leadingAnchor,
                constant: CancelSectionConstants.CancelIcon.margin
            )
        ])
    }
}

private struct CancelSectionConstants {
    struct DescriptionText {
        static let topMargin: CGFloat = 47
        static let widtPercentage: CGFloat = 0.80
    }

    struct MonthFreeButton {
        static let topMargin: CGFloat = 14
        static let width: CGFloat = 208
        static let height: CGFloat = 30.8
    }

    struct LaptopImage {
        static let width: CGFloat = 327
        static let height: CGFloat = 175
        static let topMargin: CGFloat = 90
    }

    struct CancelIcon {
        static let width: CGFloat = 48
        static let margin: CGFloat = 24
    }
}
