//
//  UserData.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 18.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import Foundation

struct UserData: Decodable {
    let user:User
}

struct User: Decodable {
    let id: Int
    let device_id: String
    let passed_test:Int?
    let country_id: Int
    let result:Int?
    let updated_at: String
    let created_at: String
    let name:String?
    let surname: String?
    let certificate_id:String?
    let country_name:String?
    let age: Int?
    let avatar: String?
    let gender:String?
}
