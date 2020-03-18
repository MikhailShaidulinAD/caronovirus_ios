//
//  LoaderView.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 18.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import UIKit

class LoaderView: UIView {
    
    private let viewBackgroundDark:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
        return view
    }()
    
    private let loader:UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.hidesWhenStopped = true
        view.style = .whiteLarge
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
        addSubview(viewBackgroundDark)
        viewBackgroundDark.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        viewBackgroundDark.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        viewBackgroundDark.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        viewBackgroundDark.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        addSubview(loader)
        loader.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        loader.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
    }
    
    func startLoading() {
        alpha = 1
        viewBackgroundDark.alpha = 1
        viewBackgroundDark.isHidden = false
        loader.startAnimating()
    }
    
    func stopLoading() {
        alpha = 0
        viewBackgroundDark.alpha = 0
        viewBackgroundDark.isHidden = true
        loader.stopAnimating()
    }
}
