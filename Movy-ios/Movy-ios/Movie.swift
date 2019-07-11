// swiftlint:disable identifier_name
//
//  Movie.swift
//  Movy-ios
//
//  Created by Fernando de la Fuente on 6/3/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

@objcMembers
class Movie: Object, Decodable {
    dynamic var id: Int = 0
    dynamic var voteCount: Int = 0
    dynamic var video: Bool = false
    dynamic var voteAverage: Double = 0
    dynamic var title: String = ""
    dynamic var popularity: Double = 0
    dynamic var posterPath: String?
    dynamic var originalLanguage: String = ""
    dynamic var originalTitle: String = ""
    var genreIds = List<Int>()
    dynamic var backdropPath: String?
    dynamic var adult: Bool = false
    dynamic var overview: String = ""
    dynamic var releaseDate: String = ""

    public override static func primaryKey() -> String? { return "id" }

    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.id == rhs.id
    }

    private enum CodingKeys: String, CodingKey {
        case id,
        voteCount = "vote_count",
        video,
        voteAverage = "vote_average",
        title,
        popularity,
        posterPath = "poster_path",
        originalLanguage = "original_language",
        originalTitle = "original_title",
        genreIds = "genre_ids",
        backdropPath = "backdrop_path",
        adult,
        overview,
        releaseDate = "release_date"
    }

    convenience init(
        id: Int,
        voteCount: Int,
        video: Bool,
        voteAverage: Double,
        title: String,
        popularity: Double,
        posterPath: String?,
        originalLanguage: String,
        originalTitle: String,
        genreIds: List<Int>,
        backdropPath: String?,
        adult: Bool,
        overview: String,
        releaseDate: String
    ) {
        self.init()
        self.id = id
        self.voteCount = voteCount
        self.video = video
        self.voteAverage = voteAverage
        self.title = title
        self.popularity = popularity
        self.posterPath = posterPath
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.genreIds = genreIds
        self.backdropPath = backdropPath
        self.adult = adult
        self.overview = overview
        self.releaseDate = releaseDate
    }

    convenience required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id = try container.decode(Int.self, forKey: .id)
        let voteCount = try container.decode(Int.self, forKey: .voteCount)
        let video = try container.decode(Bool.self, forKey: .video)
        let voteAverage = try container.decode(Double.self, forKey: .voteAverage)
        let title = try container.decode(String.self, forKey: .title)
        let popularity = try container.decode(Double.self, forKey: .popularity)
        let posterPath = try container.decode(String?.self, forKey: .posterPath)
        let originalLanguage = try container.decode(String.self, forKey: .originalLanguage)
        let originalTitle = try container.decode(String.self, forKey: .originalTitle)

        let genreArray = try container.decode([Int].self, forKey: .genreIds)
        let genreIds = List<Int>()
        genreIds.append(objectsIn: genreArray)
        let backdropPath = try container.decode(String?.self, forKey: .backdropPath)
        let adult = try container.decode(Bool.self, forKey: .adult)
        let overview = try container.decode(String.self, forKey: .overview)
        let releaseDate = try container.decode(String.self, forKey: .releaseDate)

        self.init(
            id: id,
            voteCount:
            voteCount,
            video: video,
            voteAverage:
            voteAverage,
            title: title,
            popularity: popularity,
            posterPath: posterPath,
            originalLanguage: originalLanguage,
            originalTitle: originalTitle,
            genreIds: genreIds,
            backdropPath: backdropPath,
            adult: adult,
            overview: overview,
            releaseDate: releaseDate
        )
    }

    required init() {
        super.init()
    }

    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }

    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
}
