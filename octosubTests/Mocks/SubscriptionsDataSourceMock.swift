//
//  SubscriptionsDataSourceMock.swift
//  octosubTests
//
//  Created by Manuel Rodriguez Sebastian on 18/10/22.
//
@testable import octosub

import Foundation

class SubscriptionsDataSourceMock: SubscriptionsDataSource {
    var invokedSave = false
    var invokedSaveCount = 0
    var invokedSaveParameters: (subscription: Subscription, Void)?
    var invokedSaveParametersList = [(subscription: Subscription, Void)]()

    func save(subscription: Subscription) {
        invokedSave = true
        invokedSaveCount += 1
        invokedSaveParameters = (subscription, ())
        invokedSaveParametersList.append((subscription, ()))
    }

    var invokedGetAll = false
    var invokedGetAllCount = 0
    var stubbedGetAllResult: [Subscription]! = []

    func getAll() -> [Subscription] {
        invokedGetAll = true
        invokedGetAllCount += 1
        return stubbedGetAllResult
    }

    var invokedRemove = false
    var invokedRemoveCount = 0
    var invokedRemoveParameters: (subscription: Subscription, Void)?
    var invokedRemoveParametersList = [(subscription: Subscription, Void)]()

    func remove(subscription: Subscription) {
        invokedRemove = true
        invokedRemoveCount += 1
        invokedRemoveParameters = (subscription, ())
        invokedRemoveParametersList.append((subscription, ()))
    }
}
