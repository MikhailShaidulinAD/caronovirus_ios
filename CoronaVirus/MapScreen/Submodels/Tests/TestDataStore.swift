//
//  TestDataStore.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 13.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import Foundation
import UIKit

protocol TestDataStoreProtocols {
    func requestResultTest(positive:Int)
    func scrollToNext(index:IndexPath)
}

class TesDataStore: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    public var size: CGSize?
    public var data:[String]?
    public var delegate:TestDataStoreProtocols?
    private var countPositiveAnswers: Int = 0
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
    
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width-32, height: collectionView.frame.height)
}

    
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return data?.count ?? 0
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TestsCell.self), for: indexPath) as! TestsCell
    cell.setupViews(questText: data?[indexPath.item] ?? "")
    cell.delegate = self
    cell.index = indexPath
    return cell
}
}

extension TesDataStore: TestCellProtocols{
    
    func nextCell(isPositive: Bool, index:IndexPath) {
        if isPositive {
            countPositiveAnswers += 1
        }
        print(index.row)
        if index.row + 1 < data?.count ?? 0{
            self.delegate?.scrollToNext(index: IndexPath(row: index.row + 1, section: index.section))
        }else{
            self.delegate?.requestResultTest(positive: countPositiveAnswers)
            countPositiveAnswers = 0
        }
        
    }
    
}
