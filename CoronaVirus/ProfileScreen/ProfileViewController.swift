//
//  ProfileViewController.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 16.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
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
        view.font = UIFont(name: "EuclidFlex-Bold", size: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let genderTitle:UILabel = {
            let view = UILabel()
        view.text = "GENDER"
        view.font = UIFont(name: "EuclidFlex-Bold", size: 16)
        view.textColor = UIColor(red: 29/255, green: 116/255, blue: 187/255, alpha: 1)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    let ageTitle:UILabel = {
            let view = UILabel()
        view.text = "AGE"
        view.font = UIFont(name: "EuclidFlex-Bold", size: 16)
        view.textColor = UIColor(red: 29/255, green: 116/255, blue: 187/255, alpha: 1)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    let sickTitle:UILabel = {
            let view = UILabel()
        view.text = "STATUS"
        view.font = UIFont(name: "EuclidFlex-Bold", size: 16)
        view.textColor = UIColor(red: 29/255, green: 116/255, blue: 187/255, alpha: 1)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    let countryTitle:UILabel = {
            let view = UILabel()
        view.text = "COUNTRY"
        view.sizeToFit()
        view.font = UIFont(name: "EuclidFlex-Bold", size: 16)
        view.textColor = UIColor(red: 29/255, green: 116/255, blue: 187/255, alpha: 1)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    let genderValue:UILabel = {
            let view = UILabel()
        view.font = UIFont(name: "EuclidFlex-Bold", size: 16)
        view.textColor = .black
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    let ageValue:UILabel = {
            let view = UILabel()
        view.textColor = .black
        view.font = UIFont(name: "EuclidFlex-Bold", size: 16)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    let countryValue:UILabel = {
            let view = UILabel()
        view.font = UIFont(name: "EuclidFlex-Bold", size: 16)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    let sickValue:UILabel = {
            let view = UILabel()
        view.font = UIFont(name: "EuclidFlex-Bold", size: 16)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    let IDprofile:UILabel = {
            let view = UILabel()
        view.textColor = .black
        view.text = "ID:"
        view.font = UIFont(name: "EuclidFlex-Bold", size: 16)
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
            view.image = UIImage(named: "red_mask_png")
            return view
        }()
    
    let btnEdit:UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("EDIT", for: .normal)
        view.titleLabel?.font = UIFont(name: "EuclidFlex-Regular", size: 24)
        view.titleLabel?.textColor = .white
        view.titleLabel?.textAlignment = .center
        view.isUserInteractionEnabled = true
        view.layer.cornerRadius = 5
        view.backgroundColor = UIColor(red: 60/255, green: 145/255, blue: 224/255, alpha: 1)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupViews()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func setupViews(){
        self.view.addSubview(viewCertificate)
        viewCertificate.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
        viewCertificate.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        viewCertificate.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
        viewCertificate.addSubview(titleCertificate)
            titleCertificate.topAnchor.constraint(equalTo: self.viewCertificate.topAnchor, constant: 0).isActive = true
            titleCertificate.leftAnchor.constraint(equalTo: self.viewCertificate.leftAnchor, constant: 0).isActive = true
            titleCertificate.rightAnchor.constraint(equalTo: self.viewCertificate.rightAnchor, constant: 0).isActive = true
            titleCertificate.heightAnchor.constraint(equalToConstant: 60).isActive = true
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                self.titleCertificate.roundCorners([.topLeft, .topRight], radius: 10)
                self.view.layoutIfNeeded()
            }
            
            
        viewCertificate.addSubview(worldImage)
        worldImage.centerYAnchor.constraint(equalTo: self.viewCertificate.centerYAnchor, constant: 0).isActive = true
        worldImage.centerXAnchor.constraint(equalTo: self.viewCertificate.centerXAnchor, constant: 0).isActive = true
        worldImage.widthAnchor.constraint(equalToConstant: 308).isActive = true
        worldImage.heightAnchor.constraint(equalToConstant: 165).isActive = true
            
            viewCertificate.addSubview(avatar)
            avatar.topAnchor.constraint(equalTo: self.titleCertificate.bottomAnchor, constant: 16).isActive = true
            avatar.leftAnchor.constraint(equalTo: self.viewCertificate.leftAnchor, constant: 16).isActive = true
            avatar.heightAnchor.constraint(equalToConstant: 156).isActive = true
            avatar.widthAnchor.constraint(equalToConstant: 131).isActive = true
            
            viewCertificate.addSubview(IDprofile)
            IDprofile.topAnchor.constraint(equalTo: self.avatar.bottomAnchor, constant: 16).isActive = true
            IDprofile.leftAnchor.constraint(equalTo: self.avatar.leftAnchor, constant: 0).isActive = true
            
            viewCertificate.addSubview(fullName)
            fullName.leftAnchor.constraint(equalTo: self.avatar.leftAnchor, constant: 0).isActive = true
            fullName.topAnchor.constraint(equalTo: IDprofile.bottomAnchor, constant: 16).isActive = true
            
            viewCertificate.addSubview(ageTitle)
            ageTitle.leftAnchor.constraint(equalTo: self.avatar.leftAnchor, constant: 0).isActive = true
            ageTitle.topAnchor.constraint(equalTo: fullName.bottomAnchor, constant: 16).isActive = true
            
            viewCertificate.addSubview(genderTitle)
            genderTitle.leftAnchor.constraint(equalTo: self.ageTitle.leftAnchor, constant: 0).isActive = true
            genderTitle.topAnchor.constraint(equalTo: ageTitle.bottomAnchor, constant: 16).isActive = true
            
            viewCertificate.addSubview(countryTitle)
            countryTitle.leftAnchor.constraint(equalTo: self.genderTitle.leftAnchor, constant: 0).isActive = true
            countryTitle.topAnchor.constraint(equalTo: genderTitle.bottomAnchor, constant: 16).isActive = true
        
        viewCertificate.addSubview(sickTitle)
        sickTitle.leftAnchor.constraint(equalTo: self.countryTitle.leftAnchor, constant: 0).isActive = true
        sickTitle.topAnchor.constraint(equalTo: countryTitle.bottomAnchor, constant: 16).isActive = true
            
            viewCertificate.addSubview(ageValue)
            ageValue.leftAnchor.constraint(equalTo: self.ageTitle.leftAnchor, constant: 8).isActive = true
            ageValue.topAnchor.constraint(equalTo: ageTitle.topAnchor, constant: 0).isActive = true
            
            viewCertificate.addSubview(genderValue)
            genderValue.leftAnchor.constraint(equalTo: self.genderTitle.leftAnchor, constant: 8).isActive = true
            genderValue.topAnchor.constraint(equalTo: genderTitle.topAnchor, constant: 0).isActive = true
            
            viewCertificate.addSubview(countryValue)
            countryValue.leftAnchor.constraint(equalTo: self.countryTitle.leftAnchor, constant: 8).isActive = true
            countryValue.topAnchor.constraint(equalTo: countryTitle.topAnchor, constant: 0).isActive = true
        
        viewCertificate.addSubview(sickValue)
        sickValue.leftAnchor.constraint(equalTo: self.sickTitle.leftAnchor, constant: 8).isActive = true
        sickValue.topAnchor.constraint(equalTo: sickTitle.topAnchor, constant: 0).isActive = true
            
            viewCertificate.addSubview(qrImage)
            qrImage.topAnchor.constraint(equalTo: self.sickTitle.bottomAnchor, constant: 16).isActive = true
            qrImage.rightAnchor.constraint(equalTo: self.viewCertificate.rightAnchor, constant: -16).isActive = true
            qrImage.leftAnchor.constraint(equalTo: viewCertificate.leftAnchor, constant: 16).isActive = true
            qrImage.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
            
            viewCertificate.addSubview(redMaskImage)
            redMaskImage.topAnchor.constraint(equalTo: self.titleCertificate.bottomAnchor, constant: 2).isActive = true
            redMaskImage.rightAnchor.constraint(equalTo: self.viewCertificate.rightAnchor, constant: 0).isActive = true
            redMaskImage.widthAnchor.constraint(equalToConstant: 86).isActive = true
            redMaskImage.heightAnchor.constraint(equalToConstant: 89).isActive = true
        viewCertificate.bottomAnchor.constraint(equalTo: self.qrImage.bottomAnchor, constant: 4).isActive = true
        self.view.addSubview(btnEdit)
        btnEdit.topAnchor.constraint(equalTo: self.viewCertificate.bottomAnchor, constant: 24).isActive = true
        btnEdit.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        btnEdit.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
        btnEdit.heightAnchor.constraint(equalToConstant: 48).isActive = true
        viewCertificate.addDarkShadow()
            self.view.layoutIfNeeded()
    }
    

}
