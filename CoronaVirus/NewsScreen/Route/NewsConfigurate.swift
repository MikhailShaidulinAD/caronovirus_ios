//
//  NewsConfigurate.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 18.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import Foundation

class NewsConfigurate: DIAssembly {

    func configureModule(viewController: NewsViewController) {
        let apiService = NewsService()
        let dataStore = DIAssembly.instance().dataStoresList.newsDataStore
        let presenter = NewsViewPresenter(view: viewController)
        let dataProvider = NewsDataProvider(store: dataStore, service: apiService)
        let interactor = NewsViewInteractor(data: dataProvider, presenter: presenter)
        let router = NewsRouter(data: DIAssembly.instance().dataStoresList)
    
        viewController.interactor = interactor
        viewController.router = router
    }
    
}
