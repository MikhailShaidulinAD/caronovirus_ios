//
//  ProfileDataProvider.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 18.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import Foundation

class ProfileDataProvider{
    private let dataStore:ProfileStore
    private let apiService:ProfileService
    
    required init(store:ProfileStore, service:ProfileService) {
        self.dataStore = store
        self.apiService = service
    }
}

extension ProfileDataProvider: ProfileDataProviderProtocols{
    func getSickStatus() -> String? {
        return dataStore.sickStatus
    }
    
    func getUserInfo() -> UserData? {
        return dataStore.user
    }
    
    func getCountryData() -> PickedModel {
        var countries:[String] = []
        if let countryData = dataStore.country{
            for item in countryData {
                countries.append(item.name)
            }
        }
        return PickedModel(type: .country, data: countries)
    }
    
    func getAgeData() -> PickedModel {
        var ages:[String] = []
        for item in 5..<110 {
            ages.append(String(item))
        }
        return PickedModel(type: .age, data: ages)
    }
    
    func getGenderData() -> PickedModel {
        return PickedModel(type: .gender, data: dataStore.gender)
    }
    
    
}
