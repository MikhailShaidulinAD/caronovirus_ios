//
//  ProfileProtocols.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 18.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import Foundation

protocol ProfileInteractorProtocols {
    func fetchPrickerAge(request: ProfileDataFlow.CreatePicker.Request)
    func fetchPrickerCountry(request: ProfileDataFlow.CreatePicker.Request)
    func fetchPrickerGender(request: ProfileDataFlow.CreatePicker.Request)
    func fetchUserInfo(request:ProfileDataFlow.FetchUserInfo.Request)
    func fetchUpdateUserData(request: ProfileDataFlow.CreateChangeUserInfo.Request)
}

protocol ProfilePresenterProtocols {
    func presentPicker(response:ProfileDataFlow.CreatePicker.Response)
    func presentUserInfo(response:ProfileDataFlow.FetchUserInfo.Response)
    func presentNewUserData(response: ProfileDataFlow.CreateChangeUserInfo.Response)
}

protocol ProfileViewProtocols {
    func showPickerData(viewModel:ProfileDataFlow.CreatePicker.ViewModel)
    func showUserInfo(viewModel:ProfileDataFlow.FetchUserInfo.ViewModel)
    func showResultChangesUser(viewModel:ProfileDataFlow.CreateChangeUserInfo.ViewModel)
}

protocol ProfileDataProviderProtocols {
    //GETTER
    func getCountryData()->PickedModel
    func getAgeData()->PickedModel
    func getGenderData()->PickedModel
    func getUserInfo()->UserData?
    func getSickStatus()->String?
    func getDeviceID()->String
    
    //SETTER
    func setUserInfo(user:UserData)
    
    //API
    func requestChangeUser(newData: UserRequestModel, completion: @escaping(UserData?, String?)->Void)
}
