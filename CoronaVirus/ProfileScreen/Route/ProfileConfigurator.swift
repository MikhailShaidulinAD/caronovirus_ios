//
//  ProfileConfigurator.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 18.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import Foundation
class ProfileConfigurator:  DIAssembly {

    func configureModule(viewController: ProfileViewController) {
        let apiService = ProfileService()
        let dataStore = DIAssembly.instance().dataStoresList.profileDataStore
        let presenter = ProfilePresenter(view: viewController)
        let dataProvider = ProfileDataProvider(store: dataStore, service: apiService)
        let interactor = ProfileInteractor(data: dataProvider, presenter: presenter)
        let router = ProfileRoute(data: DIAssembly.instance().dataStoresList)
    
        viewController.interactor = interactor
        viewController.router = router
    }
    
}
