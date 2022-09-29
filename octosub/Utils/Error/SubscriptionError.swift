//
//  SubscriptionError.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 29/9/22.
//

import Foundation

enum SubscriptionError: Error {
    case emptyName
    case invalidPrice
    case unknowError
}

extension SubscriptionError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .emptyName: return "create_subscription_error_emptyName".localized
        case .invalidPrice: return "create_subscription_error_invalidPrice".localized
        case .unknowError: return "create_subscription_error_unknowError".localized
        }
    }
}
