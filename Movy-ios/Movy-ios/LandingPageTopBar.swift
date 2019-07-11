//
//  LandingPageTopBar.swift
//  Movy-ios
//
//  Created by Fernando de la Fuente on 6/5/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import UIKit

class LandingPageTopBar: UIView {

    private let loginButton: MovyButton = {
        let loginButton = MovyButton()
        loginButton.setTitle(Constants.LandingPage.loginButtonTitle, for: .normal)
        loginButton.titleLabel?.font = UIFont.smallTextButton
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        return loginButton
    }()

    private let movyLogoView: MovyLogo = {
        let movyLogoView = MovyLogo()
        movyLogoView.translatesAutoresizingMaskIntoConstraints = false
        return movyLogoView
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
        backgroundColor = .clear
        addSubview(loginButton)
        addSubview(movyLogoView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            loginButton.heightAnchor.constraint(equalToConstant: TopBarConstants.LoginButton.height),
            loginButton.widthAnchor.constraint(equalToConstant: TopBarConstants.LoginButton.width),
            loginButton.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: TopBarConstants.LoginButton.rightMargin
            ),
            loginButton.centerYAnchor.constraint(equalTo: centerYAnchor),

            movyLogoView.heightAnchor.constraint(equalToConstant: TopBarConstants.MovyLogo.height),
            movyLogoView.widthAnchor.constraint(equalToConstant: TopBarConstants.MovyLogo.width),
            movyLogoView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: TopBarConstants.MovyLogo.leftMargin
            ),
            movyLogoView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

private struct TopBarConstants {
    struct LoginButton {
        static let height: CGFloat = 26
        static let width: CGFloat = 88
        static let rightMargin: CGFloat = -24
    }

    struct MovyLogo {
        static let height: CGFloat = 50
        static let width: CGFloat = 80
        static let leftMargin: CGFloat = 24
    }
}
