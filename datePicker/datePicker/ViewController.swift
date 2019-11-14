//
//  ViewController.swift
//  datePicker
//
//  Created by Apple on 11/13/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textDate: UITextField!
    
    var datePicker : UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDate()
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(gesturerecoziner:))) //create gesture
        
        view.addGestureRecognizer(tapgesture) //add to main view
    }
    
    func setupDate() {
        datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.timeZone = TimeZone.current
        datePicker.addTarget(self, action: #selector(getDate(_sender:)), for: .valueChanged)
        textDate.inputView = datePicker
    }
    
    @objc func viewTapped(gesturerecoziner: UITapGestureRecognizer) {
        self.view.endEditing(true) //when click out of picker =>> endediting
    }
    
    @objc func getDate(_sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        let stringDate = formatter.string(from: _sender.date)
    //    view.endEditing(true)
        textDate.text = stringDate
    }


}

