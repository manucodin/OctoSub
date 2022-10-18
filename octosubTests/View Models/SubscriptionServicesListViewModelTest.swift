//
//  SubscriptionServicesListViewModelTest.swift
//  octosubTests
//
//  Created by Manuel Rodriguez Sebastian on 18/10/22.
//

@testable import octosub

import XCTest
import Nimble

final class SubscriptionServicesListViewModelTest: XCTestCase {
    private var sut: SubscriptionServicesListViewModel!
    private var service: SubscriptionServicesDataSourceMock!

    override func setUp() {
        service = SubscriptionServicesDataSourceMock()
        sut = SubscriptionServicesListViewModel(subscriptionServicesDataSource: service)
    }
    
    func testLoadSubscriptionServices()  {
        service.stubbedSubscriptionServices = SubscriptionServiceMother.subscriptions
        
        Task {
            await sut.loadSubscriptionServices()
            expect(self.sut.subscriptionServices).toNotEventually(beEmpty())
        }
    }
    
    func testLoadEmptySubcriptionsServices() {
        service.stubbedSubscriptionServices = []
        
        Task {
            await sut.loadSubscriptionServices()
            expect(self.sut.subscriptionServices).toAlways(beEmpty())
        }
    }
}
