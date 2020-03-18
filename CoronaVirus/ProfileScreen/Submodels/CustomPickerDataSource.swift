//
//  CustomPickerView.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 18.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import UIKit

class CustomPickerDataSource: NSObject, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    public var data:PickedModel?
    private var previewSelect:String?
    
    public func getDoneValue()->String?{
        if let doneValue = previewSelect{
            previewSelect = nil
            return doneValue
        }else{
            return data?.data.first ?? ""
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data?.data.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        previewSelect = data?.data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data?.data[row]
    }
    
}
