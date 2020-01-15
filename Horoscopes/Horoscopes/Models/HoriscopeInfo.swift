//
//  HoriscopeInfo.swift
//  Horoscopes
//
//  Created by Eric Davenport on 1/13/20.
//  Copyright © 2020 Eric Davenport. All rights reserved.
//

import Foundation

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


