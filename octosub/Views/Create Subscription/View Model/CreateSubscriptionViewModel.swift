//
//  CreateSubscriptionViewModel.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 29/9/22.
//

import Foundation
import Combine
import SwiftUI

class CreateSubscriptionViewModel: ObservableObject {
    let currencyFormatter = CurrencyFormatter()
    let subscription: Subscription?
    let subscriptionService: SubscriptionService
    
    var iconURL: String {
        if let subscription = subscription {
            return subscription.subscriptionService.icon
        }
        
        return subscriptionService.icon
    }
    
    @Binding var showView: Bool
    
    @Published var subscriptionName: String = ""
    @Published var userDescription: String = ""
    @Published var subscriptionPrice: Double = .zero
    @Published var subscriptionDate: Date = Date()
    @Published var duration: DateDuration? = nil
    @Published var paymentFrequency: DateDuration? = nil
    @Published var userRecordatory: DateDuration? = nil

    @Published var isEditing: Bool = false
    
    @Published var showDuration: Bool = false
    @Published var showPaymentFrequency: Bool = false
    @Published var showUserRecordatory: Bool = false
    
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    
    @Published var showMoreOptions: Bool = false
    @Published var showDeleteAlert: Bool = false
    
    private var subscribers: Set<AnyCancellable> = []
    private let subscriptionDataSource: SubscriptionsDataSource
    
    init(subscription: Subscription? = nil, subscriptionService: SubscriptionService, showView: Binding<Bool> ,subscriptionDataSource: SubscriptionsDataSource = SubscriptionsDataSourceImp()) {
        self.subscription = subscription
        self.subscriptionService = subscriptionService
        self.subscriptionDataSource = subscriptionDataSource
        
        self.subscriptionName = subscription?.name ?? subscriptionService.name
        self.userDescription = subscription?.userDescription ?? ""
        self.duration = subscription?.duration
        self.userRecordatory = subscription?.userRecordatory
        self.paymentFrequency = subscription?.paymentFrequency
        
        self._showView = showView
        
        if let subscription = subscription {
            loadSubscription(subscription: subscription)
        }
    }
    
    func dismissView() {
        showView = false
    }
    
    func presentDeletAlert() {
        showDeleteAlert = true
    }
    
    func closeDeleteAlert() {
        showDeleteAlert = false
    }
    
    func saveSubscription() async {
        let subscription = createSubscription()
        
        do {
            try validate()
            try await subscriptionDataSource.save(subscription: subscription)
            showView = false
        } catch let error {
            errorMessage = error.localizedDescription
            showError = true
        }
    }
    
    func deleteSubscription() async {
        guard let subscription = subscription else { return }
        
        do {
            try await subscriptionDataSource.remove(subscription: subscription)
            dismissView()
        } catch let error {
            errorMessage = error.localizedDescription
            showError = true
        }
    }
    
    private func createSubscription() -> Subscription {
        let durationDate = Date(timeIntervalSince1970: Double(subscriptionDate.timestamp) + Double(duration?.timeInterval ?? 0))
        let nextPaymentDate = Date(timeIntervalSince1970: Double(subscriptionDate.timestamp) + Double(paymentFrequency?.timeInterval ?? 0))
        let userRecordatoryDate = Date(timeIntervalSince1970: Double(nextPaymentDate.timestamp) - Double(userRecordatory?.timeInterval ?? 0))
        
        return Subscription(
            id: "",
            subscriptionService: subscriptionService,
            name: subscriptionName,
            userDescription: userDescription,
            price: subscriptionPrice,
            creationDate: subscriptionDate,
            duration: duration,
            durationDate: durationDate,
            paymentFrequency: paymentFrequency,
            lastPaymentDate: subscriptionDate,
            nextPaymentDate: nextPaymentDate,
            userRecordatory: userRecordatory,
            userRecordatoryDate: userRecordatoryDate
        )
    }
    
    private func validate() throws {
        if subscriptionName.isEmpty {
            throw SubscriptionError.emptyName
        }
        
        if subscriptionPrice <= .zero {
            throw SubscriptionError.invalidPrice
        }
    }
    
    private func loadSubscription(subscription: Subscription) {
        self.subscriptionName = subscription.name ?? ""
        self.subscriptionPrice = subscription.price
        self.userDescription = subscription.userDescription ?? ""
        self.subscriptionDate = subscription.creationDate
        self.isEditing = true
    }
}
