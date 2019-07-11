// swiftlint:disable identifier_name
//
//  Genre.swift
//  Movy-ios
//
//  Created by Fernando de la Fuente on 6/17/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

@objcMembers
class Genre: Object, Decodable {
    dynamic var id: Int = 0
    dynamic var name: String = ""

    public override static func primaryKey() -> String? { return "id" }

    convenience init(id: Int, name: String) {
        self.init()
        self.id = id
        self.name = name
    }

    convenience required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Genre.CodingKeys.self)
        let id = try container.decode(Int.self, forKey: .id)
        let name = try container.decode(String.self, forKey: .name)
        self.init(id: id, name: name)
    }

    static func == (lhs: Genre, rhs: Genre) -> Bool {
        return lhs.id == rhs.id
    }

    private enum CodingKeys: String, CodingKey {
        case id, name
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
