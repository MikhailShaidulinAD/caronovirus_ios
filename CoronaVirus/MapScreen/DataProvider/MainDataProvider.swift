//
//  MainDataProvider.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 13.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import Foundation

class MainDataProvider {
    
    let dataStore:MainStore
    let apiService:MainService
    
    required init(store:MainStore, service:MainService) {
        self.dataStore = store
        self.apiService = service
    }
}
