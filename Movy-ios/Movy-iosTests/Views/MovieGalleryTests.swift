//
//  MovieGalleryTests.swift
//  Movy-iosTests
//
//  Created by Fernando de la Fuente on 6/24/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import XCTest
import Realm
import RealmSwift
@testable import Movy_ios

class MovieGalleryTests: XCTestCase {

    var rootWindow: UIWindow!
    var viewController: UIViewController!
    var movieGallery: MovieGallery!

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
        movieGallery = MovieGallery()
        viewController.view.addSubview(movieGallery)
        movies = [movie, otherMovie]
        movieGallery.setDataSource(data: movies)
    }

    func testCorrectNumberOfItems() {
        guard let uiCollectionView = movieGallery.subviews[0] as? UICollectionView else {
            XCTFail("UITableView not found in view")
            return
        }

        let items = uiCollectionView.numberOfItems(inSection: 0)
        XCTAssertTrue(items == movies.count)
    }

    func testRemoveExistingMovieFromCollection() {
        guard let uiCollectionView = movieGallery.subviews[0] as? UICollectionView else {
            XCTFail("UICollectionView not found in view")
            return
        }

        var items = uiCollectionView.numberOfItems(inSection: 0)
        XCTAssertTrue(items == movies.count)

        movieGallery.addOrRemoveMovieFromCollection(movie: movie)
        items = uiCollectionView.numberOfItems(inSection: 0)
        XCTAssertTrue(items == (movies.count - 1))
    }

    func testAddMovieToCollection() {
        guard let uiCollectionView = movieGallery.subviews[0] as? UICollectionView else {
            XCTFail("UICollectionView not found in view")
            return
        }

        var items = uiCollectionView.numberOfItems(inSection: 0)
        XCTAssertTrue(items == movies.count)

        let thirdMovie = Movie(
            id: 3, voteCount: 1, video: false, voteAverage: 1, title: "ThirdMovie", popularity: 1,
            posterPath: nil, originalLanguage: "US", originalTitle: "ThirdMovie", genreIds: List<Int>(),
            backdropPath: nil, adult: false, overview: "Test 3", releaseDate: "09/09/19"
        )

        movieGallery.addOrRemoveMovieFromCollection(movie: thirdMovie)
        items = uiCollectionView.numberOfItems(inSection: 0)
        XCTAssertTrue(items == (movies.count + 1))
    }
}
