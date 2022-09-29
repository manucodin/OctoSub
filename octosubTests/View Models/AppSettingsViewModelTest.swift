//
//  AppSettingsViewModelTest.swift
//  octosubTests
//
//  Created by Manuel Rodriguez Sebastian on 29/9/22.
//
@testable import octosub

import XCTest
import Nimble

final class AppSettingsViewModelTest: XCTestCase {
    private var sut: AppSettingsViewModel!
    private var appSettingsDataSource: AppSettingsDataSourceMock!
    
    override func setUp() {
        super.setUp()
        appSettingsDataSource = AppSettingsDataSourceMock()
        sut = AppSettingsViewModel(appSettingsDataSource: appSettingsDataSource)
    }
    
    override func tearDown() {
        super.tearDown()
        appSettingsDataSource = nil
        sut = nil
    }
    
    func testInitValues() {
        appSettingsDataSource.stubbedBoolValueResult = true
        
        sut = AppSettingsViewModel(appSettingsDataSource: appSettingsDataSource)
        expect(self.sut.showOnBoarding).to(beTrue())
    }
    
    func testCloseOnboarding() {
        sut.closeOnBoarding()
        expect(self.sut.showOnBoarding).to(beFalse())
    }

}
