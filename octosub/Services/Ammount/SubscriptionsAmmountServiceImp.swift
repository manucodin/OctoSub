//
//  SubscriptionsAmmountServiceImp.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 15/10/22.
//

import Foundation

class SubscriptionsAmmountServiceImp {
    private let subscriptionsDataSource: SubscriptionsDataSource
    
    init(subscriptionsDataSource: SubscriptionsDataSource = SubscriptionsDataSourceImp()) {
        self.subscriptionsDataSource = subscriptionsDataSource
    }
}

extension SubscriptionsAmmountServiceImp: SubscriptionsAmmountService {
    func calculateAmmount(withDateType dateType: DateType, userSubscriptions: [Subscription]) -> Double {
        switch dateType {
        case .weekly: return calculateAmmountWeekly(userSubscriptions: userSubscriptions)
        default: return calculateAmmountMonthly(userSubscriptions: userSubscriptions)
        }
    }
    
    private func calculateAmmountWeekly(userSubscriptions: [Subscription]) -> Double {
        let currentWeek = Calendar.current.component(.weekOfYear, from: Date())
        let weeklySubscription = userSubscriptions.filter{ userSubscription in
            
            let subscriptionWeek = Calendar.current.component(.weekOfYear, from: userSubscription.creationDate)
            if let duration = userSubscription.duration {
                return duration.dateType == .weekly && duration.value == 1 && currentWeek >= subscriptionWeek
            } else {
                return currentWeek >= subscriptionWeek
            }
        }
        
        return weeklySubscription.map{ $0.price }.reduce(0, +)
    }
    
    private func calculateAmmountMonthly(userSubscriptions: [Subscription]) -> Double {
        let currentMonth = Calendar.current.component(.month, from: Date())
        let monthlySubscriptions = userSubscriptions.filter{ userSubscription in
            
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
