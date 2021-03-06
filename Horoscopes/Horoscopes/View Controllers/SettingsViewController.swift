//
//  SettingsViewController.swift
//  Horoscopes
//
//  Created by Eric Davenport on 1/13/20.
//  Copyright © 2020 Eric Davenport. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
  
  @IBOutlet weak var nameTextField: UITextField!
  
  @IBOutlet weak var signPicker: UIPickerView!
  
  @IBOutlet weak var birthdayPicker: UIDatePicker!
  
  
  var signssss: [Signs] = [.Aries, .Taurus, .Gemini, .Cancer, .Leo, .Virgo, .Libra, .Scorpio, .Sagittarius, .Capricorn, .Aquarius, .Pisces]
  var selectedSign: Signs?
  var horoscope: Horoscope!
  var userName: String? 
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    nameTextField.delegate = self
    signPicker.delegate = self
    signPicker.dataSource = self
  }
  
  @IBAction func saveButtonPressed(_ sender: UIButton) {
    UserPreferences.shared.updateHoroscope(with: selectedSign ?? .Aries)
//    if nameTextField.text == nil {
//    UserPreferences.shared.updateUserName(with: nameTextField.text ?? "New User")
//    }
    dismiss(animated: true)

  }
  
}




extension SettingsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    1
  }
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    signssss.count
  }
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    
    return signssss[row].rawValue
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    selectedSign = signssss[row]
    //UserPreferences.shared.updateHoroscope(with: selectedSign!)
  }
}

extension SettingsViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    resignFirstResponder()
    userName = textField.text
    UserPreferences.shared.updateUserName(with: userName ?? "")
    return true
  }
}

