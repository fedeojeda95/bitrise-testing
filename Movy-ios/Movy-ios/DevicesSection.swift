//
//  DevicesSection.swift
//  Movy-ios
//
//  Created by Fernando de la Fuente on 6/5/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import UIKit

class DevicesSection: UIView {
    private let descriptionText: UILabel = {
        let text = UILabel()
        text.text = Constants.LandingPage.devicesDescriptionText
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

    private let tvImage: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "devices_tv"))
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private let deviceOneTitle: UILabel = {
        let text = UILabel()
        text.text = Constants.LandingPage.devicesDeviceOneTitle
        text.font = UIFont.movyBodyTitle
        text.textColor = UIColor.movyWhite
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .center
        text.sizeToFit()
        return text
    }()

    private let deviceOneDescription: UILabel = {
        let text = UILabel()
        text.text = Constants.LandingPage.devicesDeviceOneDescription
        text.font = UIFont.movyBodyText
        text.textColor = UIColor.movyWhite
        text.translatesAutoresizingMaskIntoConstraints = false
        text.numberOfLines = 2
        text.textAlignment = .center
        text.sizeToFit()
        return text
    }()

    private let tabletImage: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "devices_tablet"))
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private let deviceTwoTitle: UILabel = {
        let text = UILabel()
        text.text = Constants.LandingPage.devicesDeviceTwoTitle
        text.font = UIFont.movyBodyTitle
        text.textColor = UIColor.movyWhite
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .center
        text.numberOfLines = 2
        text.sizeToFit()
        return text
    }()

    private let deviceTwoDescription: UILabel = {
        let text = UILabel()
        text.text = Constants.LandingPage.devicesDeviceTwoDescription
        text.font = UIFont.movyBodyText
        text.textColor = UIColor.movyWhite
        text.translatesAutoresizingMaskIntoConstraints = false
        text.numberOfLines = 2
        text.textAlignment = .center
        text.sizeToFit()
        return text
    }()

    private let laptopImage: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "cancel_laptop"))
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private let deviceThreeTitle: UILabel = {
        let text = UILabel()
        text.text = Constants.LandingPage.devicesDeviceThreeTitle
        text.font = UIFont.movyBodyTitle
        text.textColor = UIColor.movyWhite
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .center
        text.sizeToFit()
        return text
    }()

    private let deviceThreeDescription: UILabel = {
        let text = UILabel()
        text.text = Constants.LandingPage.devicesDeviceThreeDescription
        text.font = UIFont.movyBodyText
        text.textColor = UIColor.movyWhite
        text.translatesAutoresizingMaskIntoConstraints = false
        text.numberOfLines = 2
        text.textAlignment = .center
        text.sizeToFit()
        return text
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
        addSubview(tvImage)
        addSubview(deviceOneTitle)
        addSubview(deviceOneDescription)
        addSubview(tabletImage)
        addSubview(deviceTwoTitle)
        addSubview(deviceTwoDescription)
        addSubview(laptopImage)
        addSubview(deviceThreeTitle)
        addSubview(deviceThreeDescription)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            descriptionText.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionText.topAnchor.constraint(
                equalTo: topAnchor,
                constant: DevicesSectionConstants.DescriptionText.topMargin
            ),
            descriptionText.widthAnchor.constraint(
                equalTo: widthAnchor,
                multiplier: DevicesSectionConstants.widthPercentage
            ),

            monthFreeButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            monthFreeButton.topAnchor.constraint(
                equalTo: descriptionText.bottomAnchor,
                constant: DevicesSectionConstants.MonthFreeButton.topMargin
            ),
            monthFreeButton.widthAnchor.constraint(equalToConstant: DevicesSectionConstants.MonthFreeButton.width),
            monthFreeButton.heightAnchor.constraint(equalToConstant: DevicesSectionConstants.MonthFreeButton.height),

            tvImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            tvImage.widthAnchor.constraint(equalToConstant: DevicesSectionConstants.TvImage.width),
            tvImage.heightAnchor.constraint(equalToConstant: DevicesSectionConstants.TvImage.height),
            tvImage.topAnchor.constraint(
                equalTo: monthFreeButton.bottomAnchor,
                constant: DevicesSectionConstants.TvImage.topMargin
            ),

            deviceOneTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            deviceOneTitle.topAnchor.constraint(
                equalTo: tvImage.bottomAnchor,
                constant: DevicesSectionConstants.DeviceOneTitle.topMargin
            ),

            deviceOneDescription.centerXAnchor.constraint(equalTo: centerXAnchor),
            deviceOneDescription.topAnchor.constraint(
                equalTo: deviceOneTitle.bottomAnchor,
                constant: DevicesSectionConstants.DeviceOneDescription.topMargin
            ),
            deviceOneDescription.widthAnchor.constraint(
                equalTo: widthAnchor,
                multiplier: DevicesSectionConstants.widthPercentage
            ),

            tabletImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            tabletImage.widthAnchor.constraint(equalToConstant: DevicesSectionConstants.TabletImage.width),
            tabletImage.heightAnchor.constraint(equalToConstant: DevicesSectionConstants.TabletImage.height),
            tabletImage.topAnchor.constraint(
                equalTo: deviceOneDescription.bottomAnchor,
                constant: DevicesSectionConstants.TabletImage.topMargin
            ),

            deviceTwoTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            deviceTwoTitle.topAnchor.constraint(
                equalTo: tabletImage.bottomAnchor,
                constant: DevicesSectionConstants.DeviceTwoTitle.topMargin
            ),
            deviceTwoTitle.widthAnchor.constraint(
                equalTo: widthAnchor,
                multiplier: DevicesSectionConstants.widthPercentage
            ),

            deviceTwoDescription.centerXAnchor.constraint(equalTo: centerXAnchor),
            deviceTwoDescription.topAnchor.constraint(
                equalTo: deviceTwoTitle.bottomAnchor,
                constant: DevicesSectionConstants.DeviceTwoDescription.topMargin
            ),
            deviceTwoDescription.widthAnchor.constraint(
                equalTo: widthAnchor,
                multiplier: DevicesSectionConstants.widthPercentage
            ),

            laptopImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            laptopImage.widthAnchor.constraint(equalToConstant: DevicesSectionConstants.LaptopImage.width),
            laptopImage.heightAnchor.constraint(equalToConstant: DevicesSectionConstants.LaptopImage.height),
            laptopImage.topAnchor.constraint(
                equalTo: deviceTwoDescription.bottomAnchor,
                constant: DevicesSectionConstants.LaptopImage.topMargin
            ),

            deviceThreeTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            deviceThreeTitle.topAnchor.constraint(
                equalTo: laptopImage.bottomAnchor,
                constant: DevicesSectionConstants.DeviceThreeTitle.topMargin
            ),

            deviceThreeDescription.centerXAnchor.constraint(equalTo: centerXAnchor),
            deviceThreeDescription.topAnchor.constraint(
                equalTo: deviceThreeTitle.bottomAnchor,
                constant: DevicesSectionConstants.DeviceThreeDescription.topMargin
            ),
            deviceThreeDescription.widthAnchor.constraint(
                equalTo: widthAnchor,
                multiplier: DevicesSectionConstants.widthPercentage
            )
            ])
    }
    // swiftlint:enable function_body_length
}

