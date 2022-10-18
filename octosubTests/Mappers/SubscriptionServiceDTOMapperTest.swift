//
//  SubscriptionServiceDTOMapperTest.swift
//  octosubTests
//
//  Created by Manuel Rodriguez Sebastian on 18/10/22.
//

@testable import octosub

import XCTest
import Nimble
import Fakery

final class SubscriptionServiceDTOMapperTest: XCTestCase {
    private let faker = Faker(locale: "es")
    
    func testMapSubscriptionServiceDTOToDomainModel() {
        let subscriptionServiceDTO = SubscriptionServiceDTO(
            id: faker.lorem.word(),
            name: faker.lorem.word(),
            category: faker.lorem.word(),
            icon: faker.internet.image(),
            color: faker.lorem.word()
        )
        
        let sut = SubscriptionServiceDTOMapper.transform(dto: subscriptionServiceDTO)
        expect(sut).toNot(beNil())
        expect(sut?.id).to(equal(subscriptionServiceDTO.id))
        expect(sut?.name).to(equal(subscriptionServiceDTO.name))
        expect(sut?.category).to(equal(subscriptionServiceDTO.category))
        expect(sut?.icon).to(equal(subscriptionServiceDTO.icon))
        expect(sut?.color).to(equal(subscriptionServiceDTO.color))
    }
    
    func testMapSubscriptionServiceDTOWithoutIdentifier() {
        let subscriptionServiceDTO = SubscriptionServiceDTO(
            name: faker.lorem.word(),
            category: faker.lorem.word(),
            icon: faker.internet.image(),
            color: faker.lorem.word()
        )
        
        let sut = SubscriptionServiceDTOMapper.transform(dto: subscriptionServiceDTO)
        expect(sut).to(beNil())
    }
    
    func testMapSubscriptionServiceDTOToDefaultValues() {
        let subscriptionServiceDTO = SubscriptionServiceDTO(
            id: faker.lorem.word(),
            name: nil,
            category: nil,
            icon: nil,
            color: nil
        )
        
        let sut = SubscriptionServiceDTOMapper.transform(dto: subscriptionServiceDTO)
        expect(sut).toNot(beNil())
        expect(sut?.name).to(equal(.empty))
        expect(sut?.category).to(equal(.empty))
        expect(sut?.icon).to(equal(.empty))
        expect(sut?.color).to(equal(.empty))
    }
}
