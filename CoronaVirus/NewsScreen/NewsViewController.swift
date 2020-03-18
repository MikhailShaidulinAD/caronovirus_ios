//
//  NewsViewController.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 16.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    let data = NewsDataSources()
    
    let loader: LoaderView = {
        let view = LoaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = 0
        return view
    }()
    
    lazy var collection:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .none
        view.dataSource = data
        view.delegate = data
        view.register(NewsCell.self, forCellWithReuseIdentifier: NewsCell().id)
        view.contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        return view
    }()
    
    var interactor:NewsViewInteractor?
    var router:NewsRouter?
    let configurator = NewsConfigurate()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        self.view.backgroundColor = .white
        configurator.configureModule(viewController: self)
        setupViews()
        createFetchRequestNews()
    }
    
    private func setupViews(){
        self.view.addSubview(collection)
        collection.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        collection.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -70).isActive = true
        collection.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        collection.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        data.delegate = self
        self.view.addSubview(loader)
        loader.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        loader.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        loader.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        loader.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
    }
    
    private func showAlertInformation(text: String){
        let alert = UIAlertController(title: "News", message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {(alert) in
        }))
        self.navigationController?.present(alert, animated: false, completion: nil)
    }

}

//MARK: - requests
extension NewsViewController{
    private func createFetchRequestNews(){
        loader.startLoading()
        self.interactor?.fetchNews(request: NewsViewDataFlow.CreateFetchNews.Request())
    }
}

extension NewsViewController: NewsViewControllerProtocols{
    func showResultNews(viewModel: NewsViewDataFlow.CreateFetchNews.ViewModel) {
        loader.stopLoading()
        switch viewModel.viewState {
        case .success(let data):
            self.data.data = data
            collection.reloadData()
        case .failure(let err):
            showAlertInformation(text: err)
        }
    }
}

extension NewsViewController: NewsDataSourcesProtocols{
    func updateLoading() {
        self.loader.startLoading()
        createFetchRequestNews()
    }
    
    func openOutsideUrl(url: String) {
        if let urlAuthor = URL(string: url) {
            UIApplication.shared.open(urlAuthor)
        }
    }
}
