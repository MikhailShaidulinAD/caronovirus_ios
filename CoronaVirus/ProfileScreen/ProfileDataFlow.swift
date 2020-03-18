//
//  ProfileDataFlow.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 18.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import Foundation

enum ProfileDataFlow{

    enum PickerType {
        struct Request {
            var request: ProfileDataFlow.PickerType.TypePicker
        }
        
        enum TypePicker {
            case age
            case gender
            case country
        }

    }
    
    enum FetchUserInfo {
        struct Request {
        }
        struct Response {
            var response:ProfileDataFlow.FetchUserInfo.RequestResult
        }
        
        struct ViewModel {
            var viewState: ProfileDataFlow.FetchUserInfo.ViewControllerState
        }
        
        enum ViewControllerState {
            case result(id:String, fullname:String, age:String, gender:String, country:String, status:String)
        }
        
        enum RequestResult {
            case success(UserData, String)
        }
        
    }
    
    enum CreatePicker {
        struct Request {
        }
        
        struct Response {
            var response:ProfileDataFlow.CreatePicker.RequestResult
        }
        
        struct ViewModel {
            var viewState: ProfileDataFlow.CreatePicker.ViewControllerState
        }
        
        enum ViewControllerState {
            case result(PickedModel)
        }
        
        enum RequestResult {
            case success(PickedModel)
        }
    }
}
