//
//  ViewController.swift
//  Horoscopes
//
//  Created by Eric Davenport on 1/13/20.
//  Copyright © 2020 Eric Davenport. All rights reserved.
//

import UIKit

class MyHoriscopeViewController: UIViewController {
  
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var sunsignLabel: UILabel!
  @IBOutlet weak var horiscopeLabel: UITextView!
  @IBOutlet weak var moodLabel: UILabel!
  @IBOutlet weak var keywordsLabel: UILabel!
  @IBOutlet weak var intensityLabel: UILabel!
  @IBOutlet weak var creditLabel: UILabel!
  
  //var yourSign: Signs
  
  var horiscope: Horiscope! {
    didSet {
      DispatchQueue.main.async {
        self.updateUI()
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    loadHoriscope()
    // Do any additional setup after loading the view.
  }
  
  func updateUI() {
    dateLabel.text = horiscope.date
    sunsignLabel.text = horiscope.sunsign
    horiscopeLabel.text = horiscope.horoscope
    moodLabel.text = horiscope.meta.mood
    keywordsLabel.text = horiscope.meta.keywords.description
    intensityLabel.text = horiscope.meta.intensity
    creditLabel.text = horiscope.credit
  }
  
  
  func loadHoriscope() {
    HoriscopeAPIClient.getHoriscope(for: "gemini") { (result) in
      switch result {
      case .failure(let appError):
        print("\(appError)")
      case .success(let horiscope):
        self.horiscope = horiscope
      }
    }
  }
  
}

