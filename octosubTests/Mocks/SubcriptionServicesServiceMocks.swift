//
//  SubcriptionServicesServiceMocks.swift
//  octosubTests
//
//  Created by Manuel Rodriguez Sebastian on 18/10/22.
//

@testable import octosub

import Foundation

class SubcriptionServicesServiceMocks: SubcriptionServicesService {
    var invokedFetchSubscriptionServices = false
    var invokedFetchSubscriptionServicesCount = 0
    var stubbedSubscriptionServices: [SubscriptionService]!
    
    func fetchSubscriptionServices() async -> [SubscriptionService]{
        invokedFetchSubscriptionServices = true
        invokedFetchSubscriptionServicesCount += 1
        return stubbedSubscriptionServices
    }
}
