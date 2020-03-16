//
//  HomeController.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 12.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift
class HomeController:UIViewController {
    
    let viewBackgroundCertificate:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        return view
    }()
    
    let titleCerticate:UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "CERTIFICAT"
        view.textColor = .white
        view.textAlignment = .center
        view.backgroundColor = UIColor(red: 0/255, green: 140/255, blue: 64/255, alpha: 1)
        view.font = UIFont(name: "sourcesanspro_regular", size: 25)
        return view
    }()
    
    let editText:UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "edit"
        view.textColor = .white
        view.textAlignment = .center
        view.font = UIFont(name: "sourcesanspro_regular", size: 16)
        return view
    }()
    
    let avatar:UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "avatar_man")
        return view
    }()
    
    let worldMap:UIImageView = {
            let view = UIImageView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.image = UIImage(named: "world_map")
            return view
        }()
    
    let idUser: UILabel = {
            let view = UILabel()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.textColor = .white
            view.textAlignment = .center
            view.font = UIFont(name: "sourcesanspro_regular", size: 16)
            return view
        }()
    
    let fullNameUser: UILabel = {
            let view = UILabel()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.textColor = .white
            view.textAlignment = .center
            view.font = UIFont(name: "sourcesanspro_regular", size: 16)
            return view
        }()
    
    let ageTitle: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .white
        view.textAlignment = .center
        view.font = UIFont(name: "sourcesanspro_regular", size: 16)
        return view
    }()
    
    let genderTitle: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .white
        view.textAlignment = .center
        view.font = UIFont(name: "sourcesanspro_regular", size: 16)
        return view
    }()
    
    let countryTitle:UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .white
        view.textAlignment = .center
        view.font = UIFont(name: "sourcesanspro_regular", size: 16)
        return view
    }()
    
    let ageValue:UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .white
        view.textAlignment = .center
        view.font = UIFont(name: "sourcesanspro_regular", size: 16)
        return view
    }()
    
    let genderValue: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .white
        view.textAlignment = .center
        view.font = UIFont(name: "sourcesanspro_regular", size: 16)
        return view
    }()
    
    let country:UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .white
        view.textAlignment = .center
        view.font = UIFont(name: "sourcesanspro_regular", size: 16)
        return view
    }()
    
    let shtrihCode: UIImageView = {
            let view = UIImageView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.image = UIImage(named: "shtrih")
            return view
        }()
    let menu = MenuNavigation()
    
    let mapScreen: UILabel = {
        let view = UILabel()
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Infected map"
        view.textColor = .black
        view.textAlignment = .center
        view.font = UIFont(name: "sourcesanspro_bold", size: 25)
        return view
    }()
    
    let newsScreen:UILabel = {
        let view = UILabel()
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Important news"
        view.textColor = .black
        view.textAlignment = .center
        view.font = UIFont(name: "sourcesanspro_bold", size: 25)
        return view
    }()
    let symptomsScreen:UILabel = {
        let view = UILabel()
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Symptoms"
        view.textColor = .black
        view.textAlignment = .center
        view.font = UIFont(name: "sourcesanspro_bold", size: 25)
        return view
    }()
    let measuresScreen:UILabel = {
        let view = UILabel()
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Measures of precaution"
        view.textColor = .black
        view.textAlignment = .center
        view.font = UIFont(name: "sourcesanspro_bold", size: 25)
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configureNavigationBar()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "Title map"
    }
    
    private func setupViews(){
        self.view.addSubview(viewBackgroundCertificate)
        viewBackgroundCertificate.topAnchor.constraint(equalTo: self.slideMenuController()?.leftContainerView.topAnchor ?? self.view.topAnchor, constant: 50).isActive = true
        viewBackgroundCertificate.leftAnchor.constraint(equalTo: self.slideMenuController()?.leftContainerView.leftAnchor ?? self.view.leftAnchor, constant: 22).isActive = true
        viewBackgroundCertificate.rightAnchor.constraint(equalTo: self.slideMenuController()?.leftContainerView.rightAnchor ?? self.view.rightAnchor, constant: -22).isActive = true
        viewBackgroundCertificate.heightAnchor.constraint(equalToConstant: (self.slideMenuController()?.leftContainerView.frame.width ?? self.view.frame.width / 2 ) * 1.5).isActive = true
        self.view.addSubview(worldMap)
        worldMap.centerXAnchor.constraint(equalTo: self.viewBackgroundCertificate.centerXAnchor, constant: 0).isActive = true
        worldMap.centerYAnchor.constraint(equalTo: self.viewBackgroundCertificate.centerYAnchor, constant: 0).isActive = true
        worldMap.widthAnchor.constraint(equalToConstant:  self.view.frame.width / 2  - 30).isActive = true
        worldMap.heightAnchor.constraint(equalToConstant:  self.view.frame.width / 2  / 2).isActive = true
        self.view.addSubview(titleCerticate)
        titleCerticate.leftAnchor.constraint(equalTo: self.viewBackgroundCertificate.leftAnchor, constant: 0).isActive = true
        titleCerticate.rightAnchor.constraint(equalTo: self.viewBackgroundCertificate.rightAnchor, constant: 0).isActive = true
        titleCerticate.topAnchor.constraint(equalTo: self.viewBackgroundCertificate.topAnchor, constant: 0).isActive = true
        titleCerticate.heightAnchor.constraint(equalToConstant: 38).isActive = true
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.titleCerticate.roundCorners([.topLeft, .topRight], radius: 10)
            self.view.layoutIfNeeded()
        }
        self.view.addSubview(editText)
        editText.rightAnchor.constraint(equalTo: self.titleCerticate.rightAnchor, constant: -8).isActive = true
        editText.centerYAnchor.constraint(equalTo: self.titleCerticate.centerYAnchor, constant: 0).isActive = true
        self.view.addSubview(avatar)
        avatar.topAnchor.constraint(equalTo: self.titleCerticate.bottomAnchor, constant: 16).isActive = true
        avatar.leftAnchor.constraint(equalTo: self.viewBackgroundCertificate.leftAnchor, constant: 20).isActive = true
        avatar.widthAnchor.constraint(equalToConstant: 61).isActive = true
        avatar.heightAnchor.constraint(equalToConstant: 81).isActive = true
        self.view.addSubview(shtrihCode)
        shtrihCode.bottomAnchor.constraint(equalTo: self.viewBackgroundCertificate.bottomAnchor, constant: -10).isActive = true
        shtrihCode.leftAnchor.constraint(equalTo: self.viewBackgroundCertificate.leftAnchor, constant: 20).isActive = true
        shtrihCode.rightAnchor.constraint(equalTo: self.viewBackgroundCertificate.rightAnchor, constant: -20).isActive = true
        shtrihCode.heightAnchor.constraint(equalToConstant: 20).isActive = true
        self.view.addSubview(mapScreen)
        mapScreen.topAnchor.constraint(equalTo: self.viewBackgroundCertificate.bottomAnchor, constant: 16).isActive = true
        mapScreen.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 24).isActive = true
        self.view.addSubview(newsScreen)
        newsScreen.topAnchor.constraint(equalTo: mapScreen.bottomAnchor, constant: 16).isActive = true
        newsScreen.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 24).isActive = true
        self.view.addSubview(symptomsScreen)
        symptomsScreen.topAnchor.constraint(equalTo: newsScreen.bottomAnchor, constant: 16).isActive = true
        symptomsScreen.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 24).isActive = true
        self.view.addSubview(measuresScreen)
        measuresScreen.topAnchor.constraint(equalTo: symptomsScreen.bottomAnchor, constant: 16).isActive = true
        measuresScreen.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 24).isActive = true
        mapScreen.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickMapScreen)))
        newsScreen.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickNewsScreen)))
        symptomsScreen.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickSymptomsScreen)))
        measuresScreen.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickMeasureScreen)))

    }
}

extension HomeController{
    
    @objc func clickMapScreen(){
        self.slideMenuController()?.openMapScreen()
        self.slideMenuController()?.closeLeft()
    }
    @objc func clickNewsScreen(){
        self.slideMenuController()?.openNewsScreen()
        self.slideMenuController()?.closeLeft()
    }
    @objc func clickSymptomsScreen(){
        self.slideMenuController()?.openSymptomsScreen()
        self.slideMenuController()?.closeLeft()
    }
    @objc func clickMeasureScreen(){
        self.slideMenuController()?.openMeasureScreen()
        self.slideMenuController()?.closeLeft()
    }
}
