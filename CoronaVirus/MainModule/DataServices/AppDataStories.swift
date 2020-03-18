//
//  AppDataStories.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 17.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import Foundation

class AppDataStories : APIService {
    var mainDataStore: MainStore = MainStore()
    var profileDataStore: ProfileStore = ProfileStore()
    var newsDataStore: NewsStore = NewsStore()
}
