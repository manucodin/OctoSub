//
//  TimePickerStrategy.swift
//  subscription_tracker
//
//  Created by Manuel Rodriguez Sebastian on 21/9/22.
//

import UIKit

protocol TimePickerStrategy {
    var firstValues: [PickerRepresentableValue] { get }
    var secondValues: [PickerRepresentableValue] { get }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) -> DateDuration?
}
