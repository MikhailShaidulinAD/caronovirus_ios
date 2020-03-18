//
//  MainDataFlow.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 13.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import Foundation

enum MainViewDataFlow{
    enum CountriesInfoCase{
        
        struct Request {
        }
        
        struct Response {
            var response: MainViewDataFlow.CountriesInfoCase.RequestResult
        }
        
        struct ViewModel {
            var result: MainViewDataFlow.CountriesInfoCase.ViewControllerState
        }
        
        enum RequestResult {
            case success(CountryInfo)
            case failure(String)
        }
        
        enum ViewControllerState {
            case success(countriesItems:CountryInfo)
            case failure(String)
        }
    }
    
    enum CountriesTotalStatisticCase {
        struct Request {
        }
        
        struct Response {
            var response: MainViewDataFlow.CountriesTotalStatisticCase.RequestResult
        }
        
        struct ViewModel {
            var result:MainViewDataFlow.CountriesTotalStatisticCase.ViewControllerState
        }
        
        enum RequestResult {
            case success(TotalStatisticData)
            case failure(String)
        }
        
        enum ViewControllerState {
            case success(infected:String, deceased:String, recovered:String)
            case failure(err:String)
        }
    }
    
    enum TestCase {
            struct Request {
                var request: MainViewDataFlow.TestCase.RequestBody
            }
            
            struct Response {
                var response: MainViewDataFlow.TestCase.RequestResult
            }
            
            struct ViewModel {
                var result:MainViewDataFlow.TestCase.ViewControllerState
            }
        
        enum RequestBody {
            case positiveCount(Int)
        }
            
            enum RequestResult {
                case success(TestResponseData)
                case failure(String)
            }
            
            enum ViewControllerState {
                case success(Bool)
                case failure(err:String)
            }
    }
    
    //MARK: - Location
    enum RequireLocation {
        struct Request {}
    }
    
    //MARK: - Create User
    enum CreateUserCase {
        struct Request {}
        
        struct Response {
            var response: MainViewDataFlow.CreateUserCase.RequestResult
        }
        
        struct ViewModel {
            var viewState: MainViewDataFlow.CreateUserCase.ViewControllerState
        }
        
        enum RequestResult {
            case success
            case failure(String)
        }
        enum ViewControllerState {
            case success
            case failure(err:String)
        }
    }
    
    //MARK: - CheckLocationAccessCase
    enum CheckLocationAccessCase{
        struct Request {
            var isAccess: Bool?
            var status: Int32?
        }
        
        struct Response {
            var result: MainViewDataFlow.CheckLocationAccessCase.RequestResult
        }
        
        struct ViewModel {
            var state: MainViewDataFlow.CheckLocationAccessCase.ViewControllerState
        }
        
        enum ViewControllerState {
            case result
            case needLocation
        }
        
        enum RequestResult {
            case success
            case failure
        }
    }
}


