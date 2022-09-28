//
//  AppSettingsDataSourceMock.swift
//  octosubTests
//
//  Created by Manuel Rodriguez Sebastian on 29/9/22.
//

@testable import octosub

import Foundation

class AppSettingsDataSourceMock: AppSettingsDataSource {
    var invokedLoadDefaultValues = false
    var invokedLoadDefaultValuesCount = 0
    var invokedLoadDefaultValuesParameters: (defaultValues: [String: Any], Void)?
    var invokedLoadDefaultValuesParametersList = [(defaultValues: [String: Any], Void)]()

    func loadDefaultValues(defaultValues: [String: Any]) {
        invokedLoadDefaultValues = true
        invokedLoadDefaultValuesCount += 1
        invokedLoadDefaultValuesParameters = (defaultValues, ())
        invokedLoadDefaultValuesParametersList.append((defaultValues, ()))
    }

    var invokedBoolValue = false
    var invokedBoolValueCount = 0
    var invokedBoolValueParameters: (key: String, Void)?
    var invokedBoolValueParametersList = [(key: String, Void)]()
    var stubbedBoolValueResult: Bool! = false

    func boolValue(withKey key: String) -> Bool {
        invokedBoolValue = true
        invokedBoolValueCount += 1
        invokedBoolValueParameters = (key, ())
        invokedBoolValueParametersList.append((key, ()))
        return stubbedBoolValueResult
    }

    var invokedSave = false
    var invokedSaveCount = 0
    var invokedSaveParameters: (boolValue: Bool, key: String)?
    var invokedSaveParametersList = [(boolValue: Bool, key: String)]()

    func save(boolValue: Bool, withKey key: String) {
        invokedSave = true
        invokedSaveCount += 1
        invokedSaveParameters = (boolValue, key)
        invokedSaveParametersList.append((boolValue, key))
    }

    var invokedRemoveAll = false
    var invokedRemoveAllCount = 0

    func removeAll() {
        invokedRemoveAll = true
        invokedRemoveAllCount += 1
    }
}
