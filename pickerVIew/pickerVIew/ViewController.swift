//
//  ViewController.swift
//  pickerVIew
//
//  Created by Apple on 11/13/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
 
    @IBOutlet weak var countryField: UITextField!
    
    @IBOutlet weak var dateField: UITextField!
    
     var countryPicker: UIPickerView!
    
    var datePicker: UIDatePicker!
    
    let countryArray = ["India","United States", "United Kingdom","Canada","Australia","UAE","Russia","China"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       //coutnry picker
        countryPicker = UIPickerView()
        countryPicker.tag = 1
        countryPicker.delegate = self
        countryPicker.dataSource = self
        countryField.inputView = countryPicker
        countryField.text = countryArray.first
        
        
        //date picker
        datePicker = UIDatePicker()
        datePicker.tag = 100
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.addTarget(self, action: #selector(setDate(_:)), for: .valueChanged)
        datePicker.timeZone = TimeZone.current
        dateField.inputView = datePicker
    }
    
    @objc func setDate(_ sender: UIDatePicker) {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "MM/dd/yyyy"
        
        let selectedDate = dateformatter.string(from: sender.date)
        print("selectedDate: \(selectedDate)")
        
        if (sender.tag == 100) {
            dateField.text = selectedDate
        }
        //self.view.endEditing(true)
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
     }
     
     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countryArray.count
     }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countryArray[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView.tag == 1) {
            countryField.text = countryArray[row]
           // self.view.endEditing(true)
        }
    }

    @IBAction func onclickDone(_ sender: Any) {
        self.view.endEditing(true)
    }

}

