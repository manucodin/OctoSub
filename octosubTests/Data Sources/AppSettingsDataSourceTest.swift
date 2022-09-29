//
//  AppSettingsDataSourceTest.swift
//  octosubTests
//
//  Created by Manuel Rodriguez Sebastian on 29/9/22.
//
@testable import octosub

import XCTest
import Nimble

final class AppSettingsDataSourceTest: XCTestCase {
    private var sut: AppSettingsDataSourceImp!
    
    override func setUp() {
        sut = AppSettingsDataSourceImp()
    }
    
    override func tearDown() {
        sut.removeAll()
        sut = nil
    }
    
    func testLoadDefaultValues() {
        let key = UUID().uuidString
        let value = false
        let defaultValues = [key : value]
        
        sut.loadDefaultValues(defaultValues: defaultValues)
        
        expect(self.sut.boolValue(withKey: key)).to(beFalse())
    }
    
    func testSaveBool() {
        let key = UUID().uuidString
        let value = true
        
        sut.save(boolValue: value, withKey: key)
        
        expect(self.sut.boolValue(withKey: key)).to(beTrue())
    }
    
    func testRemoveAll() {
        let key = UUID().uuidString
        
        sut.save(boolValue: true, withKey: key)
        expect(self.sut.boolValue(withKey: key)).notTo(beNil())
        expect(self.sut.boolValue(withKey: key)).to(beTrue())
        
        sut.removeAll()
        expect(self.sut.boolValue(withKey: key)).to(beFalse())
    }

}
