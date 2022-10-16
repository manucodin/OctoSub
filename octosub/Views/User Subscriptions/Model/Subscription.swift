//
//  Subscription.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 28/9/22.
//

import Foundation

struct Subscription: Identifiable {
    let id: String
    let subscriptionService: SubscriptionService
    let name: String?
    let userDescription: String?
    let price: Double
    let creationDate: Date
    let duration: DateDuration?
    let endDate: Date?
    let paymentFrequency: DateDuration?
    let lastPaymentDate: Date?
    let nextPaymentDate: Date?
    let userRecordatory: DateDuration?
    let userRecordatoryDate: Date?
    let notificationIdentifier: String?
    let countDown: Int?

    var formattedPrice: String {
        return CurrencyFormatter().string(from: NSNumber(value:price)) ?? ""
    }
    
    var notificationMessage: String {
        return "Tu subscripción de \(subscriptionService.name) está a punto de caducar"
    }
    
    init(id: String, subscriptionService: SubscriptionService, name: String? = nil, userDescription: String? = nil, price: Double, creationDate: Date, duration: DateDuration? = nil, durationDate: Date? = nil, paymentFrequency: DateDuration? = nil, lastPaymentDate: Date? = nil, nextPaymentDate: Date? = nil, userRecordatory: DateDuration? = nil, userRecordatoryDate: Date? = nil, notificationIdentifier: String? = nil, countDown: Int? = nil) {
        self.id = id
        self.subscriptionService = subscriptionService
        self.name = name
        self.userDescription = userDescription
        self.price = price
        self.creationDate = creationDate
        self.duration = duration
        self.endDate = durationDate
        self.paymentFrequency = paymentFrequency
        self.lastPaymentDate = lastPaymentDate
        self.nextPaymentDate = nextPaymentDate
        self.userRecordatory = userRecordatory
        self.userRecordatoryDate = userRecordatoryDate
        self.notificationIdentifier = notificationIdentifier
        self.countDown = countDown
    }
    
    func updating(_ notificationIdentifier: String?) -> Subscription {
        return Subscription(
            id: id,
            subscriptionService: subscriptionService,
            name: name,
            userDescription: userDescription,
            price: price,
            creationDate: creationDate,
            duration: duration,
            durationDate: endDate,
            paymentFrequency: paymentFrequency,
            lastPaymentDate: lastPaymentDate,
            nextPaymentDate: nextPaymentDate,
            userRecordatory: userRecordatory,
            userRecordatoryDate: userRecordatoryDate,
            notificationIdentifier: notificationIdentifier,
            countDown: countDown
        )
    }
    
    func substrackCountDown() -> Subscription
    {
        var newCountDown: Int?
        if let countDown, countDown > 0 {
            newCountDown = countDown - 1
        }
        
        return Subscription(
            id: id,
            subscriptionService: subscriptionService,
            name: name,
            userDescription: userDescription,
            price: price,
            creationDate: creationDate,
            duration: duration,
            durationDate: endDate,
            paymentFrequency: paymentFrequency,
            lastPaymentDate: lastPaymentDate,
            nextPaymentDate: nextPaymentDate,
            userRecordatory: userRecordatory,
            userRecordatoryDate: userRecordatoryDate,
            notificationIdentifier: notificationIdentifier,
            countDown: newCountDown
        )
    }
}
