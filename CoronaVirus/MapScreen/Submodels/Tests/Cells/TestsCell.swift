//
//  TestsCell.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 13.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import Foundation
import UIKit

protocol TestCellProtocols {
    func nextCell(isPositive: Bool, index:IndexPath)
}

class TestsCell: UICollectionViewCell {
    
    public let id = "TestsCell"
    
    let quest:UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.numberOfLines = 0
        view.textColor = .black
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
        view.isUserInteractionEnabled = true
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
        view.isUserInteractionEnabled = true
        view.backgroundColor = UIColor(red: 255/255, green: 165/255, blue: 0/255, alpha: 1)
        return view
    }()
    
    public var delegate:TestCellProtocols?
    var index:IndexPath?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addDarkShadow()
        layer.cornerRadius = 10
    }
    
    func setupViews(questText:String) {
        self.addSubview(quest)
        quest.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -32).isActive = true
        quest.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        quest.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        quest.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        quest.text = questText
        self.addSubview(btnYes)
        self.btnYes.topAnchor.constraint(equalTo: self.quest.bottomAnchor, constant: 24).isActive = true
        self.btnYes.rightAnchor.constraint(equalTo: self.centerXAnchor, constant: -36).isActive = true
        self.btnYes.widthAnchor.constraint(equalToConstant: 73).isActive = true
        self.btnYes.heightAnchor.constraint(equalToConstant: 48).isActive = true
        self.btnYes.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectYes)))
        self.addSubview(btnNo)
        self.btnNo.topAnchor.constraint(equalTo: self.btnYes.topAnchor, constant: 0).isActive = true
        self.btnNo.leftAnchor.constraint(equalTo: self.centerXAnchor, constant: 36).isActive = true
        self.btnNo.widthAnchor.constraint(equalToConstant: 73).isActive = true
        self.btnNo.heightAnchor.constraint(equalToConstant: 48).isActive = true
        self.btnNo.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectNo)))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TestsCell{
    @objc func selectNo(){
        delegate?.nextCell(isPositive: false, index: index ?? IndexPath(row: 0, section: 0))
    }
    
    @objc func selectYes(){
    
        delegate?.nextCell(isPositive: true, index: index ?? IndexPath(row: 0, section: 0))
    }
}
