//
//  ViewController.swift
//  Movy-ios
//
//  Created by Fernando de la Fuente on 6/3/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import UIKit
import RealmSwift

class LandingPageController: UIViewController {

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .clear
        return scrollView
    }()

    private let scrollViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let topView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()

    private let sectionsBar: LandingPageSectionsBar = {
        let view = LandingPageSectionsBar()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: LandingPageConstants.SectionsBar.height).isActive = true
        view.backgroundColor = .black
        return view
    }()

    private let bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: LandingPageConstants.BottomView.height).isActive = true
        view.backgroundColor = .black
        return view
    }()

    private let backgroundImage: UIImageViewAligned = {
        let imageView = UIImageViewAligned(image: #imageLiteral(resourceName: "main_background"))
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.alignTop = true
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let topBarView: LandingPageTopBar = {
        let topBarView = LandingPageTopBar()
        topBarView.translatesAutoresizingMaskIntoConstraints = false
        return topBarView
    }()

    private let tryNowButton: MovyButton = {
        let button = MovyButton()
        button.accessibilityIdentifier = AccessibilityConstants.LandingPage.tryNowButton
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.LandingPage.tryNowButtonTitle, for: .normal)
        button.titleLabel?.font = UIFont.tryNowButtonFont
        return button
    }()

    private let headerText: UILabel = {
        let text = UILabel()
        text.text = Constants.LandingPage.headerText
        text.font = UIFont.movyHeader1Text
        text.textColor = UIColor.movyWhite
        text.sizeToFit()
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()

    private let subHeaderText: UILabel = {
        let text = UILabel()
        text.text = Constants.LandingPage.subHeaderText
        text.font = UIFont.movyHeader2Text
        text.textColor = UIColor.movyWhite
        text.sizeToFit()
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()

    private let priceView: PriceSection = {
        let view = PriceSection()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: LandingPageConstants.PriceView.height).isActive = true
        return view
    }()

    private let cancelView: CancelSection = {
        let view = CancelSection()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: LandingPageConstants.CancelView.height).isActive = true
        view.isHidden = true
        return view
    }()

    private let devicesView: DevicesSection = {
        let view = DevicesSection()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: LandingPageConstants.DevicesView.height).isActive = true
        view.isHidden = true
        return view
    }()

    private let gradientView: TopOpaqueGradientView = {
        let view = TopOpaqueGradientView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
    }

    private func setupView() {
        view.accessibilityIdentifier = AccessibilityConstants.LandingPage.landingPage

        sectionsBar.landingPageSectionsBarDelegate = self
        tryNowButton.addTarget(self, action: #selector(onTapTryNowButton), for: .touchUpInside)

        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)

        scrollViewContainer.addArrangedSubview(topView)
        scrollViewContainer.addArrangedSubview(priceView)
        scrollViewContainer.addArrangedSubview(cancelView)
        scrollViewContainer.addArrangedSubview(devicesView)

        topView.addSubview(backgroundImage)
        topView.addSubview(gradientView)
        topView.addSubview(topBarView)
        topView.addSubview(headerText)
        topView.addSubview(subHeaderText)
        topView.addSubview(tryNowButton)
        topView.addSubview(sectionsBar)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])

        setupTopViewConstraints()
    }

    private func setupTopViewConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
            backgroundImage.heightAnchor.constraint(equalTo: topView.heightAnchor),
            backgroundImage.topAnchor.constraint(equalTo: topView.topAnchor),

            gradientView.widthAnchor.constraint(equalTo: view.widthAnchor),
            gradientView.heightAnchor.constraint(equalToConstant: 200),
            gradientView.topAnchor.constraint(equalTo: topView.topAnchor),
            gradientView.leadingAnchor.constraint(equalTo: topView.leadingAnchor),

            topBarView.topAnchor.constraint(equalTo: topView.topAnchor),
            topBarView.heightAnchor.constraint(equalToConstant: LandingPageConstants.TopBar.height),
            topBarView.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            topBarView.trailingAnchor.constraint(equalTo: topView.trailingAnchor),

            headerText.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            headerText.bottomAnchor.constraint(
                equalTo: subHeaderText.topAnchor,
                constant: LandingPageConstants.HeaderText.bottomMargin
            ),

            subHeaderText.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            subHeaderText.bottomAnchor.constraint(
                equalTo: tryNowButton.topAnchor,
                constant: LandingPageConstants.SubHeaderText.bottomMargin
            ),

            tryNowButton.heightAnchor.constraint(equalToConstant: LandingPageConstants.TryNowButton.height),
            tryNowButton.widthAnchor.constraint(equalToConstant: LandingPageConstants.TryNowButton.width),
            tryNowButton.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            tryNowButton.bottomAnchor.constraint(
                equalTo: sectionsBar.topAnchor,
                constant: LandingPageConstants.TryNowButton.bottomMargin
            ),

            sectionsBar.topAnchor.constraint(
                equalTo: topView.topAnchor,
                constant: LandingPageConstants.SectionsBar.topMargin
            ),
            sectionsBar.bottomAnchor.constraint(equalTo: topView.bottomAnchor),
            sectionsBar.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            sectionsBar.trailingAnchor.constraint(equalTo: topView.trailingAnchor)
        ])
    }

    @objc func onTapTryNowButton(sender: UIButton) {
        let mainTabBarController = MainTabBarController()
        present(mainTabBarController, animated: true, completion: nil)
    }
}

private struct LandingPageConstants {
    struct BottomView {
        static let height: CGFloat = 459
    }

    struct PriceView {
        static let height: CGFloat = 1041
    }

    struct CancelView {
        static let height: CGFloat = 459
    }

    struct DevicesView {
        static let height: CGFloat = 1276
    }

    struct TopBar {
        static let height: CGFloat = 130
    }

    struct SectionsBar {
        static let topMargin: CGFloat = 613
        static let height: CGFloat = 90
    }

    struct TryNowButton {
        static let height: CGFloat = 48
        static let width: CGFloat = 195
        static let bottomMargin: CGFloat = -140
    }

    struct SubHeaderText {
        static let bottomMargin: CGFloat = -48
    }

    struct HeaderText {
        static let bottomMargin: CGFloat = -6
    }
}

extension LandingPageController: LandingPageSectionsBarDelegate {
    func onPriceTapEvent() {
        priceView.isHidden = false
        cancelView.isHidden = true
        devicesView.isHidden = true
    }

    func onCancelTapEvent() {
        priceView.isHidden = true
        cancelView.isHidden = false
        devicesView.isHidden = true
    }

    func onDevicesTapEvent() {
        priceView.isHidden = true
        cancelView.isHidden = true
        devicesView.isHidden = false
    }
}
