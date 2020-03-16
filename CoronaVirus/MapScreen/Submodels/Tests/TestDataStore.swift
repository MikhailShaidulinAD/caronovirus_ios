//
//  TestDataStore.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 13.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import Foundation
import UIKit

class TesDataStore: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    public var size: CGSize?
    public var data:[String]?
    
    
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width-32, height: collectionView.frame.height)
}

    
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return data?.count ?? 0
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TestsCell.self), for: indexPath) as! TestsCell
    cell.setupViews(questText: data?[indexPath.item] ?? "")
    return cell
}
}
