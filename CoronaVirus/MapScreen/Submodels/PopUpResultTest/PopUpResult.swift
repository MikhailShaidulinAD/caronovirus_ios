//
//  PopUpResult.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 17.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import UIKit

class PopUpResult: UIView {
    
    let viewBackground:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    let viewCertificate:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        view.layer.cornerRadius = 10
        return view
        }()
    
    let titleCertificate:UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .white
        view.text = "CERTIFICAT"
        view.textAlignment = .center
        view.backgroundColor = UIColor(red: 0/255, green: 140/255, blue: 64/255, alpha: 1)
        view.font = UIFont(name: "EuclidFlex-Bold", size: 18)
        return view
    }()
    
    let avatar:UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "avatar_man")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let fullName:UILabel = {
        let view = UILabel()
        view.text = "Full Namme"
        view.textColor = .black
        view.font = UIFont(name: "EuclidFlex-Bold", size: 8)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let genderTitle:UILabel = {
            let view = UILabel()
        view.text = "GENDER"
        view.font = UIFont(name: "EuclidFlex-Bold", size: 8)
        view.textColor = UIColor(red: 29/255, green: 116/255, blue: 187/255, alpha: 1)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    let ageTitle:UILabel = {
            let view = UILabel()
        view.text = "AGE"
        view.font = UIFont(name: "EuclidFlex-Bold", size: 8.0)
        view.textColor = UIColor(red: 29/255, green: 116/255, blue: 187/255, alpha: 1)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    let countryTitle:UILabel = {
            let view = UILabel()
        view.text = "COUNTRY"
        view.sizeToFit()
        view.font = UIFont(name: "EuclidFlex-Bold", size: 8)
        view.textColor = UIColor(red: 29/255, green: 116/255, blue: 187/255, alpha: 1)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    let genderValue:UILabel = {
            let view = UILabel()
        view.font = UIFont(name: "EuclidFlex-Bold", size: 8)
        view.textColor = .black
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    let ageValue:UILabel = {
            let view = UILabel()
        view.textColor = .black
        view.font = UIFont(name: "EuclidFlex-Bold", size: 8)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    let countryValue:UILabel = {
            let view = UILabel()
        view.font = UIFont(name: "EuclidFlex-Bold", size: 8)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    let IDprofile:UILabel = {
            let view = UILabel()
        view.textColor = .black
        view.text = "ID:"
        view.font = UIFont(name: "EuclidFlex-Bold", size: 8)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    let qrImage:UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "qr")
        return view
    }()
    
    let worldImage: UIImageView = {
            let view = UIImageView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.image = UIImage(named: "world")
            return view
        }()
    let redMaskImage:UIImageView = {
            let view = UIImageView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.image = UIImage(named: "red_mask")
            return view
        }()
    
    let resultTitle:UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Result:"
        view.textAlignment = .center
        view.font = UIFont(name: "EuclidFlex-Bold", size: 18)
        return view
    }()
    
    let descriptionResult:UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Result:"
        view.textAlignment = .center
        view.numberOfLines = 0
        view.font = UIFont(name: "EuclidFlex-Bold", size: 14)
        return view
    }()
    
    let testAgain: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Pass the test again"
        view.textColor = .black
        view.textAlignment = .center
        view.font = UIFont(name: "EuclidFlex-Regular", size: 16)
        let text = view.text
        let textRange = NSRange(location: 0, length: (text?.count)!)
        let attributedText = NSMutableAttributedString(string: text!)
        attributedText.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: textRange)
        view.attributedText = attributedText
        view.isUserInteractionEnabled = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        let views = subviews
        for view in views {
            view.removeFromSuperview()
        }
        addSubview(viewBackground)
        viewBackground.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        viewBackground.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        viewBackground.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        viewBackground.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        
        viewBackground.addSubview(viewCertificate)
        viewCertificate.topAnchor.constraint(equalTo: self.viewBackground.topAnchor, constant: 16).isActive = true
        viewCertificate.leftAnchor.constraint(equalTo: self.viewBackground.leftAnchor, constant: 16).isActive = true
        viewCertificate.bottomAnchor.constraint(equalTo: self.viewBackground.bottomAnchor, constant: -16).isActive = true
        viewCertificate.widthAnchor.constraint(equalToConstant: frame.width * 0.5).isActive = true
        
        print("frame width 0.5 \(frame.width * 0.5)")
        
        viewCertificate.addSubview(titleCertificate)
        titleCertificate.topAnchor.constraint(equalTo: self.viewCertificate.topAnchor, constant: 0).isActive = true
        titleCertificate.leftAnchor.constraint(equalTo: self.viewCertificate.leftAnchor, constant: 0).isActive = true
        titleCertificate.rightAnchor.constraint(equalTo: self.viewCertificate.rightAnchor, constant: 0).isActive = true
        titleCertificate.heightAnchor.constraint(equalToConstant: 24).isActive = true
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.titleCertificate.roundCorners([.topLeft, .topRight], radius: 10)
            self.layoutIfNeeded()
        }
        
        
        viewCertificate.addSubview(worldImage)
        worldImage.topAnchor.constraint(equalTo: self.titleCertificate.bottomAnchor, constant: 4).isActive = true
        worldImage.bottomAnchor.constraint(equalTo: self.viewCertificate.bottomAnchor, constant: -4).isActive = true
        worldImage.centerXAnchor.constraint(equalTo: self.viewCertificate.centerXAnchor, constant: self.viewCertificate.frame.width * 0.1).isActive = true
        worldImage.widthAnchor.constraint(equalToConstant: frame.width * 0.4).isActive = true
        
        viewCertificate.addSubview(avatar)
        avatar.topAnchor.constraint(equalTo: self.titleCertificate.bottomAnchor, constant: 10).isActive = true
        avatar.leftAnchor.constraint(equalTo: self.viewCertificate.leftAnchor, constant: 10).isActive = true
        avatar.heightAnchor.constraint(equalToConstant: frame.height * 0.42).isActive = true
        avatar.widthAnchor.constraint(equalToConstant: frame.height * 0.31).isActive = true
        
        viewCertificate.addSubview(IDprofile)
        IDprofile.topAnchor.constraint(equalTo: self.avatar.topAnchor, constant: 0).isActive = true
        IDprofile.leftAnchor.constraint(equalTo: self.avatar.rightAnchor, constant: 10).isActive = true
        
        viewCertificate.addSubview(fullName)
        fullName.leftAnchor.constraint(equalTo: self.avatar.rightAnchor, constant: 10).isActive = true
        fullName.topAnchor.constraint(equalTo: IDprofile.bottomAnchor, constant: 4).isActive = true
        
        viewCertificate.addSubview(ageTitle)
        ageTitle.leftAnchor.constraint(equalTo: self.avatar.rightAnchor, constant: 10).isActive = true
        ageTitle.topAnchor.constraint(equalTo: fullName.bottomAnchor, constant: 4).isActive = true
        
        viewCertificate.addSubview(genderTitle)
        genderTitle.leftAnchor.constraint(equalTo: self.avatar.rightAnchor, constant: 10).isActive = true
        genderTitle.topAnchor.constraint(equalTo: ageTitle.bottomAnchor, constant: 4).isActive = true
        
        viewCertificate.addSubview(countryTitle)
        countryTitle.leftAnchor.constraint(equalTo: self.avatar.rightAnchor, constant: 10).isActive = true
        countryTitle.topAnchor.constraint(equalTo: genderTitle.bottomAnchor, constant: 4).isActive = true
        
        viewCertificate.addSubview(ageValue)
        ageValue.leftAnchor.constraint(equalTo: self.ageTitle.rightAnchor, constant: 8).isActive = true
        ageValue.topAnchor.constraint(equalTo: ageTitle.topAnchor, constant: 0).isActive = true
        
        viewCertificate.addSubview(genderValue)
        genderValue.leftAnchor.constraint(equalTo: self.genderTitle.rightAnchor, constant: 8).isActive = true
        genderValue.topAnchor.constraint(equalTo: genderTitle.topAnchor, constant: 0).isActive = true
        
        viewCertificate.addSubview(countryValue)
        countryValue.leftAnchor.constraint(equalTo: self.countryTitle.rightAnchor, constant: 8).isActive = true
        countryValue.topAnchor.constraint(equalTo: countryTitle.topAnchor, constant: 0).isActive = true
        
        viewCertificate.addSubview(qrImage)
        qrImage.bottomAnchor.constraint(equalTo: self.viewCertificate.bottomAnchor, constant: -5).isActive = true
        qrImage.rightAnchor.constraint(equalTo: self.viewCertificate.rightAnchor, constant: -10).isActive = true
        qrImage.leftAnchor.constraint(equalTo: countryTitle.leftAnchor, constant: 0).isActive = true
        qrImage.heightAnchor.constraint(equalToConstant: frame.height * 0.09).isActive = true
    
        
        viewCertificate.addSubview(redMaskImage)
        redMaskImage.topAnchor.constraint(equalTo: self.titleCertificate.bottomAnchor, constant: 2).isActive = true
        redMaskImage.rightAnchor.constraint(equalTo: self.viewCertificate.rightAnchor, constant: 0).isActive = true
        redMaskImage.widthAnchor.constraint(equalToConstant: frame.height * 0.25).isActive = true
        redMaskImage.heightAnchor.constraint(equalToConstant: frame.height * 0.25).isActive = true
        layoutIfNeeded()
        
        viewBackground.addSubview(resultTitle)
        resultTitle.topAnchor.constraint(equalTo: self.viewBackground.topAnchor, constant: 16).isActive = true
        resultTitle.leftAnchor.constraint(equalTo: self.viewCertificate.rightAnchor, constant: 4).isActive = true
        resultTitle.rightAnchor.constraint(equalTo: self.viewBackground.rightAnchor, constant: -4).isActive = true
        
        viewBackground.addSubview(testAgain)
        testAgain.bottomAnchor.constraint(equalTo: self.viewBackground.bottomAnchor, constant: -16).isActive = true
        testAgain.leftAnchor.constraint(equalTo: self.viewCertificate.rightAnchor, constant: 4).isActive = true
        testAgain.rightAnchor.constraint(equalTo: self.viewBackground.rightAnchor, constant: -4).isActive = true
        
        viewBackground.addSubview(descriptionResult)
        descriptionResult.topAnchor.constraint(equalTo: self.resultTitle.bottomAnchor, constant: 4).isActive = true
        descriptionResult.leftAnchor.constraint(equalTo: self.viewCertificate.rightAnchor, constant: 4).isActive = true
        descriptionResult.rightAnchor.constraint(equalTo: self.viewBackground.rightAnchor, constant: 4).isActive = true
        descriptionResult.sizeToFit()
        descriptionResult.text = "Urgently apply to the nearest hospital.\nYou have a high probability of coronavirus."
        layoutIfNeeded()
    }
    
    func updateDescription(isResultPositive:Bool){
        if !isResultPositive {
            let color = UIColor(red: 0/255, green: 161/255, blue: 26/255, alpha: 1)
            resultTitle.textColor = color
            descriptionResult.textColor = color
            descriptionResult.text = "You are perfectly healthy! \nYou are not infected by coronavirus"
        }else{
            let color = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
            resultTitle.textColor = color
            descriptionResult.textColor = color
            descriptionResult.text = "Urgently apply to the nearest hospital.\nYou have a high probability of coronavirus."
        }
    }
}
