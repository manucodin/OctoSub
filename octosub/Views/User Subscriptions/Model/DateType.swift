//
//  DateType.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 28/9/22.
//

import Foundation

enum DateType: String, CaseIterable, PickerRepresentableValue {
    case daily
    case weekly
    case monthly
    case annually
    
    init(intValue: Int) {
        switch intValue {
        case 0: self = .daily
        case 1: self = .weekly
        case 2: self = .monthly
        default: self = .annually
        }
    }
    
    var stringValue: String {
        switch self {
        case .daily: return "Dia(s)"
        case .weekly: return "Semana(s)"
        case .monthly: return "Mes(es)"
        case .annually: return "Año(s)"
        }
    }
    
    var timeInterval: TimeInterval {
        switch self {
        case .daily: return dayTimeInterval
        case .weekly: return weekTimeInterval
        case .monthly: return monthTimeInterval
        case .annually: return yearTimeInterval
        }
    }
    
    private var dayTimeInterval: TimeInterval {
        return 60*60*24
    }
    
    private var weekTimeInterval: TimeInterval {
        return 7*dayTimeInterval
    }
    
    private var monthTimeInterval: TimeInterval {
        return 30*dayTimeInterval
    }
    
    private var yearTimeInterval: TimeInterval {
        return 365*dayTimeInterval
    }
}
