//
//  SubscriptionsDataSourceImp.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 29/9/22.
//

import Foundation

class SubscriptionsDataSourceImp {
    private let dao: SubscriptionDAO
    
    init(dao: SubscriptionDAO = SubscriptionDAOImp()) {
        self.dao = dao
    }
}

extension SubscriptionsDataSourceImp: SubscriptionsDataSource {
    func save(subscription: Subscription, notificationIdentifier: String?) throws {
        let entity = SubscriptionEntityMapper.transform(subscription: subscription)
        try dao.save(entity: entity)
    }
    
    func getAll() -> [Subscription] {
        let subscripionEntities = dao.getAll()
        let subscriptions = subscripionEntities.compactMap(SubscriptionEntityMapper.transform)
        
        return subscriptions
    }
    
    func remove(subscription: Subscription) throws {
        let entity = SubscriptionEntityMapper.transform(subscription: subscription)
        try dao.remove(entity: entity)
    }
}
