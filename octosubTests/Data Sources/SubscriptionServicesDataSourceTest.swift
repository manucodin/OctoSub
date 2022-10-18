//
//  SubscriptionServicesDataSourceTest.swift
//  octosubTests
//
//  Created by Manuel Rodriguez Sebastian on 18/10/22.
//

@testable import octosub

import XCTest
import Nimble

final class SubscriptionServicesDataSourceTest: XCTestCase {

    private var sut: SubscriptionServicesDataSourceImp!
    private var serviceMock: SubcriptionServicesServiceMocks!
    
    override func setUp() {
        serviceMock = SubcriptionServicesServiceMocks()
        sut = SubscriptionServicesDataSourceImp(service: serviceMock)
    }
    
    func testLoadSubscriptions() {
        serviceMock.stubbedSubscriptionServices = SubscriptionServiceMother.subscriptions
        
        Task {
            let subscriptionServices = await sut.loadSubscriptionServices()
            expect(subscriptionServices).toEventuallyNot(beEmpty())
        }
    }
    
    func testLoadEmptySubscriptions() {
        serviceMock.stubbedSubscriptionServices = []
        
        Task {
            let subscriptionServices = await sut.loadSubscriptionServices()
            expect(subscriptionServices).toAlways(beEmpty())
        }
    }
}
