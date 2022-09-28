//
//  DateDuration.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 28/9/22.
//

import Foundation

struct DateDuration {
    let value: Int
    let dateType: DateType
    
    var formattedDuration: String {
        return "\(value) \(dateType.stringValue)"
    }
    
    var timeInterval: TimeInterval {
        return dateType.timeInterval * Double(value)
    }
}
