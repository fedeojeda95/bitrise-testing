//
//  SearchResultTable.swift
//  Movy-ios
//
//  Created by Fernando de la Fuente on 6/12/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import UIKit

class SearchResultTable: UIView {
    var movies: [Movie] = [] {
        didSet {
            resultTable.reloadData()
            fetchingMore = false
        }
    }

    var fetchingMore = false

    private var resultTable: UITableView!

    weak var searchResultTableDelegate: SearchResultTableDelegate?

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
        setupTableView()
        addSubview(resultTable)
    }

    private func setupTableView() {
        resultTable = UITableView()
        resultTable.delegate = self
        resultTable.dataSource = self
        resultTable.register(SearchResultTableCell.self, forCellReuseIdentifier: SearchResultTableCell.identifier)
        resultTable.backgroundColor = .black
        resultTable.translatesAutoresizingMaskIntoConstraints = false
        resultTable.separatorColor = .clear
        resultTable.contentSize.width = 0
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            resultTable.leadingAnchor.constraint(equalTo: leadingAnchor),
            resultTable.trailingAnchor.constraint(equalTo: trailingAnchor),
            resultTable.topAnchor.constraint(equalTo: topAnchor),
            resultTable.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension SearchResultTable: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if movies.count == 0 {
            tableView.setEmptyMessage(Constants.Search.emptyResults)
        } else {
            tableView.restore()
        }

        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultTableCell.identifier, for: indexPath)
        guard let searchResultCell = cell as? SearchResultTableCell else { return cell }
        searchResultCell.movie = movies[indexPath.item]
        return searchResultCell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SearchResultTableConstants.rowHeight
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height

        guard
            offsetY > contentHeight - scrollView.frame.height,
            !fetchingMore
        else { return }

        beginFetch()
    }

    func beginFetch() {
        fetchingMore = true
        searchResultTableDelegate?.didScrollReachEnd()
    }
}

private struct SearchResultTableConstants {
    static let rowHeight: CGFloat = 100
}
