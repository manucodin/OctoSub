//
//  NotificationError.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 15/10/22.
//

import Foundation

enum NotificationError: Error {
    case permisionDenied
    case unknowError
}

extension NotificationError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .permisionDenied: return "permisionDenied".localized
        case .unknowError: return "unknowError".localized
        }
    }
}
