//
//  NewsViewPresenter.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 18.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import Foundation

class NewsViewPresenter {
    let viewController:NewsViewController
    init(view:NewsViewController) {
        self.viewController = view
    }
}

extension NewsViewPresenter: NewsViewPresenterProtocols{
    func presenterNews(response: NewsViewDataFlow.CreateFetchNews.Response) {
        let viewState:NewsViewDataFlow.CreateFetchNews.ViewControllerState
        switch response.response {
        case .success(let data):
            viewState = .success(data)
        case .failure(let err):
            viewState = .failure(err)
        }
        self.viewController.showResultNews(viewModel: NewsViewDataFlow.CreateFetchNews.ViewModel(viewState: viewState))
    }
    
    
}
