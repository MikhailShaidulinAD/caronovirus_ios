//
//  ProfilePresenter.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 18.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import Foundation

class ProfilePresenter{
    
    private let viewController:ProfileViewController
    required init(view:ProfileViewController) {
        self.viewController = view
    }
}

extension ProfilePresenter:ProfilePresenterProtocols{
    func presentUserInfo(response: ProfileDataFlow.FetchUserInfo.Response) {
        switch response.response {
        case .success(let data, let sickStatus):
            let viewState:ProfileDataFlow.FetchUserInfo.ViewControllerState
            viewState = .result(id: String(data.user.id), fullname: "\(data.user.name ?? "") \(data.user.surname ?? "")", age: String(data.user.age ?? 0), gender: data.user.gender ?? "", country: data.user.country_name ?? "", status: sickStatus)
            self.viewController.showUserInfo(viewModel: ProfileDataFlow.FetchUserInfo.ViewModel(viewState: viewState))
        }
    }
    
    func presentPicker(response: ProfileDataFlow.CreatePicker.Response) {
        switch response.response {
        case .success(let data):
            viewController.showPickerData(viewModel: ProfileDataFlow.CreatePicker.ViewModel(viewState: .result(data)))
        }
        
    }
    
}
