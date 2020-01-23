//
//  UserPreferences.swift
//  Horoscopes
//
//  Created by Eric Davenport on 1/14/20.
//  Copyright © 2020 Eric Davenport. All rights reserved.
//

import Foundation
import UIKit

//typealias Signs = String

enum Signs: String {
  case Aries = "aries"
  case Taurus = "taurus"
  case Gemini = "gemini"
  case Cancer = "cancer"
  case Leo = "leo"
  case Virgo = "virgo"
  case Libra = "libra"
  case Scorpio = "scorpio"
  case Sagittarius = "sagittarius"
  case Capricorn = "capricorn"
  case Aquarius = "aquarius"
  case Pisces = "pisces"
}

struct UserPreferenceKey {
  static let horoscopeString = "Horoscope"
  static let userName = "Default"
}

class UserPreferences {
  
  private init() { }
  
  static let shared = UserPreferences()
  
  // storing horoscope
  func updateHoroscope(with sign: Signs) {
    UserDefaults.standard.set(sign.rawValue, forKey: UserPreferenceKey.horoscopeString)
  }
  // retrieve horoscope
  func getHoroscope() -> Signs? {
    guard let sign = UserDefaults.standard.object(forKey: UserPreferenceKey.horoscopeString) as? String else {
      return nil
    }
    return Signs(rawValue: sign)
  }
}
