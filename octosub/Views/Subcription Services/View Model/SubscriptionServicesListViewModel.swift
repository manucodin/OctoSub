//
//  SubscriptionServicesListViewModel.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 29/9/22.
//

import Foundation
import Combine

class SubscriptionServicesListViewModel: ObservableObject {
    @Published var subscriptionServices: [SubscriptionService] = []
    
    private let subscriptionServicesDataSource: SubscriptionServicesDataSource
    
    init(subscriptionServicesDataSource: SubscriptionServicesDataSource = SubscriptionServicesDataSourceImp()) {
        self.subscriptionServicesDataSource = subscriptionServicesDataSource
    }
    
    @MainActor
    func loadSubscriptionServices() async {
        self.subscriptionServices = await subscriptionServicesDataSource.loadSubscriptionServices()
    }
}
