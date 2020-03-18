//
//  NewsService.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 18.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import Foundation
import Alamofire

protocol NewsServiceProtocols {
    func sendRequestNews(lastId:Int?, countNews:Int, completion: @escaping (NewsDataModel?, String?)-> Void)
}

class NewsService:APIService{
    
}

extension NewsService: NewsServiceProtocols{
    func sendRequestNews(lastId: Int?, countNews: Int, completion: @escaping (NewsDataModel?, String?) -> Void) {
        let url = "posts"
        var params:[String:AnyObject] = [:]
        if let id = lastId {
            params["last_id"] = id as AnyObject
        }
            params["qty"] = countNews as AnyObject
        self.sendRequest(requestType: .get, url: host + url, params: params, paramsEncoding: URLEncoding.queryString) { (data, connect, err) in
            if !connect{
                completion(nil, "Not networking")
            }
            
            if data != nil{
                let dataNews = try? JSONDecoder().decode(NewsDataModel.self, from: data!)
                if dataNews != nil{
                    completion(dataNews, nil)
                } else{
                    completion(nil, "Error response body")
                }
            }else{
                completion(nil, "Error request")
            }
        }
    }
    
    
}
