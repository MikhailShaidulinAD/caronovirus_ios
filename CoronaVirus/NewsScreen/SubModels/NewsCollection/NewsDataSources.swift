//
//  NewsDataSources.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 18.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import UIKit

protocol NewsDataSourcesProtocols {
    func openOutsideUrl(url:String)
    func updateLoading()
}

class NewsDataSources: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
    var data:NewsDataModel?
    var delegate:NewsDataSourcesProtocols?
    var isLoading = false
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data?.posts.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 32, height: collectionView.frame.width * 0.4)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: NewsCell.self), for: indexPath) as! NewsCell
        cell.setTitle(title: data?.posts[indexPath.item].title)
        cell.setAuthor(author: data?.posts[indexPath.item].author)
        cell.setDate(date: data?.posts[indexPath.item].created_at)
        cell.setDescription(description: data?.posts[indexPath.item].desc)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.openOutsideUrl(url: data?.posts[indexPath.item].link ?? "")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offsetY > contentHeight - scrollView.frame.height && data?.count ?? 0 > data?.posts.count ?? 0 && !isLoading{
            delegate?.updateLoading()
        }
    }
}
