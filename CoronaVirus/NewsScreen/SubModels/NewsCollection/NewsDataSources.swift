//
//  NewsDataSources.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 18.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import UIKit

class NewsDataSources: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
    var data:NewsDataModel?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data?.posts.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
