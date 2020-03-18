//
//  MainDataProvider.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 13.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import Foundation
import AdSupport
import UIKit

class MainDataProvider {
    
    private let dataStore:MainStore
    private let apiService:MainService
    
    required init(store:MainStore, service:MainService) {
        self.dataStore = store
        self.apiService = service
    }
}

extension MainDataProvider: MainDataProviderProtocols{
    func setSickStatus(status: String) {
        dataStore.sickStatus = status
    }
    
    
    func getCountryId() -> Int? {
        return dataStore.country
    }
    
    func getCountriesInfo() -> CountryInfo? {
        return dataStore.countries
    }
    
    func setCountriesInfo(data: CountryInfo) {
        dataStore.countries = data
    }
    
    func setCountryId(id: Int) {
        dataStore.country = id
    }
    
    func getUserInfo() -> UserData? {
        return dataStore.userInfo
    }
    
    func setUserInfo(user: UserData) {
        self.dataStore.userInfo = user
    }
    
    func sendRequestCreateUser(deviceID: String, countryId: Int, completion: @escaping (UserData?, String?) -> Void) {
        self.apiService.createUser(deviceID: deviceID, countryId: countryId) { (data, err) in
            completion(data, err)
        }
    }
    
    func sendRequestGetUserInfo(deviceID: String, completion: @escaping (UserData?, String?) -> Void) {
        self.apiService.getUser(deviceID: deviceID) { (data, err) in
            completion(data, err)
        }
    }
    
    func getDeviceID() -> String {
        let deviceID:String
       if ASIdentifierManager.shared().isAdvertisingTrackingEnabled{
            print("true")
            deviceID = ASIdentifierManager.shared().advertisingIdentifier.uuidString
        } else{
            print("false")
            deviceID = UIDevice.current.identifierForVendor?.uuidString ?? ""
        }
        return deviceID
    }
    
    func sendRequestTestResult(deviceID: String, positiveCount: Int, completion: @escaping (TestResponseData?, String?) -> Void) {
        apiService.requestResultTest(deviceID: deviceID, positiveCount: positiveCount) { (data, err) in
            completion(data, err)
        }
    }
    
    func sendRequestStatistic(completion: @escaping (TotalStatisticData?, String?) -> Void) {
        apiService.requestTotalStatistic { (data, err) in
            completion(data, err)
        }
    }
    
    func sendRequestCountries(completion: @escaping (CountryInfo?, String?) -> Void) {
        apiService.requestCountries { (data, err) in
            completion(data, err)
        }
    }
    
    
}
