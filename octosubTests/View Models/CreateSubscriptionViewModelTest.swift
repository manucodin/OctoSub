//
//  CreateSubscriptionViewModelTest.swift
//  octosubTests
//
//  Created by Manuel Rodriguez Sebastian on 18/10/22.
//
@testable import octosub

import XCTest
import Nimble
import Fakery

final class CreateSubscriptionViewModelTest: XCTestCase {
    
    private var sut: CreateSubscriptionViewModel!
    private var subscriptionService: SubscriptionService!
    private var subscriptionsDataSourceMock: SubscriptionsDataSource!
    private var faker: Faker!
    
    override func setUp() {
        subscriptionService = SubscriptionServiceMother.netflix
        subscriptionsDataSourceMock = SubscriptionsDataSourceMock()
        faker = Faker(locale: "es")
        
        sut = CreateSubscriptionViewModel(
            subscriptionService: subscriptionService,
            showView: .constant(true),
            subscriptionDataSource: subscriptionsDataSourceMock
        )
    }
    
    func testDismissView() {
        sut.dismissView()
        
        expect(self.sut.showView).to(beTrue())
    }
    
    func testPresentDeleteAlert() {
        sut.presentDeletAlert()
        
        expect(self.sut.showDeleteAlert).to(beTrue())
    }
    
    func testCloseDeleteAlert() {
        sut.closeDeleteAlert()
        
        expect(self.sut.showDeleteAlert).to(beFalse())
    }
    
    func testCreateInvalidSubscription() {
        sut.subscriptionName = .empty
        
        Task {
            await sut.saveSubscription()
            
            expect(self.sut.showError).toEventually(beTrue())
            expect(self.sut.errorMessage).toEventuallyNot(beEmpty())
        }
    }
    
    func testValidateValidNameAndPrice() {
        sut.subscriptionName = faker.lorem.word()
        sut.subscriptionPrice = faker.commerce.price()
        
        expect{ try self.sut.validate() }.toNot(throwError())
    }
    
    func testValidateNotValidName() {
        sut.subscriptionName = .empty
        
        expect { try self.sut.validate() }.to(throwError(SubscriptionError.emptyName))
    }
    
    func testValidateNotValidPrice() {
        sut.subscriptionPrice = .zero
        
        expect { try self.sut.validate() }.to(throwError(SubscriptionError.invalidPrice))
    }
}
