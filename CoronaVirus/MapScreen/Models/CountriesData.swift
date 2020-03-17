//
//  CountriesData.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 17.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import Foundation

struct CountriesData: Decodable {
    let id: Int
    let countryCode, name, population, north: String
    let south, east, west: String
    let cases, deaths, recovered: Int
    var lat, lon:Double?
}

typealias CountryInfo = [CountriesData]
