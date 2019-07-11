//
//  MyList.swift
//  Movy-ios
//
//  Created by Fernando de la Fuente on 6/17/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

@objcMembers
class MyList: Object {
    dynamic var userId: Int = 0
    var movies = List<Movie>()

    public override static func primaryKey() -> String? { return "userId" }
}
