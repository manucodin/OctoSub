//
//  SubscriptionMother.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 29/9/22.
//

import Foundation

class SubscriptionMother {
    static var netflix: Subscription {
        return Subscription(
            id: "",
            subscriptionService: SubscriptionServiceMother.netflix,
            name: "",
            userDescription: "",
            price: 10.0,
            creationDate: Date(),
            duration: DateDuration(value: 1, dateType: .monthly),
            recordatory: DateDuration(value: 1, dateType: .weekly)
        )
    }
    
    static var amazon: Subscription {
        return Subscription(
            id: "",
            subscriptionService: SubscriptionServiceMother.amazon,
            name: "",
            userDescription: "",
            price: 10.0, creationDate: Date(),
            duration: DateDuration(value: 1, dateType: .monthly),
            recordatory: DateDuration(value: 1, dateType: .weekly)
        )
    }
    
    static var spotify: Subscription {
        return Subscription(
            id: "",
            subscriptionService: SubscriptionServiceMother.spotify,
            name: "",
            userDescription: "",
            price: 10.0,
            creationDate: Date(),
            duration: DateDuration(value: 1, dateType: .monthly),
            recordatory: DateDuration(value: 1, dateType: .weekly)
        )
    }
    
    static var hbo: Subscription {
        return Subscription(
            id: "",
            subscriptionService: SubscriptionServiceMother.hbo,
            name: "",
            userDescription: "",
            price: 10.0,
            creationDate: Date(),
            duration: DateDuration(value: 1, dateType: .monthly),
            recordatory: DateDuration(value: 1, dateType: .weekly)
        )
    }
}
