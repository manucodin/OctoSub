//
//  octosubApp.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 28/9/22.
//

import SwiftUI

@main
struct octosubApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var appSettingsViewModel = AppSettingsViewModel()

    
    var body: some Scene {
        WindowGroup {
            Group {
                if appSettingsViewModel.showOnBoarding {
                    OnBoardingView()
                } else {
                    UserSubscriptionsView()
                }
            }.environmentObject(appSettingsViewModel)
        }
    }
}
