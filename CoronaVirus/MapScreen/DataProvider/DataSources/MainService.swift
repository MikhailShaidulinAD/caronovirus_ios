//
//  MainService.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 13.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import Foundation
import Alamofire

protocol MainServiceProtocols {
    func requestCountries(complemention: @escaping(CountryInfo?, String?)->Void )
    func requestTotalStatistic(completion: @escaping(TotalStatisticData?, String?)->Void)
    func requestResultTest(deviceID:String, positiveCount:Int, completion: @escaping (TestResponseData?, String?)->Void)
    func createUser(deviceID:String, countryId:Int, completion: @escaping (UserData?, String?)->Void)
    func getUser(deviceID:String, completion: @escaping (UserData?, String?)->Void )
}

class MainService: APIService {
}

extension MainService: MainServiceProtocols{
    func getUser(deviceID: String, completion: @escaping (UserData?, String?) -> Void) {
                let url = "user"
        let params:[String:Any] = ["device_id":deviceID]
        self.sendRequest(requestType: .get, url: host + url, params: params, paramsEncoding: JSONEncoding.default) { (data, connect, err) in
            if !connect{
                completion(nil, "Not networking")
            }
            
            if data != nil{
                let dataUser = try? JSONDecoder().decode(UserData.self, from: data!)
                if dataUser != nil{
                    completion(dataUser, nil)
                } else{
                    completion(nil, "Error response body")
                }
            }else{
                completion(nil, "Error request")
            }
        }
    }
    
    func createUser(deviceID: String, countryId: Int, completion: @escaping (UserData?, String?) -> Void) {
        let url = "login"
        let params:[String:Any] = ["device_id":deviceID, "country_id":countryId]
        self.sendRequest(requestType: .post, url: host + url, params: params, paramsEncoding: JSONEncoding.default) { (data, connect, err) in
            if !connect{
                completion(nil, "Not networking")
            }
            
            if data != nil{
                let dataUser = try? JSONDecoder().decode(UserData.self, from: data!)
                if dataUser != nil{
                    completion(dataUser, nil)
                } else{
                    completion(nil, "Error response body")
                }
            }else{
                completion(nil, "Error request")
            }
        }
    }
    
    func requestResultTest(deviceID: String, positiveCount: Int, completion: @escaping (TestResponseData?, String?) -> Void) {
        let url = "passed"
        let params:[String:Any] = ["device_id":deviceID, "positive":positiveCount]
        self.sendRequest(requestType: .post, url: host + url, params: params, paramsEncoding: JSONEncoding.default) { (data, connect, err) in
            if !connect{
                completion(nil, "Not networking")
            }
            
            if data != nil{
                let dataStatistic = try? JSONDecoder().decode(TestResponseData.self, from: data!)
                if dataStatistic != nil{
                    completion(dataStatistic, nil)
                } else{
                    completion(nil, "Error response body")
                }
            }else{
                completion(nil, "Error request")
            }
        }
    }
    
    func requestTotalStatistic(completion: @escaping (TotalStatisticData?, String?) -> Void) {
        let url = "globals"
        self.sendRequest(requestType: .get, url: host + url, params: nil, paramsEncoding: JSONEncoding.default) { (data, connect, err) in
            if !connect{
                completion(nil, "Not networking")
            }
            
            if data != nil{
                let dataStatistic = try? JSONDecoder().decode(TotalStatisticData.self, from: data!)
                if dataStatistic != nil{
                    completion(dataStatistic, nil)
                } else{
                    completion(nil, "Error response body")
                }
            }else{
                completion(nil, "Error request")
            }
        }
    }
    
    func requestCountries(complemention: @escaping (CountryInfo?, String?) -> Void) {
        let url = "countries"
        self.sendRequest(requestType: .get, url: host + url, params: nil, paramsEncoding: JSONEncoding.default) { (data, connect, err) in
            if !connect{
                complemention(nil, "Not networking")
            }
            
            if data != nil{
                let dataCountries = try? JSONDecoder().decode(CountryInfo.self, from: data!)
                if dataCountries != nil{
                    complemention(dataCountries, nil)
                } else{
                    complemention(nil, "Error response body")
                }
            }else{
                complemention(nil, "Error request")
            }
        }
    }
    
    
    
}
