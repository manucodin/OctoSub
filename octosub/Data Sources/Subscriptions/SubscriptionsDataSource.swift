//
//  SubscriptionsDataSource.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 29/9/22.
//

import Foundation

protocol SubscriptionsDataSource {
    func save(subscription: Subscription, notificationIdentifier: String?) throws
    func getAll() -> [Subscription]
    func remove(subscription: Subscription) throws
}
