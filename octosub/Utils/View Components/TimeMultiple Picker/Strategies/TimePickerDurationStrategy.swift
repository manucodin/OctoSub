//
//  TimePickerDurationStrategy.swift
//  subscription_tracker
//
//  Created by Manuel Rodriguez Sebastian on 21/9/22.
//

import UIKit

class TimePickerDurationStrategy: TimePickerStrategy{
    let firstValues: [PickerRepresentableValue]
    let secondValues: [PickerRepresentableValue]
    
    init(firstValues: [PickerRepresentableValue], secondValues: [PickerRepresentableValue]) {
        self.firstValues = firstValues
        self.secondValues = secondValues
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0: return firstValues.count
        default: return secondValues.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0: return firstValues[row].stringValue
        default: return secondValues[row].stringValue
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) -> DateDuration? {
        let dateType = DateType(intValue: pickerView.selectedRow(inComponent: 1))
        let value = firstValues[pickerView.selectedRow(inComponent: 0)] as? Int ?? .zero
        
        return DateDuration(value: value, dateType: dateType)
    }
}
