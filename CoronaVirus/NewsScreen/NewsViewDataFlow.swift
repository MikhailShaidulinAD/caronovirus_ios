//
//  NewsViewDataFlow.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 18.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import Foundation

enum NewsViewDataFlow{
    
    enum CreateFetchNews {
        struct Request {
        }
        struct Response {
            var response: NewsViewDataFlow.CreateFetchNews.RequestResult
        }
        
        struct ViewModel {
            var viewState: NewsViewDataFlow.CreateFetchNews.ViewControllerState
        }
        
        enum RequestResult {
            case success(NewsDataModel)
            case failure(String)
        }
        enum ViewControllerState {
            case success(NewsDataModel)
            case failure(String)
        }
    }
}
