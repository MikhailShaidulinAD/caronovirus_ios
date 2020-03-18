//
//  NewsViewInteractor.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 18.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import Foundation

class NewsViewInteractor {
    let dataProvider:NewsDataProvider
    let presenter:NewsViewPresenter
    init(data:NewsDataProvider, presenter:NewsViewPresenter) {
        self.dataProvider = data
        self.presenter = presenter
    }
}

extension NewsViewInteractor: NewsViewInteractorProtocols{
    func fetchNews(request: NewsViewDataFlow.CreateFetchNews.Request) {
        self.dataProvider.sendUpdateRequestNews(lastId: self.dataProvider.getLastNewsID(), countNews: self.dataProvider.defaultSizeNewsRequest()) { (data, err) in
            let response:NewsViewDataFlow.CreateFetchNews.RequestResult
            if data != nil{
                if var actualData = self.dataProvider.getNewsData(){
                    actualData.posts.append(contentsOf: data!.posts)
                    self.dataProvider.setNewsData(data: actualData)
                    response = .success(actualData)
                }else{
                    self.dataProvider.setNewsData(data: data!)
                    response = .success(data!)
                }
            }else{
                response = .failure(err ?? "Error response body")
            }
            self.presenter.presenterNews(response: NewsViewDataFlow.CreateFetchNews.Response(response: response))
        }
    }
    
    
}
