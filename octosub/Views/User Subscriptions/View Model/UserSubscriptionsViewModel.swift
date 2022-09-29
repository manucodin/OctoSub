//
//  UserSubscriptionsViewModel.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 29/9/22.
//

import Foundation
import Combine

class UserSubscriptionsViewModel: ObservableObject {
    @Published var showServicesList: Bool = false
    @Published var subscriptions: [Subscription] = []
        
    @Published var showEditSubscription: Bool = false
    @Published var selectedSubscription: Subscription? = nil
        
    @Published var totalAmount: Double = .zero
    @Published var totalAmountFormatted: String = ""
    
    private let numberFormatter = CurrencyFormatter()
    private let subscriptionsDataSource: SubscriptionsDataSource
    
    init(subscriptionsDataSource: SubscriptionsDataSource = SubscriptionsDataSourceImp()) {
        self.subscriptionsDataSource = subscriptionsDataSource
        self.totalAmountFormatted = numberFormatter.string(from: NSNumber(value: totalAmount)) ?? ""
    }
    
    public func loadSubscriptions() {
        subscriptions = subscriptionsDataSource.getAll()
        calculateTotalAmmount()
    }
    
    public func presentServiceList() {
        self.showServicesList = true
    }
    
    public func dismissServiceList() {
        self.showServicesList = true
    }
    
    public func select(subscription: Subscription) {
        self.showEditSubscription = true
        self.selectedSubscription = subscription
    }
    
    private func calculateTotalAmmount() {
        let prices = subscriptions.map{ $0.price }
        totalAmount = prices.reduce(0, +)
        totalAmountFormatted = CurrencyFormatter().string(from: NSNumber(value:totalAmount)) ?? ""
    }
}
