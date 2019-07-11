//
//  MoovyCategoriesStack.swift
//  Movy-ios
//
//  Created by Fernando de la Fuente on 6/7/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import UIKit

private struct MoovieGenresStackConstants {
    static let stackSpacing: CGFloat = 18
}

class MoovieGenresStack: UIStackView {

    private var separatorViews: [UIView] = []

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStack()
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupStack()
    }

    required init(items: [String]) {
        super.init(frame: .zero)
        setupStack()
        setGenres(items: items)
    }

    private func setupStack() {
        axis = .horizontal
        distribution = .equalSpacing
        spacing = MoovieGenresStackConstants.stackSpacing
        alignment = .center
    }

    func setGenres(items: [String]) {
        cleanStack()
        let genres = items.prefix(3)
        genres.enumerated().forEach { (index, genre)  in
            let item = createStyledLabel(genre)
            addArrangedSubview(item)

            if index != (genres.count - 1) {
                let separator = createSeparatorView()
                addArrangedSubview(separator)
                separatorViews.append(separator)
                createSeparatorConstraints(separator)
            }
        }
    }

    private func createStyledLabel(_ text: String) -> UILabel {
        let label = UILabel()
        label.font = UIFont.movyBodyText
        label.textColor = UIColor.movyWhite
        label.sizeToFit()
        label.text = text
        return label
    }

    private func cleanStack() {
        subviews.forEach({ $0.removeFromSuperview() })
        separatorViews.removeAll()
    }

    private func createSeparatorView() -> UIView {
        let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = UIColor.movyWhite
        return separator
    }

    private func createSeparatorConstraints(_ separator: UIView) {
        let separatorHeight = separator.heightAnchor.constraint(equalToConstant: 7)
        separatorHeight.priority = UILayoutPriority(rawValue: 500)

        NSLayoutConstraint.activate([
            separatorHeight,
            separator.widthAnchor.constraint(equalTo: separator.heightAnchor),
            separator.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])

        separator.layer.cornerRadius = separator.frame.size.width / 2
        separator.clipsToBounds = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        separatorViews.forEach { view in
            view.layer.cornerRadius = view.frame.size.width / 2
            view.clipsToBounds = true
        }
    }
}
