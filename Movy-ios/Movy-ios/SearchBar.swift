//
//  SearchBar.swift
//  Movy-ios
//
//  Created by Fernando de la Fuente on 6/12/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class SearchBar: UIView {
    private let searchIcon = UIImageView(image: #imageLiteral(resourceName: "unsel_search_icon"))
    private let microphoneIcon = UIImageView(image: #imageLiteral(resourceName: "microphone-of-voice"))

    private let searchInput: UITextField = {
        let input = UITextField()
        input.font = UIFont.movyBodyText
        input.textColor = UIColor.movyWhite
        input.translatesAutoresizingMaskIntoConstraints = false
        return input
    }()

    var searchTextObservable: Observable<String>?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupLayout()
        setupSearchTextObservable()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        setupLayout()
        setupSearchTextObservable()
    }

    private func setupSearchTextObservable() {
        searchTextObservable = searchInput
            .rx
            .text
            .orEmpty
            .debounce(0.5, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .filter { !$0.isEmpty }
            .asObservable()
    }

    private func setupView() {
        backgroundColor = UIColor.movyBlack

        searchIcon.translatesAutoresizingMaskIntoConstraints = false
        microphoneIcon.translatesAutoresizingMaskIntoConstraints = false

        addSubview(searchIcon)
        addSubview(searchInput)
        addSubview(microphoneIcon)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            searchIcon.widthAnchor.constraint(equalToConstant: SearchBarConstants.iconSize),
            searchIcon.heightAnchor.constraint(equalTo: searchIcon.widthAnchor),
            searchIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            searchIcon.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: SearchBarConstants.SearchIcon.leftMargin
            ),

            searchInput.centerYAnchor.constraint(equalTo: centerYAnchor),
            searchInput.widthAnchor.constraint(
                equalTo: widthAnchor,
                multiplier: SearchBarConstants.SearchInput.widthPercentage
            ),
            searchInput.heightAnchor.constraint(equalTo: heightAnchor),
            searchInput.leadingAnchor.constraint(
                equalTo: searchIcon.trailingAnchor,
                constant: SearchBarConstants.SearchInput.leftMargin
            ),

            microphoneIcon.widthAnchor.constraint(equalToConstant: SearchBarConstants.iconSize),
            microphoneIcon.heightAnchor.constraint(equalTo: microphoneIcon.widthAnchor),
            microphoneIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            microphoneIcon.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: SearchBarConstants.MicrophoneIcon.rightMargin
            )
        ])
    }
}

private struct SearchBarConstants {
    static let iconSize: CGFloat = 18.9

    struct SearchIcon {
        static let leftMargin: CGFloat = 25.2
    }

    struct SearchInput {
        static let widthPercentage: CGFloat = 0.70
        static let leftMargin: CGFloat = 26.8
    }

    struct MicrophoneIcon {
        static let rightMargin: CGFloat = -28.1
    }
}
