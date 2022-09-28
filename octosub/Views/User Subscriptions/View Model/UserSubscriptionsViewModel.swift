//
//  UserSubscriptionsViewModel.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 29/9/22.
//

import Foundation
import Combine

class UserSubscriptionsViewModel: ObservableObject {
    @Published var showCreateSubscription: Bool = false
    @Published var showAddSubscription: Bool = false
    @Published var subscriptions: [Subscription] = []
    
    @Published var totalAmount: Double = .zero
    @Published var totalAmountFormatted: String = ""
    
    private let numberFormatter = CurrencyFormatter()
    
    public func loadSubscriptions() {}
}
