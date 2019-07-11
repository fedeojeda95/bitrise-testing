//
//  TheMovieDb.swift
//  Movy-ios
//
//  Created by Fernando de la Fuente on 6/3/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import Foundation
import Moya

public enum TheMovieDbAPI {
    case discover(page: Int)
    case recentlyAdded(page: Int)
    case search(query: String, page: Int)
}

extension TheMovieDbAPI: TargetType {
    public var baseURL: URL {
        return URL(string: Constants.Network.baseURL)!
    }

    public var path: String {
        switch self {
        case .discover, .recentlyAdded:
            return "/discover/movie"
        case .search:
            return "/search/movie"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .discover, .recentlyAdded, .search:
            return .get
        }
    }

    public var sampleData: Data {
        return Data()
    }

    public var task: Task {
        let authParam = ["api_key": Constants.Network.apiKey]

        switch self {
        case .discover(let page):
            return .requestParameters(
                parameters: authParam + [
                    "language": "en-US",
                    "sort_by": "popularity.desc",
                    "page": page
                ],
                encoding: URLEncoding.default)
        case.recentlyAdded(let page):
            return .requestParameters(
                parameters: authParam + [
                    "language": "en-US",
                    "sort_by": "release_date.desc",
                    "page": page
                ],
                encoding: URLEncoding.default)
        case.search(let query, let page):
            return .requestParameters(
                parameters: authParam + [
                    "language": "en-US",
                    "query": query,
                    "page": page
                ],
                encoding: URLEncoding.default)
        }
    }

    public var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }

    public var validationType: ValidationType {
        return .successCodes
    }
}
