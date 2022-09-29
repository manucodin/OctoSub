//
//  SubscriptionServicesDataSourceImp.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 29/9/22.
//

import Foundation

class SubscriptionServicesDataSourceImp {
    private let service: SubcriptionServicesService
    
    init(service: SubcriptionServicesService = SubcriptionServicesServiceImp()) {
        self.service = service
    }
}

extension SubscriptionServicesDataSourceImp: SubscriptionServicesDataSource {
    func loadSubscriptionServices() async -> [SubscriptionService] {
        return await service.fetchSubscriptionServices()
    }
}
