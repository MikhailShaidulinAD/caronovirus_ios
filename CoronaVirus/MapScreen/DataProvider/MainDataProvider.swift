//
//  MainDataProvider.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 13.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import Foundation

class MainDataProvider {
    
    private let dataStore:MainStore
    private let apiService:MainService
    
    required init(store:MainStore, service:MainService) {
        self.dataStore = store
        self.apiService = service
    }
}

extension MainDataProvider: MainDataProviderProtocols{
    func getDeviceID() -> String {
        return dataStore.deviceID ?? ""
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
    
    func sendRequestCountries(completion: @escaping (CountriesData?, String?) -> Void) {
        apiService.requestCountries { (data, err) in
            completion(data, err)
        }
    }
    
    
}
