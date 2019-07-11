//
//  MovyLogo.swift
//  Movy-ios
//
//  Created by Fernando de la Fuente on 6/5/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import UIKit

class MovyLogo: UIView {
    private let movyLogo: UILabel = {
        let movyLogo = UILabel()
        movyLogo.text = Constants.movyLogoTitle
        movyLogo.font = UIFont.movyLogoTopBar
        movyLogo.sizeToFit()
        movyLogo.textColor = UIColor.movyWhite
        movyLogo.translatesAutoresizingMaskIntoConstraints = false
        return movyLogo
    }()

    private let circle: UIView = {
        let circle = UIView()
        circle.backgroundColor = UIColor.movyMainSkyBlue
        circle.translatesAutoresizingMaskIntoConstraints = false
        return circle
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
        addSubview(movyLogo)
        addSubview(circle)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            movyLogo.centerYAnchor.constraint(equalTo: centerYAnchor),
            movyLogo.centerXAnchor.constraint(equalTo: centerXAnchor),

            circle.heightAnchor.constraint(equalToConstant: MovieLogoConstants.Circle.height),
            circle.widthAnchor.constraint(equalToConstant: MovieLogoConstants.Circle.height),
            circle.topAnchor.constraint(equalTo: topAnchor, constant: MovieLogoConstants.Circle.topMargin),
            circle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: MovieLogoConstants.Circle.rightMargin)
        ])
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        circle.layer.cornerRadius = circle.frame.size.width / 2
        circle.clipsToBounds = true
    }
}

private struct MovieLogoConstants {
    struct Circle {
        static let height: CGFloat = 9
        static let topMargin: CGFloat = 4
        static let rightMargin: CGFloat = -8
    }
}
