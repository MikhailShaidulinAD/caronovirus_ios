//
//  CountriesData.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 17.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import Foundation

struct CountriesData: Codable {
    let id: Int
    let countryCode, name, population, north: String
    let south, east, west: String
    let cases, deaths, recovered: Int
}

typealias UserInfo = [CountriesData]
