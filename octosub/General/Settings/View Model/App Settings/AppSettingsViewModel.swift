//
//  AppSettingsViewModel.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 28/9/22.
//

import Foundation
import Combine

class AppSettingsViewModel: ObservableObject {
    @Published var showOnBoarding: Bool
    
    private let appSettingsDataSource: AppSettingsDataSource
    
    init(appSettingsDataSource: AppSettingsDataSource = AppSettingsDataSourceImp()) {
        self.appSettingsDataSource = appSettingsDataSource
        self.showOnBoarding = appSettingsDataSource.boolValue(withKey: AppSetting.ShowOnBoarding.key)
    }
    
    func closeOnBoarding() {
        appSettingsDataSource.save(boolValue: false, withKey: AppSetting.ShowOnBoarding.key)
        showOnBoarding = appSettingsDataSource.boolValue(withKey: AppSetting.ShowOnBoarding.key)
    }
}
