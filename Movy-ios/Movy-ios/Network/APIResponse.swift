//
//  APIResponse.swift
//  Movy-ios
//
//  Created by Fernando de la Fuente on 6/3/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import Foundation

struct APIResponse: Decodable {
    let page: Int
    let totalResults: Int
    let totalPages: Int
    let movies: [Movie]

    private enum CodingKeys: String, CodingKey {
        case page,
        totalResults = "total_results",
        totalPages = "total_pages",
        movies = "results"
    }
}
