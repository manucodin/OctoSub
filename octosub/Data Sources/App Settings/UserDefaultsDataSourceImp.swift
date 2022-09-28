//
//  AppSettingsDataSourceImp.swift
//  subscription_tracker
//
//  Created by Manuel Rodriguez Sebastian on 18/9/22.
//

import Foundation

class AppSettingsDataSourceImp {
    private let userDefaults = UserDefaults.standard
}

extension AppSettingsDataSourceImp: AppSettingsDataSource {
    func loadDefaultValues(defaultValues: [String: Any]) {
        userDefaults.register(defaults: defaultValues)
    }
    
    func boolValue(withKey key: String) -> Bool {
        return userDefaults.bool(forKey: key)
    }
    
    func save(boolValue: Bool, withKey key: String) {
        userDefaults.setValue(boolValue, forKey: key)
    }
    
    func removeAll() {
        let dictionary = userDefaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            userDefaults.removeObject(forKey: key)
        }
    }
}
