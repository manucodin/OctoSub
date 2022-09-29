//
//  SubscriptionServicesDataSource.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 29/9/22.
//

import Foundation

protocol SubscriptionServicesDataSource {
    func loadSubscriptionServices() async -> [SubscriptionService]
}
