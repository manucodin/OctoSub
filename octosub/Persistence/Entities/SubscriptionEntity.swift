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
    @Persisted var creationTimestamp: Int
    @Persisted var durationValue: Int?
    @Persisted var durationType: String?
    @Persisted var endTimestamp: Int?
    @Persisted var paymentFrequencyValue: Int?
    @Persisted var paymentFrequencyType: String?
    @Persisted var lastPaymentTimestamp: Int?
    @Persisted var nextPaymentTimestamp: Int?
    @Persisted var userRecordatoryValue: Int?
    @Persisted var userRecordatoryType: String?
    @Persisted var userRecordatoryTimestamp: Int?
    @Persisted var notificationIdentifier: String?
    @Persisted var countdown: Int?
    
    convenience init(
        subscriptionService: SubscriptionServiceEntity?,
        name: String?,
        userDescription: String?,
        price: Double,
        creationTimestamp: Int,
        durationValue: Int?,
        durationType: String?,
        durationTimestamp: Int?,
        paymentFrequencyValue: Int?,
        paymentFrequencyType: String?,
        lastPaymentTimestamp: Int?,
        nextPaymentTimestamp: Int?,
        userRecordatoryValue: Int?,
        userRecordatoryType: String?,
        userRecordatoryTimestamp: Int?,
        notificationIdentifier: String?,
        countdown: Int?) {
            self.init()
            self.subscriptionService = subscriptionService
            self.name = name
            self.userDescription = userDescription
            self.price = price
            self.creationTimestamp = creationTimestamp
            self.durationValue = durationValue
            self.durationType = durationType
            self.endTimestamp = durationTimestamp
            self.paymentFrequencyValue = paymentFrequencyValue
            self.paymentFrequencyType = paymentFrequencyType
            self.lastPaymentTimestamp = lastPaymentTimestamp
            self.nextPaymentTimestamp = nextPaymentTimestamp
            self.userRecordatoryValue = userRecordatoryValue
            self.userRecordatoryType = userRecordatoryType
            self.userRecordatoryTimestamp = userRecordatoryTimestamp
            self.notificationIdentifier = notificationIdentifier
            self.countdown = countdown
    }
}