private struct DevicesSectionConstants {
    static let widthPercentage: CGFloat = 0.80

    struct DeviceThreeDescription {
        static let topMargin: CGFloat = 13
    }

    struct DeviceThreeTitle {
        static let topMargin: CGFloat = 42
    }

    struct LaptopImage {
        static let width: CGFloat = 316
        static let height: CGFloat = 168
        static let topMargin: CGFloat = 55
    }

    struct DeviceTwoDescription {
        static let topMargin: CGFloat = 13
    }

    struct DeviceTwoTitle {
        static let topMargin: CGFloat = 50
    }

    struct TabletImage {
        static let width: CGFloat = 238
        static let height: CGFloat = 207
        static let topMargin: CGFloat = 37
    }

    struct DeviceOneDescription {
        static let topMargin: CGFloat = 6
    }

    struct DeviceOneTitle {
        static let topMargin: CGFloat = 38
    }

    struct DescriptionText {
        static let topMargin: CGFloat = 47
    }

    struct MonthFreeButton {
        static let topMargin: CGFloat = 14
        static let width: CGFloat = 208
        static let height: CGFloat = 30.8
    }

    struct TvImage {
        static let width: CGFloat = 327
        static let height: CGFloat = 175
        static let topMargin: CGFloat = 90
    }

    struct CancelIcon {
        static let width: CGFloat = 48
        static let margin: CGFloat = 24
    }
}
