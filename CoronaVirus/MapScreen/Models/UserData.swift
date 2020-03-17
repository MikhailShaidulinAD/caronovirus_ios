//
//  UserData.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 18.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import Foundation

struct UserData: Codable {
    let device_id: String
    let country_id: Int
    let updated_at, created_at: String
    let id: Int
    let gender,avatar: String?
    let age: Int?
    let certificate_id:String?
    let country_name:String?
    let name, surname: String?
    let result:Int?
    let passed_test:Int?
}
