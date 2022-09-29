//
//  GenericDAO.swift
//  subscription_tracker
//
//  Created by Manuel Rodriguez Sebastian on 10/9/22.
//

import Foundation
import RealmSwift

protocol GenericDAO {
    func save(object: Object) throws
    func save(objects: [Object]) throws
    func getAll<T: RealmFetchable>(type: T.Type) -> Array<T>
    func delete<T: Object>(object: T) throws
}
