//
//  MainPresenter.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 13.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import Foundation

class MainPresenter {
    
    private let viewController:ViewController
    required init(view:ViewController) {
        self.viewController = view
    }
    
}

extension MainPresenter: MainPresenterProtocols{
    func presentUserInfo(response: MainViewDataFlow.CreateUserCase.Response) {
        let viewState:MainViewDataFlow.CreateUserCase.ViewControllerState
        switch response.response {
        case .success:
            viewState = .success
            self.viewController.completeUserInfo(viewState: MainViewDataFlow.CreateUserCase.ViewModel(viewState: viewState))
        case .failure(let err):
            viewState = .failure(err: err)
        }
    }
    
    func presentCountriesInfo(response: MainViewDataFlow.CountriesInfoCase.Response) {
        let viewState: MainViewDataFlow.CountriesInfoCase.ViewControllerState
        switch response.response {
        case .success(let countryData):
            viewState = .success(countriesItems: countryData)
        case .failure(let err):
            viewState = .failure(err)
        }
        self.viewController.showCountiesInfo(viewState: MainViewDataFlow.CountriesInfoCase.ViewModel(result: viewState))
    }
    
    func presentTotalStatistic(response: MainViewDataFlow.CountriesTotalStatisticCase.Response) {
        let viewState: MainViewDataFlow.CountriesTotalStatisticCase.ViewControllerState
        switch response.response {
        case .success(let data):
            viewState = .success(infected: String(data.globals.cases), deceased: String(data.globals.deaths), recovered: String(data.globals.recovered))
            
        case .failure(let err):
            viewState = .failure(err: err)
        }
        self.viewController.showFullStatistic(viewState: MainViewDataFlow.CountriesTotalStatisticCase.ViewModel(result: viewState))
    }
    
    func presentResultTest(response: MainViewDataFlow.TestCase.Response) {
        let viewState: MainViewDataFlow.TestCase.ViewControllerState
        switch response.response {
        case .success(let data):
            viewState = .success(data.sick)
        case .failure(let err):
            viewState = .failure(err: err)
        }
        self.viewController.showTestResult(viewState: MainViewDataFlow.TestCase.ViewModel(result: viewState))
    }
    
    
}
