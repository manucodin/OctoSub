//
//  RememberOptions.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 16/10/22.
//

import Foundation

enum RememberOptions: PickerRepresentableValue {
    case never
    case sameDay
    case unit(value: Int)
    
    var stringValue: String {
        switch self {
        case .never: return "never".localized.capitalized
        case .sameDay: return "same_day".localized.capitalized
        case .unit(let value): return "\(value)"
        }
    }
}
