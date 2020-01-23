//
//  ViewController.swift
//  Horoscopes
//
//  Created by Eric Davenport on 1/13/20.
//  Copyright © 2020 Eric Davenport. All rights reserved.
//

import UIKit

class MyHoroscopeViewController: UIViewController {
  
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var sunsignLabel: UILabel!
  @IBOutlet weak var horoscopeLabel: UITextView!
  @IBOutlet weak var moodLabel: UILabel!
  @IBOutlet weak var keywordsLabel: UILabel!
  @IBOutlet weak var intensityLabel: UILabel!
  @IBOutlet weak var creditLabel: UILabel!
  
  var userSign: Signs? {
    didSet {
      loadHoroscope()
    }
  }
  var userName: String?
  
  var horoscope: Horoscope! {
    didSet {
      DispatchQueue.main.async {
        self.updateUI()
        UserPreferences.shared.updateHoroscope(with: self.userSign!)

      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    loadHoroscope()
  }
  
  
  func updateUI() {
    
    if let sign = UserPreferences.shared.getHoroscope() {
      userSign = sign
    }
    
    
//    navigationItem.title = "\(userName)'s Daily Horoscope"
//    dateLabel.text = horoscope.date
    sunsignLabel.text = horoscope.sunsign
    horoscopeLabel.text = horoscope.horoscope
    moodLabel.text = horoscope.meta.mood
    keywordsLabel.text = horoscope.meta.keywords.description
    intensityLabel.text = horoscope.meta.intensity
    creditLabel.text = horoscope.credit
  }
  
  
  func loadHoroscope() {
    HoriscopeAPIClient.getHoroscope(for: userSign?.rawValue ?? "gemini") { (result) in
      switch result {
      case .failure(let appError):
        print("\(appError)")
      case .success(let horiscope):
        self.horoscope = horiscope
      }
    }
  }
  
}

