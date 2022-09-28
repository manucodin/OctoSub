//
//  AppDelegate.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 28/9/22.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    
    private let appSettingsDataSource: AppSettingsDataSource = AppSettingsDataSourceImp()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        loadDefaultAppSettings()
        return true
    }
    
    private func loadDefaultAppSettings() {
        appSettingsDataSource.loadDefaultValues(defaultValues: [
            AppSetting.ShowOnBoarding.key: AppSetting.ShowOnBoarding.defaultValue
        ])
    }
}
