//
//  GenericDAOImp.swift
//  subscription_tracker
//
//  Created by Manuel Rodriguez Sebastian on 10/9/22.
//

import Foundation
import RealmSwift

class GenericDAOImp {
    private let realm: Realm
    
    init() {
        let realmConfiguration = Realm.Configuration(schemaVersion: 1, migrationBlock: { _, _ in })
        self.realm = try! Realm(configuration: realmConfiguration)
    }
}

extension GenericDAOImp: GenericDAO {
    func save(object: Object) throws {
        try realm.write{
            realm.add(object, update: .all)
        }
    }
    
    func save(objects: [Object]) throws {
        try realm.write {
            realm.add(objects, update: .all)
        }
    }
    
    func get<T: Object>(identifier: String) -> T? {
        let id = try? ObjectId(string: identifier)
        return realm.object(ofType: T.self, forPrimaryKey: id)
    }
                      
    func getAll<T: RealmFetchable>(type: T.Type) -> Array<T>{
        return Array(realm.objects(type.self))
    }
    
    func delete<T: Object>(object: T) throws {        
        try realm.write {
            realm.delete(object)
        }
    }
}
