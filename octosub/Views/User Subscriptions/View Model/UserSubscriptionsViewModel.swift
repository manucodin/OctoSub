//
//  UserSubscriptionsViewModel.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 29/9/22.
//

import Foundation
import Combine

class UserSubscriptionsViewModel: ObservableObject {
    @Published var showServicesList: Bool = false
    @Published var subscriptions: [Subscription] = []
        
    @Published var showEditSubscription: Bool = false
    @Published var selectedSubscription: Subscription? = nil
        
    @Published var totalAmount: Double = .zero
    @Published var totalAmountFormatted: String = ""
    @Published var subtitle: String = ""
    
    @Published var dateTypeSelected: DateType = .monthly
    
    private let numberFormatter = CurrencyFormatter()
    private let subscriptionsDataSource: SubscriptionsDataSource
    private let ammountService: SubscriptionsAmmountService
    
    private var subscribers: Set<AnyCancellable> = []
    
    init(subscriptionsDataSource: SubscriptionsDataSource = SubscriptionsDataSourceImp(), ammountService: SubscriptionsAmmountService = SubscriptionsAmmountServiceImp()) {
        self.subscriptionsDataSource = subscriptionsDataSource
        self.ammountService = ammountService
        calculateTotalAmmount(withDateType: dateTypeSelected)
        
        $dateTypeSelected.sink { [weak self] valueSelected in
            self?.calculateTotalAmmount(withDateType: valueSelected)
        }.store(in: &subscribers)
    }
    
    public func loadSubscriptions() {
        subscriptions = subscriptionsDataSource.getAll()
        calculateTotalAmmount(withDateType: .monthly)
    }
    
    public func presentServiceList() {
        self.showServicesList = true
    }
    
    public func dismissServiceList() {
        self.showServicesList = true
    }
    
    public func select(subscription: Subscription) {
        self.showEditSubscription = true
        self.selectedSubscription = subscription
    }
    
    private func calculateTotalAmmount(withDateType dateType: DateType) {
        totalAmount = ammountService.calculateAmmount(withDateType: dateType, userSubscriptions: subscriptions)
        totalAmountFormatted = CurrencyFormatter().string(from: NSNumber(value:totalAmount)) ?? ""
    }
}
