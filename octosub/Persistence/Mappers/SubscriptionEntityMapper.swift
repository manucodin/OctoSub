//
//  SubscriptionEntityMapper.swift
//  subscription_tracker
//
//  Created by Manuel Rodriguez Sebastian on 10/9/22.
//

import Foundation

class SubscriptionEntityMapper {
    static func transform(subscription: Subscription) -> SubscriptionEntity {
        let subscriptionServiceEntity = SubscriptionServiceEntityMapper.transform(subscriptionService: subscription.subscriptionService)
        
        return SubscriptionEntity(
            subscriptionService: subscriptionServiceEntity,
            name: subscription.name,
            userDescription: subscription.userDescription,
            price: subscription.price,
            creationTimestamp: subscription.creationDate.timestamp,
            durationValue: subscription.duration?.numberOfDays,
            durationType: subscription.duration?.dateType.rawValue,
            durationTimestamp: subscription.endDate?.timestamp,
            paymentFrequencyValue: subscription.paymentFrequency?.numberOfDays,
            paymentFrequencyType: subscription.paymentFrequency?.dateType.rawValue,
            lastPaymentTimestamp: subscription.lastPaymentDate?.timestamp ?? subscription.creationDate.timestamp,
            nextPaymentTimestamp: subscription.nextPaymentDate?.timestamp,
            userRecordatoryValue: subscription.userRecordatory?.numberOfDays,
            userRecordatoryType: subscription.userRecordatory?.dateType.rawValue,
            userRecordatoryTimestamp: subscription.userRecordatoryDate?.timestamp,
            notificationIdentifier: subscription.notificationIdentifier,
            countdown: subscription.countDown
        )
    }
    
    static func transform(entity: SubscriptionEntity) -> Subscription? {
        guard let subscriptionService = SubscriptionServiceEntityMapper.transform(entity: entity.subscriptionService) else { return nil }
        
        var duration: DateDuration?
        if let durationValue = entity.durationValue, let durationStringType = entity.durationType, let dateType = DateType(rawValue: (durationStringType)) {
            duration = DateDuration(numberOfDays: durationValue, dateType: dateType)
        }
        
        var paymentFrequency: DateDuration?
        if let paymentFrequencyValue = entity.paymentFrequencyValue, let paymentFrequencyStringValue = entity.paymentFrequencyType, let dateType = DateType(rawValue: paymentFrequencyStringValue) {
            paymentFrequency = DateDuration(numberOfDays: paymentFrequencyValue, dateType: dateType)
        }
        
        var userRecodatory: DateDuration?
        if let recordatoryValue = entity.userRecordatoryValue, let recordatoryStringValue = entity.userRecordatoryType, let dateType = DateType(rawValue: (recordatoryStringValue)) {
            userRecodatory = DateDuration(numberOfDays: recordatoryValue, dateType: dateType)
        }
        
        var lastPaymentDate: Date?
        if let lastPaymentTimestamp = entity.lastPaymentTimestamp {
            lastPaymentDate = Date(timeIntervalSince1970: Double(lastPaymentTimestamp))
        }
        
        var nextPaymentDate: Date?
        if let nextPaymentDateTimestamp = entity.nextPaymentTimestamp {
            nextPaymentDate = Date(timeIntervalSince1970: Double(nextPaymentDateTimestamp))
        }
        
        var userRecordatoryDate: Date?
        if let userRecordatoryDateTimestamp = entity.userRecordatoryTimestamp {
            userRecordatoryDate = Date(timeIntervalSince1970: Double(userRecordatoryDateTimestamp))
        }
        return Subscription(
            id: entity.id.stringValue,
            subscriptionService: subscriptionService,
            name: entity.name,
            userDescription: entity.userDescription,
            price: entity.price,
            creationDate: Date(timeIntervalSince1970: Double(entity.creationTimestamp)),
            duration: duration,
            paymentFrequency: paymentFrequency,
            lastPaymentDate: lastPaymentDate,
            nextPaymentDate: nextPaymentDate,
            userRecordatory: userRecodatory,
            userRecordatoryDate: userRecordatoryDate,
            notificationIdentifier: entity.notificationIdentifier,
            countDown: entity.countdown
        )
    }
}
