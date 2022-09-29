//
//  SubscriptionEntity.swift
//  subscription_tracker
//
//  Created by Manuel Rodriguez Sebastian on 10/9/22.
//

import Foundation
import RealmSwift

class SubscriptionEntity: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var subscriptionService: SubscriptionServiceEntity?
    @Persisted var name: String?
    @Persisted var userDescription: String?
    @Persisted var price: Double
    @Persisted var creationDate: Date
    @Persisted var durationValue: Int?
    @Persisted var durationType: String?
    @Persisted var repetionValue: Int?
    @Persisted var repetionType: String?
    @Persisted var notificationIdentifier: String?
    
    convenience init(subscriptionService: SubscriptionServiceEntity?, name: String?, userDescription: String?, price: Double, date: Date, durationValue: Int?, durationType: String?, repetionValue: Int?, repetionType: String?, notificationIdentifier: String?) {
        self.init()
        self.subscriptionService = subscriptionService
        self.name = name
        self.userDescription = userDescription
        self.price = price
        self.creationDate = date
        self.durationValue = durationValue
        self.durationType = durationType
        self.repetionValue = repetionValue
        self.repetionType = repetionType
        self.notificationIdentifier = notificationIdentifier
    }
}
