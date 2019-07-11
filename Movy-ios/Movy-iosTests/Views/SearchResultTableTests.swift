//
//  SearchResultTableTests.swift
//  Movy-iosTests
//
//  Created by Fernando de la Fuente on 6/24/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import XCTest
import Realm
import RealmSwift
@testable import Movy_ios

class SearchResultTableTests: XCTestCase {
    var rootWindow: UIWindow!
    var viewController: UIViewController!
    var resultSearchTable: SearchResultTable!

    let movie = Movie(id: 1, voteCount: 1, video: false, voteAverage: 1, title: "TestMovie", popularity: 1,
                      posterPath: nil, originalLanguage: "US", originalTitle: "TestMovie", genreIds: List<Int>(),
                      backdropPath: nil, adult: false, overview: "Test", releaseDate: "11/11/19")

    let otherMovie = Movie(id: 2, voteCount: 1, video: false, voteAverage: 1, title: "OtherMovie", popularity: 1,
                           posterPath: nil, originalLanguage: "US", originalTitle: "OtherMovie", genreIds: List<Int>(),
                           backdropPath: nil, adult: false, overview: "Test 2", releaseDate: "10/10/19")

    var movies: [Movie] = []

    override func setUp() {
        super.setUp()

        viewController = UIViewController()

        rootWindow = UIWindow(frame: UIScreen.main.bounds)
        rootWindow.isHidden = false
        rootWindow.rootViewController = viewController
        resultSearchTable = SearchResultTable()
        viewController.view.addSubview(resultSearchTable)
        movies = [movie, otherMovie]
        resultSearchTable.movies = movies
    }

    func testCorrectNumberOfCells() {
        guard let tableView = resultSearchTable.subviews[0] as? UITableView else {
            XCTFail("UITableView not found in view")
            return
        }

        let rows = tableView.numberOfRows(inSection: 0)
        XCTAssertTrue(rows == movies.count)
    }
}
