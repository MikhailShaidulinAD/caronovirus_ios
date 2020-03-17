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
    
    private func getMiddleCoordinates(north:String, west:String, south:String, east:String)->[Double]?{
        guard let northDouble = Double(north),
            let southDouble = Double(south),
            let westDouble = Double(west),
            let eastDouble = Double(east) else{
            return nil
        }
        let lat = (northDouble + southDouble) / 2.0
        let lon = (westDouble + eastDouble) / 2.0
        return [lat, lon]
        
    }
}

extension MainInteractor: MainInteractorProtocols{
    
    func fetchCountriesInfo(request: MainViewDataFlow.CountriesInfoCase.Request) {
        dataProvider.sendRequestCountries { (data, err) in
            let response:MainViewDataFlow.CountriesInfoCase.RequestResult
            if data != nil {
            var countiParse: CountryInfo = CountryInfo()
                data!.forEach{[unowned self](item) in
                    let coordinates = self.getMiddleCoordinates(north: item.north, west: item.west, south: item.south, east: item.east)
                countiParse.append(CountriesData(id: item.id, countryCode: item.countryCode, name: item.name, population: item.population, north: item.north, south: item.south, east: item.east, west: item.west, cases: item.cases, deaths: item.deaths, recovered: item.recovered, lat: coordinates?.first ?? nil, lon: coordinates?.last ?? nil))
                }
                response = .success(countiParse)
                self.presenter.presentCountriesInfo(response: MainViewDataFlow.CountriesInfoCase.Response(response: response))
            }else{
                response = .failure(err ?? "Error Response")
                self.presenter.presentCountriesInfo(response: MainViewDataFlow.CountriesInfoCase.Response(response: response))
            }
        }
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
