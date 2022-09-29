//
//  SubscriptionDAOImp.swift
//  subscription_tracker
//
//  Created by Manuel Rodriguez Sebastian on 10/9/22.
//

import Foundation

class SubscriptionDAOImp {
    private let dao: GenericDAO
    
    init(dao: GenericDAO = GenericDAOImp()) {
        self.dao = dao
    }
}

extension SubscriptionDAOImp: SubscriptionDAO {
    func save(entity: SubscriptionEntity) throws {
        try dao.save(object: entity)
    }
    
    func get(identifier: String) -> SubscriptionEntity? {
        return dao.get(identifier: identifier)
    }
    
    func getAll() -> [SubscriptionEntity] {
        return dao.getAll(type: SubscriptionEntity.self)
    }
    
    func remove(entity: SubscriptionEntity) throws {
        try dao.delete(object: entity)
    }
}
