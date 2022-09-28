//
//  Subscription.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 28/9/22.
//

import Foundation

struct Subscription: Identifiable {
    let id: String
    let subscriptionService: SubscriptionService?
    let name: String?
    let userDescription: String?
    let price: Double
    let creationDate: Date
    let duration: DateDuration?
    let recordatory: DateDuration?
    
    var formattedPrice: String {
        return CurrencyFormatter().string(from: NSNumber(value:price)) ?? ""
    }
    
    var notificationMessage: String {
        if let subscriptionService {
            return "Tu subscripción de \(subscriptionService.name) está a punto de caducar"
        }
        
        if let userDescription {
            return userDescription
        }
        
        return "Una subscripción está a punto de caducar"
    }
}
