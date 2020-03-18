//
//  NewsDataProvider.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 18.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import Foundation

class NewsDataProvider{
    
    let dataStore:NewsStore
    let apiService:NewsService
    
    init(store:NewsStore, service: NewsService) {
        self.dataStore = store
        self.apiService = service
    }
    
}

extension NewsDataProvider: NewsViewDataProviderProtocols{
    func getNewsData() -> NewsDataModel? {
        return dataStore.newsData
    }
    
    func setNewsData(data: NewsDataModel) {
        dataStore.newsData = data
    }
    
    func defaultSizeNewsRequest() -> Int {
        return dataStore.newsSize
    }
    
    func getLastNewsID() -> Int? {
        return dataStore.lastId
    }
    
    func setLastNewsID(id: Int) {
        dataStore.lastId = id
    }
    
    func sendUpdateRequestNews(lastId: Int?, countNews: Int, completion: @escaping (NewsDataModel?, String?) -> Void) {
        self.apiService.sendRequestNews(lastId: lastId, countNews: countNews) { (data, err) in
            completion(data, err)
        }
    }
    
    
}
