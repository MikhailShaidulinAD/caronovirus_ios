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
    
    lazy var firstName:UITextField = {
        let view = UITextField()
        view.placeholder = "First Name"
        view.textColor = .black
        view.delegate = self
        view.font = UIFont(name: "EuclidFlex-Bold", size: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var lastName:UITextField = {
        let view = UITextField()
        view.placeholder = "Last Name"
        view.textColor = .black
        view.delegate = self
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
        view.isEnabled = true
        view.isSelected = true
        view.backgroundColor = UIColor(red: 60/255, green: 145/255, blue: 224/255, alpha: 1)
        view.addTarget(self, action: #selector(saveEditUserInfo(_:)), for: .touchUpInside)
        return view
    }()
    
    lazy var penView:UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named:"pen")
        view.isUserInteractionEnabled = true
        return view
    }()
    
    lazy var penView3:UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named:"pen")
        view.isUserInteractionEnabled = true
        return view
    }()
    
    lazy var penView4:UIImageView = {
        let view = UIImageView()
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named:"pen")
        return view
    }()
    let dataSource = CustomPickerDataSource()
    lazy var picker:UIPickerView = {
        let view = UIPickerView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 300))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = dataSource
        view.dataSource = dataSource
        view.backgroundColor = UIColor(red: 210/255, green: 214/255, blue: 219/255, alpha: 1)
        view.showsSelectionIndicator = true
        view.isHidden = true
//        view.isUserInteractionEnabled = true
        return view
    }()
    
    lazy var toolbar:UIToolbar = {
        let view = UIToolbar()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.barStyle = UIBarStyle.default
        view.isTranslucent = true
        view.isHidden = true
        view.sizeToFit()
        view.backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 250/255, alpha: 1)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let loader: LoaderView = {
        let view = LoaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = 0
        return view
    }()
    
    var interactor:ProfileInteractor?
    var router:ProfileRoute?
    private var configurator = ProfileConfigurator()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupViews()
        navigationController?.setNavigationBarHidden(true, animated: false)
        createFetchUserInfo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createFetchUserInfo()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configurator.configureModule(viewController: self)
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
            
            viewCertificate.addSubview(firstName)
            firstName.leftAnchor.constraint(equalTo: self.avatar.leftAnchor, constant: 0).isActive = true
            firstName.topAnchor.constraint(equalTo: IDprofile.bottomAnchor, constant: 16).isActive = true
        
        viewCertificate.addSubview(lastName)
        lastName.leftAnchor.constraint(equalTo: self.firstName.rightAnchor, constant: 8).isActive = true
        lastName.topAnchor.constraint(equalTo: self.firstName.topAnchor, constant: 0).isActive = true
            
            viewCertificate.addSubview(ageTitle)
            ageTitle.leftAnchor.constraint(equalTo: self.avatar.leftAnchor, constant: 0).isActive = true
            ageTitle.topAnchor.constraint(equalTo: firstName.bottomAnchor, constant: 16).isActive = true
            
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
            ageValue.leftAnchor.constraint(equalTo: self.ageTitle.rightAnchor, constant: 8).isActive = true
            ageValue.topAnchor.constraint(equalTo: ageTitle.topAnchor, constant: 0).isActive = true
        viewCertificate.addSubview(penView4)
        penView4.leftAnchor.constraint(equalTo: ageValue.rightAnchor, constant: 4).isActive = true
        penView4.topAnchor.constraint(equalTo: ageValue.topAnchor, constant: 0).isActive = true
            
            viewCertificate.addSubview(genderValue)
            genderValue.leftAnchor.constraint(equalTo: self.genderTitle.rightAnchor, constant: 8).isActive = true
            genderValue.topAnchor.constraint(equalTo: genderTitle.topAnchor, constant: 0).isActive = true
        viewCertificate.addSubview(penView3)
        penView3.leftAnchor.constraint(equalTo: genderValue.rightAnchor, constant: 4).isActive = true
        penView3.topAnchor.constraint(equalTo: genderValue.topAnchor, constant: 0).isActive = true
            
            viewCertificate.addSubview(countryValue)
            countryValue.leftAnchor.constraint(equalTo: self.countryTitle.rightAnchor, constant: 8).isActive = true
            countryValue.topAnchor.constraint(equalTo: countryTitle.topAnchor, constant: 0).isActive = true
        viewCertificate.addSubview(penView)
        penView.leftAnchor.constraint(equalTo: countryValue.rightAnchor, constant: 4).isActive = true
        penView.topAnchor.constraint(equalTo: countryValue.topAnchor, constant: 0).isActive = true
        
        viewCertificate.addSubview(sickValue)
        sickValue.leftAnchor.constraint(equalTo: self.sickTitle.rightAnchor, constant: 8).isActive = true
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
        self.view.addSubview(picker)
        picker.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50).isActive = true
        picker.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        picker.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        picker.sizeToFit()
        let done = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(pickerDone))
        toolbar.setItems([done], animated: true)
        view.addSubview(toolbar)
        toolbar.leftAnchor.constraint(equalTo: self.picker.leftAnchor, constant: 0).isActive = true
        toolbar.rightAnchor.constraint(equalTo: self.picker.rightAnchor, constant: 0).isActive = true
        toolbar.topAnchor.constraint(equalTo: self.picker.topAnchor, constant: 0).isActive = true
        toolbar.sizeToFit()
        penView4.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openPickerAge)))
        penView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openPickerCountry)))
        penView3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openPickerGender)))
        self.view.layoutIfNeeded()
        self.view.addSubview(loader)
        loader.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        loader.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        loader.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        loader.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        picker.showsSelectionIndicator = true

        self.tabBarController?.tabBar.isHidden = false
            self.view.layoutIfNeeded()
    }

}

