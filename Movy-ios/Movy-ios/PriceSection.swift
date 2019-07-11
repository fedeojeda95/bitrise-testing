//
//  PriceSection.swift
//  Movy-ios
//
//  Created by Fernando de la Fuente on 6/5/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import UIKit

class PriceSection: UIView {
    private let descriptionText: UILabel = {
        let text = UILabel()
        text.text = Constants.LandingPage.priceDescriptionText
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

    private let basicTitle: UILabel = {
        let text = UILabel()
        text.text = Constants.LandingPage.priceBasicTitle
        text.font = UIFont.movyBodyTitle
        text.textColor = UIColor.movyWhite
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .center
        text.sizeToFit()
        return text
    }()

    private let standardTitle: UILabel = {
        let text = UILabel()
        text.text = Constants.LandingPage.priceStandarTitle
        text.font = UIFont.movyBodyTitle
        text.textColor = UIColor.movyWhite
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .center
        text.sizeToFit()
        return text
    }()

    private let premiumTitle: UILabel = {
        let text = UILabel()
        text.text = Constants.LandingPage.pricePremiumTitle
        text.font = UIFont.movyBodyTitle
        text.textColor = UIColor.movyWhite
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .center
        text.sizeToFit()
        return text
    }()

    private let titlesStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let prices: PriceStackItem = {
        let item = PriceStackItem(
            firstItem: "US$ \(Constants.Prices.basicPrice)",
            secondItem: "US$ \(Constants.Prices.standarPrice)",
            thirdItem: "US$ \(Constants.Prices.premiumPrice)"
        )
        item.translatesAutoresizingMaskIntoConstraints = false
        return item
    }()

    private let hdAvailableSpecTitle: UILabel = {
        let item = UILabel()
        item.font = UIFont.movyBodyText
        item.textColor = UIColor.movyGreyBody
        item.text = Constants.LandingPage.priceHDAvailable
        item.sizeToFit()
        item.translatesAutoresizingMaskIntoConstraints = false
        return item
    }()

    private let hdAvailableSpecStack: PriceStackItem = {
        let stack = PriceStackItem(
            firstItem: Constants.LandingPage.crossMark,
            secondItem: Constants.LandingPage.checkMark,
            thirdItem: Constants.LandingPage.checkMark
        )
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let ultraHdAvailableSpecTitle: UILabel = {
        let item = UILabel()
        item.font = UIFont.movyBodyText
        item.textColor = UIColor.movyGreyBody
        item.text = Constants.LandingPage.priceUHDAvailable
        item.sizeToFit()
        item.translatesAutoresizingMaskIntoConstraints = false
        return item
    }()

    private let ultraHdAvailableSpecStack: PriceStackItem = {
        let stack = PriceStackItem(
            firstItem: Constants.LandingPage.crossMark,
            secondItem: Constants.LandingPage.checkMark,
            thirdItem: Constants.LandingPage.checkMark
        )
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let screensSpecTitle: UILabel = {
        let item = UILabel()
        item.font = UIFont.movyBodyText
        item.textColor = UIColor.movyGreyBody
        item.text = Constants.LandingPage.pricesScreenNumber
        item.sizeToFit()
        item.translatesAutoresizingMaskIntoConstraints = false
        return item
    }()

    private let screensSpecStack: PriceStackItem = {
        let stack = PriceStackItem(
            firstItem: Constants.LandingPage.crossMark,
            secondItem: Constants.LandingPage.checkMark,
            thirdItem: Constants.LandingPage.checkMark
        )
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let devicesSpecTitle: UILabel = {
        let item = UILabel()
        item.font = UIFont.movyBodyText
        item.textColor = UIColor.movyGreyBody
        item.text = Constants.LandingPage.pricesDevicesAvailables
        item.sizeToFit()
        item.translatesAutoresizingMaskIntoConstraints = false
        return item
    }()

    private let devicesSpecStack: PriceStackItem = {
        let stack = PriceStackItem(
            firstItem: Constants.LandingPage.checkMark,
            secondItem: Constants.LandingPage.checkMark,
            thirdItem: Constants.LandingPage.checkMark
        )
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let unlimitedMoviesSpecTitle: UILabel = {
        let item = UILabel()
        item.font = UIFont.movyBodyText
        item.textColor = UIColor.movyGreyBody
        item.text = Constants.LandingPage.pricesTVandSeriesUnlimited
        item.sizeToFit()
        item.translatesAutoresizingMaskIntoConstraints = false
        return item
    }()

    private let unlimitedMoviesSpecStack: PriceStackItem = {
        let stack = PriceStackItem(
            firstItem: Constants.LandingPage.checkMark,
            secondItem: Constants.LandingPage.checkMark,
            thirdItem: Constants.LandingPage.checkMark
        )
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let cancelWheneverSpecTitle: UILabel = {
        let item = UILabel()
        item.font = UIFont.movyBodyText
        item.textColor = UIColor.movyGreyBody
        item.text = Constants.LandingPage.pricesCancelWhenever
        item.sizeToFit()
        item.translatesAutoresizingMaskIntoConstraints = false
        return item
    }()

    private let cancelWheneverSpecStack: PriceStackItem = {
        let stack = PriceStackItem(
            firstItem: Constants.LandingPage.checkMark,
            secondItem: Constants.LandingPage.checkMark,
            thirdItem: Constants.LandingPage.checkMark
        )
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let monthFreeSpecTitle: UILabel = {
        let item = UILabel()
        item.font = UIFont.movyBodyText
        item.textColor = UIColor.movyGreyBody
        item.text = Constants.LandingPage.pricesFirstMonthFree
        item.sizeToFit()
        item.translatesAutoresizingMaskIntoConstraints = false
        return item
    }()

    private let monthFreeSpecStack: PriceStackItem = {
        let stack = PriceStackItem(
            firstItem: Constants.LandingPage.checkMark,
            secondItem: Constants.LandingPage.checkMark,
            thirdItem: Constants.LandingPage.checkMark
        )
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
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
        addSubview(titlesStack)

        titlesStack.addArrangedSubview(basicTitle)
        titlesStack.addArrangedSubview(standardTitle)
        titlesStack.addArrangedSubview(premiumTitle)

        addSubview(prices)
        addSubview(hdAvailableSpecTitle)
        addSubview(hdAvailableSpecStack)
        addSubview(ultraHdAvailableSpecTitle)
        addSubview(ultraHdAvailableSpecStack)
        addSubview(screensSpecTitle)
        addSubview(screensSpecStack)
        addSubview(devicesSpecTitle)
        addSubview(devicesSpecStack)
        addSubview(unlimitedMoviesSpecTitle)
        addSubview(unlimitedMoviesSpecStack)
        addSubview(cancelWheneverSpecTitle)
        addSubview(cancelWheneverSpecStack)
        addSubview(monthFreeSpecTitle)
        addSubview(monthFreeSpecStack)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            descriptionText.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionText.topAnchor.constraint(equalTo: topAnchor, constant: 47),
            descriptionText.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.80),

            monthFreeButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            monthFreeButton.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: 14),
            monthFreeButton.widthAnchor.constraint(equalToConstant: 208),
            monthFreeButton.heightAnchor.constraint(equalToConstant: 30.8),

            titlesStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            titlesStack.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.80),
            titlesStack.heightAnchor.constraint(equalToConstant: 20),
            titlesStack.topAnchor.constraint(equalTo: monthFreeButton.bottomAnchor, constant: 81.4),

            prices.heightAnchor.constraint(equalToConstant: PriceSectionConstants.commonHeight),
            prices.topAnchor.constraint(equalTo: titlesStack.bottomAnchor, constant: 72),
            prices.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.80),
            prices.centerXAnchor.constraint(equalTo: centerXAnchor),

            hdAvailableSpecTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            hdAvailableSpecTitle.topAnchor.constraint(
                equalTo: prices.bottomAnchor,
                constant: PriceSectionConstants.commonTopMargin),

            hdAvailableSpecStack.heightAnchor.constraint(equalToConstant: PriceSectionConstants.commonHeight),
            hdAvailableSpecStack.topAnchor.constraint(
                equalTo: hdAvailableSpecTitle.bottomAnchor,
                constant: PriceSectionConstants.commonTopMargin),
            hdAvailableSpecStack.widthAnchor.constraint(
                equalTo: widthAnchor,
                multiplier: PriceSectionConstants.widthPercentage),
            hdAvailableSpecStack.centerXAnchor.constraint(equalTo: centerXAnchor),

            ultraHdAvailableSpecTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            ultraHdAvailableSpecTitle.topAnchor.constraint(
                equalTo: hdAvailableSpecStack.bottomAnchor,
                constant: PriceSectionConstants.commonTopMargin),

            ultraHdAvailableSpecStack.heightAnchor.constraint(equalToConstant: PriceSectionConstants.commonHeight),
            ultraHdAvailableSpecStack.topAnchor.constraint(
                equalTo: ultraHdAvailableSpecTitle.bottomAnchor,
                constant: PriceSectionConstants.commonTopMargin),
            ultraHdAvailableSpecStack.widthAnchor.constraint(
                equalTo: widthAnchor,
                multiplier: PriceSectionConstants.widthPercentage),
            ultraHdAvailableSpecStack.centerXAnchor.constraint(equalTo: centerXAnchor),

            screensSpecTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            screensSpecTitle.topAnchor.constraint(
                equalTo: ultraHdAvailableSpecStack.bottomAnchor,
                constant: PriceSectionConstants.commonTopMargin),

            screensSpecStack.heightAnchor.constraint(equalToConstant: PriceSectionConstants.commonHeight),
            screensSpecStack.topAnchor.constraint(
                equalTo: screensSpecTitle.bottomAnchor,
                constant: PriceSectionConstants.commonTopMargin),
            screensSpecStack.widthAnchor.constraint(
                equalTo: widthAnchor,
                multiplier: PriceSectionConstants.widthPercentage),
            screensSpecStack.centerXAnchor.constraint(equalTo: centerXAnchor),

            devicesSpecTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            devicesSpecTitle.topAnchor.constraint(
                equalTo: screensSpecStack.bottomAnchor,
                constant: PriceSectionConstants.commonTopMargin),

            devicesSpecStack.heightAnchor.constraint(equalToConstant: PriceSectionConstants.commonHeight),
            devicesSpecStack.topAnchor.constraint(
                equalTo: devicesSpecTitle.bottomAnchor,
                constant: PriceSectionConstants.commonTopMargin),
            devicesSpecStack.widthAnchor.constraint(
                equalTo: widthAnchor,
                multiplier: PriceSectionConstants.widthPercentage),
            devicesSpecStack.centerXAnchor.constraint(equalTo: centerXAnchor),

            unlimitedMoviesSpecTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            unlimitedMoviesSpecTitle.topAnchor.constraint(
                equalTo: devicesSpecStack.bottomAnchor,
                constant: PriceSectionConstants.commonTopMargin),

            unlimitedMoviesSpecStack.heightAnchor.constraint(equalToConstant: PriceSectionConstants.commonHeight),
            unlimitedMoviesSpecStack.topAnchor.constraint(
                equalTo: unlimitedMoviesSpecTitle.bottomAnchor,
                constant: PriceSectionConstants.commonTopMargin),
            unlimitedMoviesSpecStack.widthAnchor.constraint(
                equalTo: widthAnchor,
                multiplier: PriceSectionConstants.widthPercentage),
            unlimitedMoviesSpecStack.centerXAnchor.constraint(equalTo: centerXAnchor),

            cancelWheneverSpecTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            cancelWheneverSpecTitle.topAnchor.constraint(
                equalTo: unlimitedMoviesSpecStack.bottomAnchor,
                constant: PriceSectionConstants.commonTopMargin),

            cancelWheneverSpecStack.heightAnchor.constraint(equalToConstant: PriceSectionConstants.commonHeight),
            cancelWheneverSpecStack.topAnchor.constraint(
                equalTo: cancelWheneverSpecTitle.bottomAnchor,
                constant: PriceSectionConstants.commonTopMargin),
            cancelWheneverSpecStack.widthAnchor.constraint(
                equalTo: widthAnchor,
                multiplier: PriceSectionConstants.widthPercentage),
            cancelWheneverSpecStack.centerXAnchor.constraint(equalTo: centerXAnchor),

            monthFreeSpecTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            monthFreeSpecTitle.topAnchor.constraint(
                equalTo: cancelWheneverSpecStack.bottomAnchor,
                constant: PriceSectionConstants.commonTopMargin),

            monthFreeSpecStack.heightAnchor.constraint(equalToConstant: PriceSectionConstants.commonHeight),
            monthFreeSpecStack.topAnchor.constraint(
                equalTo: monthFreeSpecTitle.bottomAnchor,
                constant: PriceSectionConstants.commonTopMargin),
            monthFreeSpecStack.widthAnchor.constraint(
                equalTo: widthAnchor,
                multiplier: PriceSectionConstants.widthPercentage),
            monthFreeSpecStack.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
    }
}

private struct PriceSectionConstants {
    static let commonTopMargin: CGFloat = 25.9
    static let widthPercentage: CGFloat = 0.70
    static let commonHeight: CGFloat = 19
}
