//
//  AppDelegate.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 28/9/22.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    
    private let appSettingsDataSource: AppSettingsDataSource = AppSettingsDataSourceImp()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        loadFirebase()
        loadDefaultAppSettings()
        return true
    }
    
    private func loadFirebase() {
        FirebaseApp.configure()
    }
    
    private func loadDefaultAppSettings() {
        appSettingsDataSource.loadDefaultValues(defaultValues: [
            AppSetting.ShowOnBoarding.key: AppSetting.ShowOnBoarding.defaultValue
        ])
    }
}
