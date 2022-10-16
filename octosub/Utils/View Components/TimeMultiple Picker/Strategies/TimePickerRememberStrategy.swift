//
//  TimePickerRememberStrategy.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 16/10/22.
//

import UIKit

class TimePickerRememberStrategy: TimePickerStrategy {
    let firstValues: [PickerRepresentableValue]
    let secondValues: [PickerRepresentableValue]
    let thridValues: [PickerRepresentableValue]
    
    init(firstValues: [PickerRepresentableValue], secondValues: [PickerRepresentableValue], thridValues: [PickerRepresentableValue]) {
        self.firstValues = firstValues
        self.secondValues = secondValues
        self.thridValues = thridValues
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0: return firstValues.count
        case 1: return secondValues.count
        default: return thridValues.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0: return firstValues[row].stringValue
        case 1: return secondValues[row].stringValue
        default: return thridValues[row].stringValue
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) -> DateDuration? {
        if component == 0 && (row == 0 || row == 1) {
            reset(pickerView, toRow: row)
            return nil
        } else {
            if case RememberOptions.unit(let value) = firstValues[pickerView.selectedRow(inComponent: 0)] {
                selectUnitValues(pickerView)
                let dateType = DateType(intValue: pickerView.selectedRow(inComponent: 1))
                return DateDuration(value: value, dateType: dateType)
            } else {
                return nil
            }
        }
    }
    
    private func selectUnitValues(_ pickerView: UIPickerView) {
        guard secondValues[pickerView.selectedRow(inComponent: 1)].stringValue.isEmpty || thridValues[pickerView.selectedRow(inComponent: 1)].stringValue.isEmpty else { return }
        
        pickerView.selectRow(1, inComponent: 1, animated: true)
        pickerView.selectRow(1, inComponent: 2, animated: true)
    }
    
    private func reset(_ pickerView: UIPickerView, toRow row: Int) {
        pickerView.selectRow(row, inComponent: 0, animated: true)
        pickerView.selectRow(row, inComponent: 1, animated: true)
        pickerView.selectRow(row, inComponent: 2, animated: true)
    }
}
