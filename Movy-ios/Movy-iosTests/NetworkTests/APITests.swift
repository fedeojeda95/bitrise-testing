//
//  Movy_iosTests.swift
//  Movy-iosTests
//
//  Created by Fernando de la Fuente on 6/20/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import XCTest
import Hippolyte
import RxSwift
import RxCocoa
@testable import Movy_ios

class APITests: XCTestCase {

    let disposeBag = DisposeBag()

    override func tearDown() {
        super.tearDown()
        Hippolyte.shared.stop()
    }

    func testDiscoverMovies() {
        let url = "\(Constants.Network.baseURL)/discover/movie"
        let jsonMockFileName = "moviesStub"
        guard
            let stub = StubManager.createStubWithSuccessJsonResponse(
                url: url,
                httpMethod: .GET,
                jsonResponseFileName: jsonMockFileName
            )
            else {
                XCTFail("Couldn't create stub for test")
                return
        }
        Hippolyte.shared.add(stubbedRequest: stub)
        Hippolyte.shared.start()

        let promise = expectation(description: "Status code: 200")
        API.discoverMovies(page: 1)
            .subscribe(
                onNext: { movies in
                    guard movies.count > 0 else {
                        XCTFail("Error, no movies received")
                        return
                    }

                    promise.fulfill()
            }, onError: { _ in
                XCTFail("Error on api response")
            })
            .disposed(by: disposeBag)

        wait(for: [promise], timeout: 5)
    }

    func testInvalidRequestDiscoverMovies() {
        let url = "\(Constants.Network.baseURL)/discover/movie"
        guard
            let stub = StubManager.createStubWithErrorResponse(url: url, httpMethod: .GET, errorCode: 422)
            else {
                XCTFail("Couldn't create stub for test")
                return
        }
        Hippolyte.shared.add(stubbedRequest: stub)
        Hippolyte.shared.start()

        let promise = expectation(description: "Status code: 200")
        API.discoverMovies(page: -1)
            .subscribe(onNext: { _ in
                XCTFail("Expected error not received")
            }, onError: { _ in
                promise.fulfill()
            })
            .disposed(by: disposeBag)

        wait(for: [promise], timeout: 5)
    }

    func testRecentlyAddedMovies() {
        let url = "\(Constants.Network.baseURL)/discover/movie"
        let jsonMockFileName = "moviesStub"
        guard
            let stub = StubManager.createStubWithSuccessJsonResponse(
                url: url,
                httpMethod: .GET,
                jsonResponseFileName: jsonMockFileName
            )
            else {
                XCTFail("Couldn't create stub for test")
                return
        }
        Hippolyte.shared.add(stubbedRequest: stub)
        Hippolyte.shared.start()

        let promise = expectation(description: "Status code: 200")
        API.recentlyAddedMovies(page: 1)
            .subscribe(onNext: { movies in
                guard movies.count > 0 else {
                    XCTFail("Error, no movies received")
                    return
                }

                promise.fulfill()
            }, onError: { _ in
                XCTFail("Error on api response")
            })
            .disposed(by: disposeBag)

        wait(for: [promise], timeout: 5)
    }

    func testSearchMovies() {
        let url = "\(Constants.Network.baseURL)/search/movie"
        let jsonMockFileName = "moviesStub"
        guard
            let stub = StubManager.createStubWithSuccessJsonResponse(
                url: url,
                httpMethod: .GET,
                jsonResponseFileName: jsonMockFileName
            )
        else {
            XCTFail("Couldn't create stub for test")
            return
        }

        Hippolyte.shared.add(stubbedRequest: stub)
        Hippolyte.shared.start()

        let promise = expectation(description: "Status code: 200")
        API.searchMovies(query: "Harry Potter", page: 1)
            .subscribe(
                onNext: { response in
                    guard response.movies.count > 0 else {
                        XCTFail("Error, no movies received")
                        return
                    }

                    promise.fulfill()
            },
                onError: { _ in
                    XCTFail("Error on api response")
            })
            .disposed(by: disposeBag)

        wait(for: [promise], timeout: 5)
    }

    func testInvalidSearchMovies() {
        let url = "\(Constants.Network.baseURL)/search/movie"
        guard
            let stub = StubManager.createStubWithErrorResponse(url: url, httpMethod: .GET, errorCode: 422)
        else {
            XCTFail("Couldn't create stub for test")
            return
        }

        Hippolyte.shared.add(stubbedRequest: stub)
        Hippolyte.shared.start()

        let promise = expectation(description: "Status code: 200")
        API.searchMovies(query: "Harry Potter", page: -1)
            .subscribe(
                onNext: { _ in
                    XCTFail("Expected error not received")
            },
                onError: { _ in
                    promise.fulfill()
            })
            .disposed(by: disposeBag)

        wait(for: [promise], timeout: 5)
    }
}
