//
//  SubscriptionEntityMapper.swift
//  subscription_tracker
//
//  Created by Manuel Rodriguez Sebastian on 10/9/22.
//

import Foundation

class SubscriptionEntityMapper {
    static func transform(subscription: Subscription, notificationIdentifier: String? = nil) -> SubscriptionEntity {
        let subscriptionServiceEntity = SubscriptionServiceEntityMapper.transform(subscriptionService: subscription.subscriptionService)
        return SubscriptionEntity(
            subscriptionService: subscriptionServiceEntity,
            name: subscription.name,
            userDescription: subscription.userDescription,
            price: subscription.price,
            date: subscription.creationDate,
            durationValue: subscription.duration?.value,
            durationType: subscription.duration?.dateType.rawValue,
            repetionValue: subscription.recordatory?.value,
            repetionType: subscription.recordatory?.dateType.rawValue,
            notificationIdentifier: notificationIdentifier
        )
    }
    
    static func transform(entity: SubscriptionEntity) -> Subscription? {
        guard let subscriptionService = SubscriptionServiceEntityMapper.transform(entity: entity.subscriptionService) else { return nil }
        
        var duration: DateDuration?
        if let durationValue = entity.durationValue, let durationStringType = entity.durationType, let dateType = DateType(rawValue: (durationStringType)) {
            duration = DateDuration(value: durationValue, dateType: dateType)
        }
        
        var recordatory: DateDuration?
        if let recordatoryValue = entity.repetionValue, let recordatoryStringValue = entity.repetionType, let dateType = DateType(rawValue: (recordatoryStringValue)) {
            recordatory = DateDuration(value: recordatoryValue, dateType: dateType)
        }
        
        return Subscription(
            id: entity.id.stringValue,
            subscriptionService: subscriptionService,
            name: entity.name,
            userDescription: entity.userDescription,
            price: entity.price,
            creationDate: entity.creationDate,
            duration: duration,
            recordatory: recordatory
        )
    }
}
