//
//  MainProtocols.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 13.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import Foundation

protocol MainInteractorProtocols {
    func fetchCountriesInfo(request:MainViewDataFlow.CountriesInfoCase.Request)
    func fetchTotalStatistic(request:MainViewDataFlow.CountriesTotalStatisticCase.Request)
    func sendResultTest(request:MainViewDataFlow.TestCase.Request)
}

protocol MainPresenterProtocols {
}

protocol MainDataProviderProtocols {
}
