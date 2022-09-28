//
//  AppSettingsDataSource.swift
//  subscription_tracker
//
//  Created by Manuel Rodriguez Sebastian on 18/9/22.
//

import Foundation

protocol AppSettingsDataSource {
    func loadDefaultValues(defaultValues: [String: Any])
    func boolValue(withKey key: String) -> Bool
    func save(boolValue: Bool, withKey key: String)
    func removeAll()
}
