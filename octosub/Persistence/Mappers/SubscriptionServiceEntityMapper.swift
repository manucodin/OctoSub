//
//  SubscriptionServiceEntityMapper.swift
//  subscription_tracker
//
//  Created by Manuel Rodriguez Sebastian on 10/9/22.
//

import Foundation

class SubscriptionServiceEntityMapper {
    static func transform(subscriptionService: SubscriptionService?) -> SubscriptionServiceEntity? {
        guard let subscriptionService = subscriptionService else { return nil }

        return SubscriptionServiceEntity(
            id: subscriptionService.id,
            name: subscriptionService.name,
            category: subscriptionService.category,
            color: subscriptionService.color,
            icon: subscriptionService.icon
        )
    }
    
    static func transform(entity: SubscriptionServiceEntity?) -> SubscriptionService? {
        guard let entity = entity else { return nil }

        return SubscriptionService(
            id: entity.id,
            name: entity.name,
            category: entity.category,
            color: entity.color,
            icon: entity.icon
        )
    }
}
