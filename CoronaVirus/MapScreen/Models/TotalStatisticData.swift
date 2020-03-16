//
//  TotalStatisticData.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 17.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import Foundation
struct TotalStatisticData: Codable {
    let globals: Globals
}

// MARK: - Globals
struct Globals: Codable {
    let id, cases, deaths, recovered: Int
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id, cases, deaths, recovered
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
