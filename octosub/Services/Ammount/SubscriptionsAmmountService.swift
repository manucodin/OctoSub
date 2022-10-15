//
//  SubscriptionsAmmountService.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 15/10/22.
//

import Foundation

protocol SubscriptionsAmmountService {
    func calculateAmmount(withDateType dateType: DateType, userSubscriptions: [Subscription]) -> Double
}
