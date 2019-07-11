//
//  CodableResponses.swift
//  Movy-ios
//
//  Created by Fernando de la Fuente on 6/3/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import RxCocoa

class API {
    static let provider = MoyaProvider<TheMovieDbAPI>()//(plugins: [NetworkLoggerPlugin(verbose: true)])

    static func discoverMovies(page: Int) -> Observable<[Movie]> {
       return provider
            .rx
            .request(.discover(page: page))
            .map { response in
                let results = try JSONDecoder().decode(APIResponse.self, from: response.data)
                return results.movies
            }
            .asObservable()
    }

    static func recentlyAddedMovies(page: Int) -> Observable<[Movie]> {
        return provider
            .rx
            .request(.recentlyAdded(page: page))
            .map { response in
                let results = try JSONDecoder().decode(APIResponse.self, from: response.data)
                return results.movies
            }
            .asObservable()
    }

    static func searchMovies(query: String, page: Int) -> Observable<SearchMovieResponse> {
        return provider
            .rx
            .request(.search(query: query, page: page))
            .map { response in
                let results = try JSONDecoder().decode(APIResponse.self, from: response.data)
                return SearchMovieResponse(movies: results.movies, totalPages: results.totalPages)
            }
            .asObservable()
    }
}

struct SearchMovieResponse {
    var movies: [Movie]
    var totalPages: Int
}
