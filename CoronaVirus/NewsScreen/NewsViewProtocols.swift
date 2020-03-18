//
//  NewsViewProtocols.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 18.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import Foundation

protocol NewsViewPresenterProtocols {
    func presenterNews(response: NewsViewDataFlow.CreateFetchNews.Response)
}

protocol NewsViewInteractorProtocols {
    func fetchNews(request:NewsViewDataFlow.CreateFetchNews.Request)
}

protocol NewsViewControllerProtocols {
    func showResultNews(viewModel:NewsViewDataFlow.CreateFetchNews.ViewModel)
}

protocol NewsViewDataProviderProtocols {
    //API
    func sendUpdateRequestNews(lastId:Int?, countNews:Int, completion: @escaping (NewsDataModel?, String?)-> Void)
    
    //GETTER
    func getLastNewsID()->Int?
    func defaultSizeNewsRequest()->Int
    func getNewsData()->NewsDataModel?
    
    //SETTER
    func setLastNewsID(id:Int)
    func setNewsData(data:NewsDataModel)
}
