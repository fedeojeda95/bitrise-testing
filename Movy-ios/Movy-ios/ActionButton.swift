//
//  ActionButton.swift
//  Movy-ios
//
//  Created by Fernando de la Fuente on 6/7/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import UIKit

class ActionButton: UIView {

    private var iconImage: UIImage?
    private var text: String?

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    lazy var textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = UIColor.movyWhite
        textLabel.font = UIFont.movyBodyText
        textLabel.sizeToFit()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()

    required init(iconImage: UIImage, text: String) {
        super.init(frame: .zero)
        self.iconImage = iconImage
        self.text = text
        setupView()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func setupView() {
        imageView.image = iconImage
        textLabel.text = text

        translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        addSubview(textLabel)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 32),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            textLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 18)
        ])
    }
}
