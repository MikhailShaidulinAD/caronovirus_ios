//
//  ProfileService.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 18.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import Foundation
import Alamofire
protocol ProfileServiceProtocols {
    func requestChangeUserInfo(request:UserRequestModel, completion: @escaping(UserData?, String?)->Void)
}

class ProfileService:APIService {
}

extension ProfileService: ProfileServiceProtocols{
    func requestChangeUserInfo(request: UserRequestModel, completion: @escaping (UserData?, String?) -> Void) {
        let url = "certificate"
        var params:[String:AnyObject] = [:]
        if let name = request.name {
            params["name"] = name as AnyObject
        }
        if let surname = request.surname{
            params["surname"] = surname as AnyObject
        }
        if let age = request.age {
            params["age"] = age as AnyObject
        }
        if let gender = request.gender{
            params["gender"] = gender as AnyObject
        }
        if let country_name = request.country_name {
            params["country_name"] = country_name as AnyObject
        }
          params["device_id"] = request.device_id as AnyObject
        
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
    
    
}