extension ProfileViewController{
    private func showPicker(){
        UIView.animate(withDuration: 0.3) {
            self.toolbar.isHidden = false
             self.picker.isHidden = false
            self.view.layoutIfNeeded()
        }
    }
}

extension ProfileViewController{
    
    @objc func saveEditUserInfo(_ sender: Any){
        view.endEditing(true)
        loader.startLoading()
        interactor?.fetchUpdateUserData(request: ProfileDataFlow.CreateChangeUserInfo.Request(name: firstName.text, surname: lastName.text, age: ageValue.text, gender: genderValue.text, country: countryValue.text))
    }
    
    @objc func openPickerAge(){
        interactor?.fetchPrickerAge(request: ProfileDataFlow.CreatePicker.Request())
    }
    
    @objc func openPickerCountry(){
        interactor?.fetchPrickerCountry(request: ProfileDataFlow.CreatePicker.Request())
    }
    
    @objc func openPickerGender(){
        interactor?.fetchPrickerGender(request: ProfileDataFlow.CreatePicker.Request())
    }
    
    
    private func createFetchUserInfo(){
        interactor?.fetchUserInfo(request: ProfileDataFlow.FetchUserInfo.Request())
    }
    
     @objc func pickerDone(){
        switch dataSource.data?.type {
        case .age:
            self.ageValue.text = dataSource.getDoneValue()
        case .country:
            self.countryValue.text = dataSource.getDoneValue()
        case .gender:
            self.genderValue.text = dataSource.getDoneValue()
            checkGenderIndefication(gender: dataSource.getDoneValue())
        case .none:
            break
        }
        UIView.animate(withDuration: 0.3) {
            self.toolbar.isHidden = true
            self.picker.isHidden = true
        }
    }
    private func showAlertInformation(text: String){
        let alert = UIAlertController(title: "Profile", message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {(alert) in
        }))
        self.navigationController?.present(alert, animated: false, completion: nil)
    }
    
    private func checkGenderIndefication(gender:String?){
        if gender == "Female" {
            avatar.image = UIImage(named: "avatar_woman")
        }else{
            avatar.image = UIImage(named: "avatar_man")
        }
    }
}




extension ProfileViewController: ProfileViewProtocols{
    func showResultChangesUser(viewModel: ProfileDataFlow.CreateChangeUserInfo.ViewModel) {
        loader.stopLoading()
        switch viewModel.viewState {
        case .success:
            showAlertInformation(text: "Profile change success")
        case .failure(let err):
            showAlertInformation(text: err)
        }
    }
    
    func showUserInfo(viewModel: ProfileDataFlow.FetchUserInfo.ViewModel) {
        switch viewModel.viewState {
        case .result(id: let idUser, firstName: let nameUser, lastName: let lastNameUser, age: let ageUser, gender: let genderUser, country: let countryUser, status: let statusUser):
            self.IDprofile.text = "ID: \(idUser)"
            if !nameUser.isEmpty && nameUser.count > 1 {
                self.firstName.text = nameUser
                firstName.sizeToFit()
            }
            if !lastNameUser.isEmpty && lastNameUser.count > 1 {
                self.lastName.text = lastNameUser
                lastName.sizeToFit()
            }
            self.ageValue.text = ageUser
            checkGenderIndefication(gender: genderUser)
            self.genderValue.text = genderUser
            self.countryValue.text = countryUser
            self.sickValue.text = statusUser
            self.view.layoutIfNeeded()
        }
    }
    
    func showPickerData(viewModel: ProfileDataFlow.CreatePicker.ViewModel) {
        switch viewModel.viewState {
        case .result(let data):
            dataSource.data = data
            picker.reloadAllComponents()
            showPicker()
        }
    }
    
    
}

extension ProfileViewController: UITextFieldDelegate{
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentCharacterCount = textField.text?.count ?? 0
        if range.length + range.location > currentCharacterCount {
            return false
        }
        let newLength = currentCharacterCount + string.count - range.length
        return newLength <= 25
    }
}
