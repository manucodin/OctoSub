//
//  SubscriptionCountdownServiceImp.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 16/10/22.
//

import Foundation

class SubscriptionCountdownServiceImp {
    private let dao: SubscriptionDAO
    
    init(dao: SubscriptionDAO = SubscriptionDAOImp()) {
        self.dao = dao
    }
}

extension SubscriptionCountdownServiceImp: SubscriptionCountdownService {
    func createCountDown(subscription: Subscription) {
        guard subscription.paymentFrequency != nil else { return }
        
        _ = Timer.scheduledTimer(withTimeInterval: DateType.daily.timeInterval, repeats: true) { [weak self] _ in
            self?.updateCountDown(subscription: subscription)
        }
    }
    
    private func updateCountDown(subscription: Subscription) {
        do {
            let entity = SubscriptionEntityMapper.transform(subscription: subscription.substrackCountDown())
            try dao.save(entity: entity)
        } catch let error {
            debugPrint(error)
        }
    }
}
