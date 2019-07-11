//
//  ProfileCell.swift
//  Movy-ios
//
//  Created by Fernando de la Fuente on 6/18/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {
    static let identifier = "ProfileCellIdentifier"

    var cellText: String? {
        didSet {
            label.text = cellText
        }
    }

    private let label: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.movyWhite
        label.font = UIFont.movyBodyText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let arrow: UIImageView = {
        let view = UIImageView(image: #imageLiteral(resourceName: "right_arrow_icon"))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        setupLayout()
    }

    private func setupView() {
        backgroundColor = .black
        selectionStyle = .none

        addSubview(label)
        addSubview(arrow)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ProfileCellConstants.leftMargin),

            arrow.heightAnchor.constraint(equalToConstant: ProfileCellConstants.Arrow.height),
            arrow.widthAnchor.constraint(equalToConstant: ProfileCellConstants.Arrow.width),
            arrow.centerYAnchor.constraint(equalTo: centerYAnchor),
            arrow.trailingAnchor.constraint(equalTo: trailingAnchor, constant: ProfileCellConstants.rightMargin)
        ])
    }
}

private struct ProfileCellConstants {
    static let leftMargin: CGFloat = 28
    static let rightMargin: CGFloat = -25.2

    struct Arrow {
        static let height: CGFloat = 18.8
        static let width: CGFloat = 10.7
    }
}
