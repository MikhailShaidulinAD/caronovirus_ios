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
    func sendRequestUser(request:MainViewDataFlow.CreateUserCase.Request)
}

protocol MainPresenterProtocols {
    func presentCountriesInfo(response:MainViewDataFlow.CountriesInfoCase.Response)
    func presentTotalStatistic(response: MainViewDataFlow.CountriesTotalStatisticCase.Response)
    func presentResultTest(response: MainViewDataFlow.TestCase.Response)
    func presentUserInfo(response:MainViewDataFlow.CreateUserCase.Response)
}

protocol MainDataProviderProtocols {
    // API
    func sendRequestTestResult(deviceID:String, positiveCount:Int, completion: @escaping(TestResponseData?, String?)->Void)
    func sendRequestStatistic(completion: @escaping (TotalStatisticData?, String?)->Void)
    func sendRequestCountries(completion: @escaping (CountryInfo?, String?)->Void)
    func sendRequestCreateUser(deviceID:String, countryId:Int, completion: @escaping (UserData?, String?)->Void)
    func sendRequestGetUserInfo(deviceID:String, completion: @escaping (UserData?, String?)->Void )
    
    //GETTER
    func getDeviceID()->String
    func getUserInfo()->UserData?
    func getCountryId()->Int?
    func getCountriesInfo()->CountryInfo?
    
    //SETTER
    func setCountriesInfo(data:CountryInfo)
    func setUserInfo(user:UserData)
    func setCountryId(id:Int)
}

protocol MainViewControllerProtocols {
    func showCountiesInfo(viewState:MainViewDataFlow.CountriesInfoCase.ViewModel)
    func showTestResult(viewState:MainViewDataFlow.TestCase.ViewModel)
    func showFullStatistic(viewState:MainViewDataFlow.CountriesTotalStatisticCase.ViewModel)
}
