//
//  PickerRepresentableValue.swift
//  subscription_tracker
//
//  Created by Manuel Rodriguez Sebastian on 21/9/22.
//

import Foundation

protocol PickerRepresentableValue {
    var stringValue: String { get }
}

extension String: PickerRepresentableValue {
    var stringValue: String {
        return self
    }
}

extension Int: PickerRepresentableValue {
    var stringValue: String {
        return "\(self)"
    }
}
