//
//  SubscriptionServiceMother.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 29/9/22.
//

import Foundation

class SubscriptionServiceMother {
    static var subscriptions: [SubscriptionService] = [netflix, amazon,  spotify, hbo]
    
    static var netflix: SubscriptionService {
        return SubscriptionService(
            id: "",
            name: "Netflix",
            category: "Entretenimiento",
            color: "E50914"
        )
    }
    
    static var amazon: SubscriptionService {
        return SubscriptionService(
            id: "",
            name: "Amazon",
            category: "Entretenimiento",
            color: "FF9900"
        )
    }
    
    static var spotify: SubscriptionService {
        return SubscriptionService(
            id: "",
            name: "Spotify",
            category: "Entretenimiento",
            color: "1DB954"
        )
    }
    static var hbo: SubscriptionService {
        return SubscriptionService(
            id: "",
            name: "HBO",
            category: "Entretenimiento",
            color: "000000"
        )
    }
}
