//
//  HomeMovieCollectionViewCell.swift
//  Movy-ios
//
//  Created by Fernando de la Fuente on 6/7/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import UIKit
import Kingfisher

class HomeMovieCollectionViewCell: UICollectionViewCell {
    static var identifier: String = "HomeMovieCollectionViewCell"

    var imageURL: String? {
        didSet {
            guard let imageURL = imageURL else { return }
            let url = URL(string: "\(Constants.Network.imageBaseURL)\(imageURL)")
            imageView.kf.setImage(with: url, options: [.transition(.fade(0.2))])
            setNeedsLayout()
            setNeedsDisplay()
        }
    }

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        reset()
    }

    private func reset() {
        imageURL = nil
    }
}
