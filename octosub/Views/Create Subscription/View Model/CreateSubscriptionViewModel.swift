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
    @Published var recordatory: DateDuration? = nil

    @Published var isEditing: Bool = false
    
    @Published var showDuration: Bool = false
    @Published var showRecordatory: Bool = false
    
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    
    @Published var showMoreOptions: Bool = false
    @Published var showDeleteAlert: Bool = false
    
    private let subscriptionDataSource: SubscriptionsDataSource
    
    init(subscription: Subscription? = nil, subscriptionService: SubscriptionService, showView: Binding<Bool> ,subscriptionDataSource: SubscriptionsDataSource = SubscriptionsDataSourceImp()) {
        self.subscription = subscription
        self.subscriptionService = subscriptionService
        self.subscriptionDataSource = subscriptionDataSource
        
        self.subscriptionName = subscription?.name ?? subscriptionService.name
        self.userDescription = subscription?.userDescription ?? ""
        self.duration = subscription?.duration
        self.recordatory = subscription?.recordatory
        self.duration = subscription?.duration
        self.recordatory = subscription?.recordatory
        
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
    
    @MainActor
    func saveSubscription() {
        let subscription = createSubscription()
        
        Task {
            do {
                try validate()
                
                if subscription.recordatory != nil {
//                    let notificationIdentifier = try await notificationService.createRecordatory(subscription: subscription)
                    try subscriptionDataSource.save(subscription: subscription, notificationIdentifier: nil)
                } else {
                    try subscriptionDataSource.save(subscription: subscription, notificationIdentifier: nil)
                }
                
                showView = false
            } catch let error {
                errorMessage = error.localizedDescription
                showError = true
            }
        }
    }
    
    @MainActor
    func deleteSubscription() {
        guard let subscription = subscription else { return }
        
        do {
            try subscriptionDataSource.remove(subscription: subscription)
            dismissView()
        } catch let error {
            errorMessage = error.localizedDescription
            showError = true
        }
    }
    
    private func createSubscription() -> Subscription {
        return Subscription(
            id: "",
            subscriptionService: subscriptionService,
            name: subscriptionName,
            userDescription: userDescription,
            price: subscriptionPrice,
            creationDate: subscriptionDate,
            duration: duration,
            recordatory: recordatory
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
