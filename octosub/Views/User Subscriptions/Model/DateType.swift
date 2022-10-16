//
//  DateType.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 28/9/22.
//

import Foundation

enum DateType: String, Comparable, CaseIterable, Equatable, PickerRepresentableValue {
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
        case .daily: return "daily_picker_option".localized
        case .weekly: return "weekly_picker_option".localized
        case .monthly: return "monthy_picker_option".localized
        case .annually: return "annualy_picker_option".localized
        }
    }
    
    var filterTitle: String {
        switch self {
        case .daily: return "daily".localized.capitalized
        case .weekly: return "weekly".localized.capitalized
        case .monthly: return "monthly".localized.capitalized
        case .annually: return "annually".localized.capitalized
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
    
    var sortOrder: Int {
        switch self {
        case .daily: return 0
        case .weekly: return 1
        case .monthly: return 2
        case .annually: return 3
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
    
    static func == (lhs: DateType, rhs: DateType) -> Bool {
        return lhs.sortOrder == rhs.sortOrder
    }
    
    static func < (lhs: DateType, rhs: DateType) -> Bool {
        return lhs.sortOrder < rhs.sortOrder
    }
}
