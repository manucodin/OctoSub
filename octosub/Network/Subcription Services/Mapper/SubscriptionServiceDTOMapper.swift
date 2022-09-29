//
//  SubscriptionServiceDTOMapper.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 29/9/22.
//

import Foundation

class SubscriptionServiceDTOMapper {
    static func transform(dto: SubscriptionServiceDTO) -> SubscriptionService? {
        guard let id = dto.id else { return nil }
        
        return SubscriptionService(
            id: id,
            name: dto.name,
            category: dto.category,
            color: dto.color,
            icon: dto.icon
        )
    }
}
