//
//  ViewController.swift
//  pickerView
//
//  Created by Apple on 11/13/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {


    @IBOutlet weak var lblResult: UILabel!
    
    @IBOutlet weak var pickerVIew: UIPickerView!
    
    
    let arrayPick = ["Nguyen bao Nam", "Huynh Tuan Long", "Luu manh Hai", "Ngo Quang Loc", "Le Tan Phong", "Nguyen Phuc Dat"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerVIew.delegate = self
        pickerVIew.dataSource = self
        
        
        let geture = UIGestureRecognizer(target: self, action: #selector(onClickOutpicker))
        self.view.addGestureRecognizer(geture)
    }
    
    
    @objc func onClickOutpicker() {
        self.view.endEditing(true)
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayPick.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayPick[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblResult.text = arrayPick[row]
    }
}
