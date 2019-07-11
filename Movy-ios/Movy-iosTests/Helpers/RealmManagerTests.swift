//
//  RealmManagerTests.swift
//  Movy-iosTests
//
//  Created by Fernando de la Fuente on 6/21/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import XCTest
import Realm
import RealmSwift
@testable import Movy_ios

class RealmManagerTests: XCTestCase {

    let movie = Movie(id: 1, voteCount: 1, video: false, voteAverage: 1, title: "TestMovie", popularity: 1,
                      posterPath: nil, originalLanguage: "US", originalTitle: "TestMovie", genreIds: List<Int>(),
                      backdropPath: nil, adult: false, overview: "Test", releaseDate: "11/11/19")

    let otherMovie = Movie(id: 2, voteCount: 1, video: false, voteAverage: 1, title: "OtherMovie", popularity: 1,
                      posterPath: nil, originalLanguage: "US", originalTitle: "OtherMovie", genreIds: List<Int>(),
                      backdropPath: nil, adult: false, overview: "Test 2", releaseDate: "10/10/19")

    override func setUp() {
        guard
            let realm = try? Realm()
            else { return }

        realm.refresh()

        try? realm.write {
            realm.deleteAll()
            realm.add(movie, update: .all)
            realm.add(otherMovie, update: .all)
        }
    }

    func testGetObjects() {
        guard let results = RealmManager().objects(Movie.self) else {
            XCTFail("Obtained nil results. Expected exactly 2")
            return
        }

        XCTAssertTrue(results.count == 2, "Obtained count of results should be exactly 2")
        XCTAssertTrue(results.contains(movie), "Results should contain movie with id \(movie.id)")
        XCTAssertTrue(results.contains(otherMovie), "Results should contain movie with id \(otherMovie.id)")
    }

    func testGetObjectsUsingPredicate() {
        let predicate = NSPredicate(format: "id == \(movie.id)")
        guard let results = RealmManager().objects(Movie.self, predicate: predicate) else {
            XCTFail("Obtained nil results. Expected exactly 2")
            return
        }

        XCTAssertTrue(results.count == 1, "Obtained count of results should exactly 1")
        XCTAssertTrue(results.contains(movie), "Results should contain movie with id \(movie.id)")
    }

    func testGetObjectsWithNoResults() {
        let unusedId = 99
        let predicate = NSPredicate(format: "id == \(unusedId)")
        guard let results = RealmManager().objects(Movie.self, predicate: predicate) else {
            XCTFail("Obtained nil results. Expected empty list")
            return
        }

        XCTAssertTrue(results.isEmpty, "Obtained results should be empty")
    }

    func testAddCollectionOfObject() {
        let thirdMovie = Movie(id: 3, voteCount: 1, video: false, voteAverage: 1, title: "ThirdMovie", popularity: 1,
                               posterPath: nil, originalLanguage: "US", originalTitle: "ThirdMovie",
                               genreIds: List<Int>(), backdropPath: nil, adult: false, overview: "Test 3",
                               releaseDate: "09/09/19"
        )

        let fourthMovie = Movie(id: 4, voteCount: 1, video: false, voteAverage: 1, title: "FourthMovie", popularity: 1,
                               posterPath: nil, originalLanguage: "US", originalTitle: "FourthMovie",
                               genreIds: List<Int>(), backdropPath: nil, adult: false, overview: "Test 4",
                               releaseDate: "08/08/19"
        )

        let data = [thirdMovie, fourthMovie]
        RealmManager().add(data)

        guard let newResults = RealmManager().objects(Movie.self) else {
            XCTFail("Obtained nil results. Expected results")
            return
        }

        XCTAssertTrue(newResults.count == 4, "Obtained results count should be exactly 4")
        XCTAssertTrue(newResults.contains(movie), "Obtained results should contain movie with id \(movie.id)")
        XCTAssertTrue(newResults.contains(otherMovie), "Obtained results should contain movie with id \(otherMovie.id)")
        XCTAssertTrue(newResults.contains(thirdMovie), "Obtained results should contain movie with id \(thirdMovie.id)")
        XCTAssertTrue(
            newResults.contains(fourthMovie),
            "Obtained results should contain movie with id \(fourthMovie.id)"
        )
    }

    func testAddSingleObject() {
        let thirdMovie = Movie(id: 3, voteCount: 1, video: false, voteAverage: 1, title: "ThirdMovie", popularity: 1,
                               posterPath: nil, originalLanguage: "US", originalTitle: "ThirdMovie",
                               genreIds: List<Int>(), backdropPath: nil, adult: false, overview: "Test 3",
                               releaseDate: "09/09/19"
        )

        RealmManager().add(thirdMovie)

        guard let newResults = RealmManager().objects(Movie.self) else {
            XCTFail("Obtained nil results. Expected results")
            return
        }

        XCTAssertTrue(newResults.count == 3, "Obtained results count should be exactly 3")
        XCTAssertTrue(newResults.contains(movie), "Obtained results should contain movie with id \(movie.id)")
        XCTAssertTrue(newResults.contains(otherMovie), "Obtained results should contain movie with id \(otherMovie.id)")
        XCTAssertTrue(newResults.contains(thirdMovie), "Obtained results should contain movie with id \(thirdMovie.id)")
    }

    func testDeleteCollectionOfObjects() {
        guard let results = RealmManager().objects(Movie.self) else {
            XCTFail("Obtained nil results. Expected exactly 2")
            return
        }

        XCTAssertTrue(results.count == 2, "Obtained count of results should be exactly 2")

        let data = [movie, otherMovie]
        RealmManager().delete(data)

        guard let newResults = RealmManager().objects(Movie.self) else {
            XCTFail("Obtained nil results. Expected empty results")
            return
        }

        XCTAssertTrue(newResults.isEmpty, "Results should be empty")
    }

    func testDeleteSingleObject() {
        guard let results = RealmManager().objects(Movie.self) else {
            XCTFail("Obtained nil results. Expected exactly 2")
            return
        }

        XCTAssertTrue(results.count == 2, "Obtained count of results should be exactly 2")

        RealmManager().delete(movie)

        guard let newResults = RealmManager().objects(Movie.self) else {
            XCTFail("Obtained nil results. Expected results")
            return
        }

        XCTAssertTrue(newResults.count == 1, "Results count should be exactly 1")
        XCTAssertTrue(newResults.contains(otherMovie), "Results should contain movie with id \(otherMovie.id)")
        XCTAssertFalse(newResults.contains(movie), "Results should not contain movie with id \(movie.id)")
    }

    func testClearData() {
        guard let results = RealmManager().objects(Movie.self) else {
            XCTFail("Obtained nil results. Expected exactly 2")
            return
        }

        XCTAssertTrue(results.count == 2, "Obtained count of results should be exactly 2")
        RealmManager().clearAllData()

        guard let newResults = RealmManager().objects(Movie.self) else {
            XCTFail("Obtained nil results. Expected empty list")
            return
        }

        XCTAssertTrue(newResults.isEmpty, "Obtained count of results should be empty")
    }
}
