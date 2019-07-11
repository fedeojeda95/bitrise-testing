//
//  RealmManager.swift
//  Movy-ios
//
//  Created by Fernando de la Fuente on 6/14/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import Realm
import RealmSwift
import RxRealm

class RealmManager {
    func objects<T: Object>(_ type: T.Type, predicate: NSPredicate? = nil) -> Results<T>? {
        guard
            let realm = try? Realm()
        else { return nil }

        realm.refresh()

        return predicate == nil ? realm.objects(type) : realm.objects(type).filter(predicate!)
    }

    func add<T: Object>(_ data: [T]) {
        guard
            let realm = try? Realm()
            else { return }

        realm.refresh()

        if realm.isInWriteTransaction {
            realm.add(data, update: .all)
        } else {
            try? realm.write {
                realm.add(data, update: .all)
            }
        }
    }

    func add<T: Object>(_ data: T) {
        add([data])
    }

    func delete<T: Object>(_ data: [T]) {
        guard
            let realm = try? Realm()
            else { return }

        realm.refresh()

        try? realm.write { realm.delete(data) }
    }

    func delete<T: Object>(_ data: T) {
        delete([data])
    }

    func clearAllData() {
        guard
            let realm = try? Realm()
            else { return }

        realm.refresh()

        try? realm.write { realm.deleteAll() }
    }
}
