//
//  MainInteractor.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 13.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import Foundation
import CoreLocation
class MainInteractor {
    let dataProvider:MainDataProvider
    let presenter:MainPresenter
    var location: LocationManager?
    
    required init(data:MainDataProvider, presenter:MainPresenter) {
        self.dataProvider = data
        self.presenter = presenter
        var locationStatus = MainViewDataFlow.CheckLocationAccessCase.Request()
        locationStatus.status = CLLocationManager.authorizationStatus().rawValue
        switch locationStatus.status {
        case 3:
            if location == nil {
                location = LocationManager()
                location?.startUpdating()
            }
        case 4:
            if location == nil {
                location = LocationManager()
                location?.startUpdating()
            }
        case .none:
            break
        case .some(_):
            break
        }
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
    
    private func detectionCountryName(completion: @escaping(String?)->Void){
        let geo = CLGeocoder()
        let locationCountry = CLLocation(latitude: location?.lat ?? 0.0, longitude: location?.long ?? 0.0)
        geo.reverseGeocodeLocation(locationCountry) { (place, err) in
            if let correctPlace = place{
                let country = correctPlace.first?.country
                print(correctPlace.first?.country)
                completion(country)
            }else{
                completion(nil)
            }
        }
    }
}

extension MainInteractor: MainInteractorProtocols{
    func sendRequestUser(request: MainViewDataFlow.CreateUserCase.Request) {
        if dataProvider.getUserInfo() == nil {
            let countryId = dataProvider.getCountryId()
            if  countryId == nil && dataProvider.getCountriesInfo() != nil {
                detectionCountryName { (country) in
                    if country != nil {
                        if self.dataProvider.getCountryId() == nil {
                            let countries = self.dataProvider.getCountriesInfo()
                            countries?.forEach{[unowned self] (item) in
                                if item.name == country {
                                    self.dataProvider.setCountryId(id: item.id)
                                }
                            }
                        }
                        self.dataProvider.sendRequestCreateUser(deviceID: self.dataProvider.getDeviceID(), countryId: self.dataProvider.getCountryId() ?? 233) { (data, err) in
                            let response:MainViewDataFlow.CreateUserCase.RequestResult
                            if data != nil{
                                response = .success
                            }else{
                                response = .failure(err ?? "Unkown Error")
                            }
                            self.presenter.presentUserInfo(response: MainViewDataFlow.CreateUserCase.Response(response: response))
                        }
                    }
                }
            }

        }
    }
    
    
    func fetchCountriesInfo(request: MainViewDataFlow.CountriesInfoCase.Request) {
        dataProvider.sendRequestCountries { (data, err) in
            let response:MainViewDataFlow.CountriesInfoCase.RequestResult
            if data != nil {
            var countiParse: CountryInfo = CountryInfo()
                data!.forEach{[unowned self](item) in
                    let coordinates = self.getMiddleCoordinates(north: item.north, west: item.west, south: item.south, east: item.east)
                countiParse.append(CountriesData(id: item.id, countryCode: item.countryCode, name: item.name, population: item.population, north: item.north, south: item.south, east: item.east, west: item.west, cases: item.cases, deaths: item.deaths, recovered: item.recovered, lat: coordinates?.first ?? nil, lon: coordinates?.last ?? nil))
                }
                self.dataProvider.setCountriesInfo(data: countiParse)
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
