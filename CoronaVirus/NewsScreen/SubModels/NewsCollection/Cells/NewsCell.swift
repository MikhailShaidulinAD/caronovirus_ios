//
//  NewsCell.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 18.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import UIKit

class NewsCell: UICollectionViewCell {
    let id = "NewsCell"
    
    let viewBackground:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        return view
    }()
    
    let titleNews:UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .black
        view.numberOfLines = 0
        view.font = UIFont(name: "EuclidFlex-Bold", size: 16)
        return view
    }()
    
    let authorNews:UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = UIColor(red: 255/255, green: 165/255, blue: 0/255, alpha: 1)
        view.font = UIFont(name: "EuclidFlex-Regular", size: 8)
        return view
    }()
    
    let dateNews:UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .black
        view.font = UIFont(name: "EuclidFlex-Regular", size: 8)
        return view
    }()
    
    let descriptionNews:UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .black
        view.font = UIFont(name: "EuclidFlex-Regular", size: 14)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        self.addSubview(viewBackground)
        viewBackground.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        viewBackground.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        viewBackground.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        viewBackground.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        viewBackground.addDarkShadow()
        self.viewBackground.addSubview(titleNews)
        self.titleNews.topAnchor.constraint(equalTo: self.viewBackground.topAnchor, constant: 16).isActive = true
        self.titleNews.leftAnchor.constraint(equalTo: self.viewBackground.leftAnchor, constant: 8).isActive = true
        self.titleNews.rightAnchor.constraint(equalTo: self.viewBackground.rightAnchor, constant: -8).isActive = true
        self.viewBackground.addSubview(authorNews)
        self.authorNews.topAnchor.constraint(equalTo: self.titleNews.bottomAnchor, constant: 6).isActive = true
        self.authorNews.leftAnchor.constraint(equalTo: self.viewBackground.leftAnchor, constant: 16).isActive = true
        self.viewBackground.addSubview(dateNews)
        self.dateNews.topAnchor.constraint(equalTo: self.authorNews.topAnchor, constant: 0).isActive = true
        self.dateNews.leftAnchor.constraint(equalTo: self.authorNews.rightAnchor, constant: 10).isActive = true
        self.dateNews.rightAnchor.constraint(equalTo: self.viewBackground.rightAnchor, constant: -4).isActive = true
        self.viewBackground.addSubview(descriptionNews)
        self.descriptionNews.topAnchor.constraint(equalTo: self.authorNews.bottomAnchor, constant: 8).isActive = true
        self.descriptionNews.leftAnchor.constraint(equalTo: self.viewBackground.leftAnchor, constant: 8).isActive = true
        self.descriptionNews.rightAnchor.constraint(equalTo: self.viewBackground.rightAnchor, constant: -8).isActive = true
        self.descriptionNews.bottomAnchor.constraint(equalTo: self.viewBackground.bottomAnchor, constant: -8).isActive = true
    }
    
    func setTitle(title:String?){
        titleNews.text = title
    }
    
    func setDescription(description:String?){
        descriptionNews.text = description
    }
    
    func setDate(date:String?){
        dateNews.text = date
    }
    
    func setAuthor(author:String?){
        authorNews.text = author
    }
}
