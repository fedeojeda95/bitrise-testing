//
//  SearchViewController.swift
//  Movy-ios
//
//  Created by Fernando de la Fuente on 6/6/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SearchViewController: UIViewController {

    let disposeBag = DisposeBag()

    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let searchBar: SearchBar = {
        let bar = SearchBar()
        bar.translatesAutoresizingMaskIntoConstraints = false
        return bar
    }()

    private let popularSearchLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = UIColor.movyWhite
        textLabel.font = UIFont.movyBodyTitle
        textLabel.text = Constants.Search.popularSearch
        textLabel.sizeToFit()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()

    private let searchResults: SearchResultTable = {
        let table = SearchResultTable()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    private var currentPage = 0
    private var currentTotalPages = 0
    private var currentText = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
        setupSearchBarObservable()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    private func setupView() {
        view.accessibilityIdentifier = AccessibilityConstants.Search.searchView
        view.addSubview(containerView)

        containerView.addSubview(searchBar)
        containerView.addSubview(popularSearchLabel)
        containerView.addSubview(searchResults)

        searchResults.searchResultTableDelegate = self
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),

            searchBar.topAnchor.constraint(equalTo: containerView.topAnchor),
            searchBar.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: SearchViewConstants.SearchBar.height),

            popularSearchLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: SearchViewConstants.PopularSearches.leftMargin
            ),
            popularSearchLabel.topAnchor.constraint(
                equalTo: searchBar.bottomAnchor,
                constant: SearchViewConstants.PopularSearches.topMargin
            ),

            searchResults.topAnchor.constraint(
                equalTo: popularSearchLabel.bottomAnchor,
                constant: SearchViewConstants.SearchResults.topMargin
            ),
            searchResults.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            searchResults.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            searchResults.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }

    private func setupSearchBarObservable() {
        searchBar.searchTextObservable?.subscribe(onNext: { [weak self] text in
            guard let self = self else { return }

            if self.currentText != text {
                self.searchResults.movies.removeAll()
            }
            self.currentText = text

            self.performSearch(text: text)
        }).disposed(by: disposeBag)
    }

    private func performSearch(text: String, page: Int = 1) {
        let results = API.searchMovies(query: text, page: page)
        results.subscribe(
            onNext: { [weak self] searchResult in
                guard let self = self else { return }
                self.searchResults.movies += searchResult.movies
                self.currentTotalPages = searchResult.totalPages
            },
            onError: { [weak self] error in
                guard let self = self else { return }
                self.showError(
                    title: Constants.Errors.apiCallErrorTitle,
                    description: "\(Constants.Errors.apiSearchErrorDescription)\(error.localizedDescription)"
                )
            }
            ).disposed(by: disposeBag)
        currentPage = page
    }
}

extension SearchViewController: SearchResultTableDelegate {
    func didScrollReachEnd() {
        guard (currentPage + 1) <= currentTotalPages else {
            searchResults.fetchingMore = false
            return
        }
        currentPage += 1
        performSearch(text: currentText, page: currentPage)
    }
}

private struct SearchViewConstants {
    struct SearchBar {
        static let height: CGFloat = 61
    }

    struct PopularSearches {
        static let leftMargin: CGFloat = 16
        static let topMargin: CGFloat = 24
    }

    struct SearchResults {
        static let topMargin: CGFloat = 38
    }
}
