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
    @Published var subtitle: String = ""
    
    @Published var dateTypeSelected: DateType = .monthly
    
    private let numberFormatter = CurrencyFormatter()
    private let subscriptionsDataSource: SubscriptionsDataSource
        
    init(subscriptionsDataSource: SubscriptionsDataSource = SubscriptionsDataSourceImp()) {
        self.subscriptionsDataSource = subscriptionsDataSource
    }
    
    public func loadSubscriptions() {
        subscriptions = subscriptionsDataSource.getAll()
        selectAmmout(withDateType: dateTypeSelected)
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
    
    public func selectAmmout(withDateType dateType: DateType) {
        self.dateTypeSelected = dateType
        totalAmount = calculateAmmount(withDateType: dateType)
        totalAmountFormatted = CurrencyFormatter().string(from: NSNumber(value:totalAmount)) ?? ""
    }
    
    private func calculateAmmount(withDateType dateType: DateType) -> Double {
        switch dateType {
        case .weekly: return calculateAmmountWeekly()
        default: return calculateAmmountMonthly()
        }
    }
    
    private func calculateAmmountWeekly() -> Double {
        let currentWeek = Calendar.current.component(.weekOfYear, from: Date())
        let weeklySubscription = subscriptions.filter{ userSubscription in
            
            let subscriptionWeek = Calendar.current.component(.weekOfYear, from: userSubscription.creationDate)
            if let duration = userSubscription.duration {
                return duration.dateType == .weekly && duration.value == 1 && currentWeek >= subscriptionWeek
            } else {
                return currentWeek >= subscriptionWeek
            }
        }
        
        return weeklySubscription.map{ $0.price }.reduce(0, +)
    }
    
    private func calculateAmmountMonthly() -> Double {
        let currentMonth = Calendar.current.component(.month, from: Date())
        let monthlySubscriptions = subscriptions.filter{ userSubscription in
            
            let subscriptionMonth = Calendar.current.component(.month, from: userSubscription.creationDate)
            if let duration = userSubscription.duration {
                return duration.dateType == .monthly && duration.value == 1 && currentMonth >= subscriptionMonth
            } else {
                return currentMonth >= subscriptionMonth
            }
        }
        
        return monthlySubscriptions.map{ $0.price }.reduce(0, +)
    }
}
