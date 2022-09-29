//
//  SubscriptionDAO.swift
//  subscription_tracker
//
//  Created by Manuel Rodriguez Sebastian on 10/9/22.
//

import Foundation

protocol SubscriptionDAO {
    func save(entity: SubscriptionEntity) throws
    func getAll() -> [SubscriptionEntity]
    func remove(entity: SubscriptionEntity) throws
}
