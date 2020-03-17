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
    }
    
    func fetchTotalStatistic(request: MainViewDataFlow.CountriesTotalStatisticCase.Request) {
        dataProvider.sendRequestStatistic { (data, err) in
            let response: MainViewDataFlow.CountriesTotalStatisticCase.RequestResult
            if data != nil{
                response = .success(data!)
            }else{
                response = .failure(err!)
            }
            self.presenter.presentTotalStatistic(response: MainViewDataFlow.CountriesTotalStatisticCase.Response(response: response))
        }
    }
    
    func sendResultTest(request: MainViewDataFlow.TestCase.Request) {
        switch request.request {
        case .positiveCount(let result):
            let id = dataProvider.getDeviceID()
            dataProvider.sendRequestTestResult(deviceID: id, positiveCount: result) { (data, err) in
                let response: MainViewDataFlow.TestCase.RequestResult
                if data != nil{
                    response = .success(data!)
                }else{
                    response = .failure(err!)
                }
                self.presenter.presentResultTest(response: MainViewDataFlow.TestCase.Response(response: response))
            }
        }
    }
    
    
}
