//
//  SubscriptionServiceEntity.swift
//  subscription_tracker
//
//  Created by Manuel Rodriguez Sebastian on 10/9/22.
//

import Foundation
import RealmSwift

class SubscriptionServiceEntity: Object {
    @Persisted(primaryKey: true) var id: String
    @Persisted var name: String
    @Persisted var category: String
    @Persisted var color: String
    @Persisted var icon: String
    
    convenience init(id: String, name: String, category: String, color: String, icon: String) {
        self.init()
        self.id = id
        self.name = name
        self.category = category
        self.color = color
        self.icon = icon
    }
}
