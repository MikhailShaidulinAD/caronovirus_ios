//
//  ApiService.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 17.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import Foundation
import Alamofire

typealias RequestJsonCompletion = (_ results:Data?, _ isConnection: Bool, _ error: Error?) -> Void
struct APIManager {
    static let sharedManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        return SessionManager(configuration: configuration)
    }()
}

class APIService {
    
    internal let host = "http://194-67-105-70.cloudvps.regruhosting.ru/api/"
    internal let hostPics = "http://client.leyka-api-dev.delaweb.ru/pics/"
    
    internal func sendRequest(requestType: HTTPMethod, url:String, params:[String: Any]?, paramsEncoding: ParameterEncoding, completion:@escaping RequestJsonCompletion) {
        
        var headers = HTTPHeaders()
        headers["Content-Type"] = "application/json"
        headers["X-Device-Type"] = "IOS"
        headers["Accept"] = "application/json;charset=UTF-8"
        print(headers)
        print("JSON - Params:\n\(String(describing: params ?? nil))")
        APIManager.sharedManager.request(url as URLConvertible, method: requestType, parameters: params, encoding: paramsEncoding, headers: headers).responseJSON { (dataResponse) in
            debugPrint(dataResponse)
            switch dataResponse.result {
            case .success(let json):
                print(json)
                let data = try? JSONSerialization.data(withJSONObject: json)
                //let json = try? JSONSerialization.jsonObject(with: data)
                completion(data, true, nil)
            case .failure(let error):
                
                completion(nil, true, error)
            }
            
        }
    }
}
