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
  
  var signs: [String] = ["Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn","Aquarius", "Pisces" ]
  var selectedSign: String = ""
  var horoscope: Horoscope!
//  var signOne: Signs!
  
  override func viewDidLoad() {
        super.viewDidLoad()

    
    signPicker.delegate = self
    signPicker.dataSource = self
    }
    
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //stringToHoroscope()
    
    guard let horoscopeVC = segue.destination as? MyHoroscopeViewController else {
      return
    }
    
    horoscopeVC.userSign = selectedSign.lowercased()
  }
  
  @IBAction func saveSettings(_ sender: UIBarButtonItem) {
    //stringToHoroscope()
  }
  func stringToHoroscope() {
    HoriscopeAPIClient.getHoroscope(for: selectedSign.lowercased()) { (result) in
      switch result {
      case .failure(let appError):
        print("\(appError)")
      case .success(let horiscope):
        self.horoscope = horiscope
      }
    }
    
    
    }
  }
    


extension SettingsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    1
  }
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    signs.count
  }
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    
    return signs[row]
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    selectedSign = signs[row]
  }
}
