//
//  NewsViewController.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 16.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    let collection:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .none
        view.dataSource = data
        view.delegate = data
        view.register(TestsCell.self, forCellWithReuseIdentifier: TestsCell().id)
        view.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupViews(){
        
    }

}
