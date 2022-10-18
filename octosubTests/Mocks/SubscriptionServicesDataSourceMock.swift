//
//  SubscriptionServicesDataSourceMock.swift
//  octosubTests
//
//  Created by Manuel Rodriguez Sebastian on 18/10/22.
//

@testable import octosub

import Foundation

class SubscriptionServicesDataSourceMock: SubscriptionServicesDataSource {
    var invokedLoadSubscriptionServices = false
    var invokedLoadSubscriptionServicesCount = 0
    var stubbedSubscriptionServices: [SubscriptionService]!
    
    func loadSubscriptionServices() async -> [SubscriptionService] {
        invokedLoadSubscriptionServices = true
        invokedLoadSubscriptionServicesCount += 1
        return stubbedSubscriptionServices
    }
}
