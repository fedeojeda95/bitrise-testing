//
//  LandingPageSectionsBar.swift
//  Movy-ios
//
//  Created by Fernando de la Fuente on 6/5/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import UIKit

class LandingPageSectionsBar: UIView {
    weak var landingPageSectionsBarDelegate: LandingPageSectionsBarDelegate?

    private let priceSectionView: LandingPageSectionBarItem = {
        let priceSectionView = LandingPageSectionBarItem(
            iconImage: #imageLiteral(resourceName: "price_icon"),
            text: Constants.LandingPage.priceSectionTitle,
            isSelected: true
        )
        return priceSectionView
    }()

    private let cancelSectionView: LandingPageSectionBarItem = {
        let cancelSectionView = LandingPageSectionBarItem(
            iconImage: #imageLiteral(resourceName: "cancel_icon"),
            text: Constants.LandingPage.cancelSectionTitle,
            isSelected: false
        )
        return cancelSectionView
    }()

    private let devicesSectionView: LandingPageSectionBarItem = {
        let devicesSectionView = LandingPageSectionBarItem(
            iconImage: #imageLiteral(resourceName: "devices_icon"),
            text: Constants.LandingPage.devicesSectionTitle,
            isSelected: false
        )
        return devicesSectionView
    }()

    private let sectionsView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        addSubview(sectionsView)
        sectionsView.addArrangedSubview(priceSectionView)
        sectionsView.addArrangedSubview(cancelSectionView)
        sectionsView.addArrangedSubview(devicesSectionView)

        addTapGestures()
    }

    private func addTapGestures() {
        let tapGesturePriceSection = UITapGestureRecognizer(
            target: self,
            action: #selector(tapOnPriceSection)
        )
        priceSectionView.addGestureRecognizer(tapGesturePriceSection)

        let tapGestureCancelSection = UITapGestureRecognizer(
            target: self,
            action: #selector(tapOnCancelSection)
        )
        cancelSectionView.addGestureRecognizer(tapGestureCancelSection)

        let tapGestureDevicesSection = UITapGestureRecognizer(
            target: self,
            action: #selector(tapOnDevicesSection)
        )
        devicesSectionView.addGestureRecognizer(tapGestureDevicesSection)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            sectionsView.topAnchor.constraint(equalTo: topAnchor),
            sectionsView.bottomAnchor.constraint(equalTo: bottomAnchor),
            sectionsView.leadingAnchor.constraint(equalTo: leadingAnchor),
            sectionsView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    @objc func tapOnPriceSection(sender: UITapGestureRecognizer) {
        guard priceSectionView.isSelected == false else { return }
        landingPageSectionsBarDelegate?.onPriceTapEvent()
        priceSectionView.isSelected = true
        cancelSectionView.isSelected = false
        devicesSectionView.isSelected = false
    }

    @objc func tapOnCancelSection(sender: UITapGestureRecognizer) {
        guard cancelSectionView.isSelected == false else { return }
        landingPageSectionsBarDelegate?.onCancelTapEvent()
        cancelSectionView.isSelected = true
        priceSectionView.isSelected = false
        devicesSectionView.isSelected = false
    }

    @objc func tapOnDevicesSection(sender: UITapGestureRecognizer) {
        guard devicesSectionView.isSelected == false else { return }
        landingPageSectionsBarDelegate?.onDevicesTapEvent()
        devicesSectionView.isSelected = true
        priceSectionView.isSelected = false
        cancelSectionView.isSelected = false
    }
}
