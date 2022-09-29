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
            color: "E50914",
            icon: "https://w7.pngwing.com/pngs/153/31/png-transparent-netflix-macos-bigsur-icon-thumbnail.png"
        )
    }
    
    static var amazon: SubscriptionService {
        return SubscriptionService(
            id: "",
            name: "Amazon",
            category: "Entretenimiento",
            color: "FF9900",
            icon: "https://w7.pngwing.com/pngs/153/31/png-transparent-netflix-macos-bigsur-icon-thumbnail.png"
        )
    }
    
    static var spotify: SubscriptionService {
        return SubscriptionService(
            id: "",
            name: "Spotify",
            category: "Entretenimiento",
            color: "1DB954",
            icon: "https://w7.pngwing.com/pngs/153/31/png-transparent-netflix-macos-bigsur-icon-thumbnail.png"
        )
    }
    static var hbo: SubscriptionService {
        return SubscriptionService(
            id: "",
            name: "HBO",
            category: "Entretenimiento",
            color: "000000",
            icon: "https://w7.pngwing.com/pngs/153/31/png-transparent-netflix-macos-bigsur-icon-thumbnail.png"
        )
    }
}
