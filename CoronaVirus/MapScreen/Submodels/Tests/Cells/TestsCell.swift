//
//  TestsCell.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 13.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import Foundation
import UIKit
class TestsCell: UICollectionViewCell {
    
    public let id = "TestsCell"
    
    let quest:UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "sourcesanspro_bold", size: 18)
        return view
    }()
    
    let btnYes:UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("YES", for: .normal)
        view.titleLabel?.font = UIFont(name: "sourcesanspro_bold", size: 18)
        view.titleLabel?.textColor = .white
        view.layer.cornerRadius = 5
        view.backgroundColor = UIColor(red: 255/255, green: 165/255, blue: 0/255, alpha: 1)
        return view
    }()
    
    let btnNo:UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("NO", for: .normal)
        view.titleLabel?.font = UIFont(name: "sourcesanspro_bold", size: 18)
        view.titleLabel?.textColor = .white
        view.layer.cornerRadius = 5
        view.backgroundColor = UIColor(red: 255/255, green: 165/255, blue: 0/255, alpha: 1)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addDarkShadow()
        layer.cornerRadius = 10
    }
    
    func setupViews(questText:String) {
        self.addSubview(quest)
        quest.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        quest.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        quest.text = questText
        self.addSubview(btnYes)
        self.btnYes.topAnchor.constraint(equalTo: self.quest.bottomAnchor, constant: 24).isActive = true
        self.btnYes.rightAnchor.constraint(equalTo: self.centerXAnchor, constant: -36).isActive = true
        self.btnYes.widthAnchor.constraint(equalToConstant: 73).isActive = true
        self.btnYes.heightAnchor.constraint(equalToConstant: 48).isActive = true
        self.addSubview(btnNo)
        self.btnNo.topAnchor.constraint(equalTo: self.btnYes.topAnchor, constant: 0).isActive = true
        self.btnNo.leftAnchor.constraint(equalTo: self.centerXAnchor, constant: 36).isActive = true
        self.btnNo.widthAnchor.constraint(equalToConstant: 73).isActive = true
        self.btnNo.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
