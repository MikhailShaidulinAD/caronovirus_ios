//
//  MainRoute.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 17.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import Foundation

protocol MainRouteProtocols {
    func routeCountriesInfo()
    func routeUserInfo()
    func routeSickStatus()
}

class MainRoute {
    private let dataStoreList:AppDataStories
    required init(data:AppDataStories) {
        self.dataStoreList = data
    }
}

extension MainRoute: MainRouteProtocols{
    func routeSickStatus() {
        self.dataStoreList.profileDataStore.sickStatus = self.dataStoreList.mainDataStore.sickStatus
    }
    
    func routeUserInfo() {
        self.dataStoreList.profileDataStore.user = self.dataStoreList.mainDataStore.userInfo
    }
    
    func routeCountriesInfo() {
        self.dataStoreList.profileDataStore.country = self.dataStoreList.mainDataStore.countries
    }
    
    
}
