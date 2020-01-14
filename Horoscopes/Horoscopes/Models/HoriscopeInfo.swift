//
//  HoriscopeInfo.swift
//  Horoscopes
//
//  Created by Eric Davenport on 1/13/20.
//  Copyright © 2020 Eric Davenport. All rights reserved.
//

import Foundation

class Signs {
  let Aries: String = "aries"
  let Taurus: String = "taurus"
  let Gemini: String = "gemini"
  let Cancer: String = "cancer"
  let Leo: String = "leo"
  let Virgo: String = "virgo"
  let Libra: String = "libra"
  let Scorpio: String = "scorpio"
  let Sagittarius: String = "sagittarius"
  let Capricorn: String = "capricorn"
  let Aquarius: String = "aquarius"
  let Pisces: String = "pisces"
}

struct Horoscope: Codable {
  let sunsign: String
  let credit: String
  let date: String
  let horoscope: String
  let meta: Meta
}

struct Meta: Codable {
  let mood: String
  let keywords: String
  let intensity: String
}

extension Signs {
//  func 
}
