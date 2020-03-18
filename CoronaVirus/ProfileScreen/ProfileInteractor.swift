//
//  ProfileInteractor.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 18.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import Foundation

class ProfileInteractor{
    let dataProvider:ProfileDataProvider
    let presenter:ProfilePresenter
    
    required init(data:ProfileDataProvider, presenter:ProfilePresenter) {
        self.dataProvider = data
        self.presenter = presenter
    }
}

extension ProfileInteractor: ProfileInteractorProtocols{
    func fetchUserInfo(request: ProfileDataFlow.FetchUserInfo.Request) {
        if let userInfo = dataProvider.getUserInfo(){
            let response:ProfileDataFlow.FetchUserInfo.RequestResult
            let statusSick:String
            if userInfo.user.result != nil{
                if userInfo.user.result == 0 {
                    statusSick = "NOT SICK"
                }else{
                    statusSick = "SICK"
                }
            }else{
                statusSick = dataProvider.getSickStatus() ?? "NOT SICK"
            }
            response = .success(userInfo, statusSick)
            presenter.presentUserInfo(response: ProfileDataFlow.FetchUserInfo.Response(response: response))
        }
    }
    
    func fetchPrickerAge(request: ProfileDataFlow.CreatePicker.Request) {
        let ageData = self.dataProvider.getAgeData()
        presenter.presentPicker(response: ProfileDataFlow.CreatePicker.Response(response: .success(ageData)))
    }
    
    func fetchPrickerCountry(request: ProfileDataFlow.CreatePicker.Request) {
        let countryData = self.dataProvider.getCountryData()
        presenter.presentPicker(response: ProfileDataFlow.CreatePicker.Response(response: .success(countryData)))
    }
    
    func fetchPrickerGender(request: ProfileDataFlow.CreatePicker.Request) {
        let genderData = self.dataProvider.getGenderData()
        presenter.presentPicker(response: ProfileDataFlow.CreatePicker.Response(response: .success(genderData)))
    }
    
    
}
