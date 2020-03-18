//
//  ProfileConfigurator.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 18.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import Foundation
class ProfileConfigurator:  DIAssembly {

    func configureModule(viewController: ViewController) {
        let apiService = MainService()
        let dataStore = DIAssembly.instance().dataStoresList.mainDataStore
        let presenter = MainPresenter(view: viewController)
        let dataProvider = MainDataProvider(store: dataStore, service: apiService)
        let interactor = MainInteractor(data: dataProvider, presenter: presenter)
        let router = MainRoute(data: DIAssembly.instance().dataStoresList)
    
        viewController.interactor = interactor
        viewController.router = router
    }
    
}
