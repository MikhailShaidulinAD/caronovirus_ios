//
//  MainInteractor.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 13.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import Foundation

class MainInteractor {
    let dataProvider:MainDataProvider
    let presenter:MainPresenter
    
    required init(data:MainDataProvider, presenter:MainPresenter) {
        self.dataProvider = data
        self.presenter = presenter
    }
}

extension MainInteractor: MainInteractorProtocols{
    func fetchCountriesInfo(request: MainViewDataFlow.CountriesInfoCase.Request) {
        <#code#>
    }
    
    func fetchTotalStatistic(request: MainViewDataFlow.CountriesTotalStatisticCase.Request) {
        <#code#>
    }
    
    func sendResultTest(request: MainViewDataFlow.TestCase.Request) {
        <#code#>
    }
    
    
}
