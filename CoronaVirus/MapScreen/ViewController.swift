//
//  ViewController.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 12.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import UIKit
import MapKit
import GoogleMaps
import CoreLocation
class ViewController: UIViewController {
    
    var mapView: GMSMapView?
    let data = TesDataStore()
    
    lazy var collectionTest: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsHorizontalScrollIndicator = false
        view.isScrollEnabled = false
        view.backgroundColor = .none
        view.dataSource = data
        view.delegate = data
        view.register(TestsCell.self, forCellWithReuseIdentifier: TestsCell().id)
        view.contentInset = UIEdgeInsets(top: 10, left: 16, bottom: 0, right: 16)
        return view
    }()
    
    let viewInfected:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 171/255, green: 171/255, blue: 171/255, alpha: 0.8)
        return view
    }()
    
    let viewDeceased:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 171/255, green: 171/255, blue: 171/255, alpha: 0.8)
        return view
    }()
    
    let viewRecovered:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 171/255, green: 171/255, blue: 171/255, alpha: 0.8)
        return view
    }()
    
    let titleTest:UILabel = {
           let view = UILabel()
           view.translatesAutoresizingMaskIntoConstraints = false
           view.text = "Test on existence of disease"
        view.textColor = .black
           view.textAlignment = .center
           view.font = UIFont(name: "EuclidFlex-Bold", size: 16)
           return view
       }()
    
    let infectedValue:UILabel = {
        let view = UILabel()
        view.text = "0"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.backgroundColor = .clear
        view.textColor = .white
        view.font = UIFont(name: "sourcesanspro_bold", size: 16)
        return view
    }()
    let recoveredValue:UILabel = {
        let view = UILabel()
        view.text = "0"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.textColor = .white
        view.backgroundColor = .clear
        view.font = UIFont(name: "sourcesanspro_bold", size: 16)
        return view
    }()
    let deceasedValue:UILabel = {
        let view = UILabel()
        view.text = "0"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.textColor = .white
        view.backgroundColor = .clear
        view.font = UIFont(name: "sourcesanspro_bold", size: 16)
        return view
    }()
    let infectedTitle:UILabel = {
        let view = UILabel()
        view.text = "Infected"
        view.textColor = .white
        view.textAlignment = .center
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "sourcesanspro_bold", size: 16)
        return view
    }()
    let recoveredTitle:UILabel = {
        let view = UILabel()
        view.text = "Recovered"
        view.textAlignment = .center
        view.textColor = .white
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "sourcesanspro_bold", size: 16)
        return view
    }()
    let deceasedTitle:UILabel = {
        let view = UILabel()
        view.text = "Deceased"
        view.textAlignment = .center
        view.textColor = .white
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "sourcesanspro_bold", size: 16)
        return view
    }()
    
    lazy var popUpResult: PopUpResult = {
        let view = PopUpResult(frame: CGRect(x: 0, y: 0, width: self.view.frame.width * 0.9, height: self.view.frame.width * 0.4))
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let visualEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let view = UIVisualEffectView(effect: blurEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let loader: LoaderView = {
        let view = LoaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = 0
        return view
    }()
    
    var interactor:MainInteractor?
    var router:MainRoute?
    private var configurator = MainConfigurator()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configurator.configureModule(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView = GMSMapView()
        self.view.backgroundColor = .white
        setupViews()
        loader.startLoading()
        checkAccessLocation()
        createFetchTotalStatistic()
        createFetchCountiesInfo()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
}

extension ViewController{
    @objc func clickMenu(){
        print("click")
    }
    
    @objc func closePopUp(){
        hidePopUpResult()
    }
}

extension ViewController{
    
    private func setupViews(){

        view.addSubview(mapView!)
        mapView?.translatesAutoresizingMaskIntoConstraints = false
        mapView!.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        mapView!.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        mapView!.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        mapView!.heightAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        self.view.addSubview(viewInfected)
        self.viewInfected.topAnchor.constraint(equalTo: mapView!.topAnchor, constant: 50).isActive = true
        self.viewInfected.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        self.viewInfected.heightAnchor.constraint(equalToConstant: 56).isActive = true
        self.viewInfected.widthAnchor.constraint(equalToConstant: 110).isActive = true
        
        self.view.addSubview(viewDeceased)
        self.viewDeceased.topAnchor.constraint(equalTo: viewInfected.bottomAnchor, constant: 16).isActive = true
        self.viewDeceased.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        self.viewDeceased.heightAnchor.constraint(equalToConstant: 56).isActive = true
        self.viewDeceased.widthAnchor.constraint(equalToConstant: 110).isActive = true
        
        self.view.addSubview(viewRecovered)
        self.viewRecovered.topAnchor.constraint(equalTo: viewDeceased.bottomAnchor, constant: 16).isActive = true
        self.viewRecovered.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        self.viewRecovered.heightAnchor.constraint(equalToConstant: 56).isActive = true
        self.viewRecovered.widthAnchor.constraint(equalToConstant: 110).isActive = true
        
        self.viewInfected.addSubview(infectedTitle)
        self.infectedTitle.topAnchor.constraint(equalTo: viewInfected.topAnchor, constant: 8).isActive = true
        self.infectedTitle.leftAnchor.constraint(equalTo: viewInfected.leftAnchor, constant: 0).isActive = true
        self.infectedTitle.rightAnchor.constraint(equalTo: viewInfected.rightAnchor, constant: 0).isActive = true
        
        self.viewInfected.addSubview(infectedValue)
        self.infectedValue.topAnchor.constraint(equalTo: infectedTitle.bottomAnchor, constant: 4).isActive = true
        self.infectedValue.leftAnchor.constraint(equalTo: viewInfected.leftAnchor, constant: 0).isActive = true
        self.infectedValue.rightAnchor.constraint(equalTo: viewInfected.rightAnchor, constant: 0).isActive = true
        
        self.viewRecovered.addSubview(recoveredTitle)
        self.recoveredTitle.topAnchor.constraint(equalTo: viewRecovered.topAnchor, constant: 8).isActive = true
        self.recoveredTitle.leftAnchor.constraint(equalTo: viewRecovered.leftAnchor, constant: 0).isActive = true
        self.recoveredTitle.rightAnchor.constraint(equalTo: viewRecovered.rightAnchor, constant: 0).isActive = true
        
        self.viewDeceased.addSubview(deceasedTitle)
        self.deceasedTitle.topAnchor.constraint(equalTo: viewDeceased.topAnchor, constant: 8).isActive = true
        self.deceasedTitle.leftAnchor.constraint(equalTo: viewDeceased.leftAnchor, constant: 0).isActive = true
        self.deceasedTitle.rightAnchor.constraint(equalTo: viewDeceased.rightAnchor, constant: 0).isActive = true
        
        self.viewDeceased.addSubview(deceasedValue)
        self.deceasedValue.topAnchor.constraint(equalTo: deceasedTitle.bottomAnchor, constant: 4).isActive = true
        self.deceasedValue.leftAnchor.constraint(equalTo: viewDeceased.leftAnchor, constant: 0).isActive = true
        self.deceasedValue.rightAnchor.constraint(equalTo: viewDeceased.rightAnchor, constant: 0).isActive = true
        
        self.viewRecovered.addSubview(recoveredValue)
        self.recoveredValue.topAnchor.constraint(equalTo: recoveredTitle.bottomAnchor, constant: 4).isActive = true
        self.recoveredValue.leftAnchor.constraint(equalTo: viewRecovered.leftAnchor, constant: 0).isActive = true
        self.recoveredValue.rightAnchor.constraint(equalTo: viewRecovered.rightAnchor, constant: 0).isActive = true
        
        self.view.addSubview(titleTest)
        titleTest.topAnchor.constraint(equalTo: self.mapView!.bottomAnchor, constant: 22).isActive = true
        titleTest.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        titleTest.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        titleTest.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
        self.view.addSubview(collectionTest)
        collectionTest.topAnchor.constraint(equalTo: self.titleTest.bottomAnchor, constant: 16).isActive = true
        collectionTest.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        collectionTest.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        collectionTest.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -80).isActive = true
        data.data = ["Did you recently lose consciousness?","Do you have a dry non-productive cough?", "Do you have an increased temperature (chill, fever)?","Do you feel difficulties by breathing?", "Do you feel pain in the breast area or in muscles? Headaches?", "Do you feel sickish?"]
        data.delegate = self
        
        self.view.addSubview(visualEffectView)
        visualEffectView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        visualEffectView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        visualEffectView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        visualEffectView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        visualEffectView.alpha = 0
        visualEffectView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closePopUp)))
        self.view.addSubview(popUpResult)
        popUpResult.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        popUpResult.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        popUpResult.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 32).isActive = true
        popUpResult.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -32).isActive = true
        popUpResult.heightAnchor.constraint(equalToConstant: self.view.frame.width * 0.4).isActive = true
        popUpResult.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        popUpResult.alpha = 0
        popUpResult.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closePopUp)))
        popUpResult.sizeToFit()
        
        self.view.addSubview(loader)
        loader.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        loader.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        loader.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        loader.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
    }
    
    private func setupNavBar(){
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.barTintColor = UIColor(red: 64/255, green: 64/255, blue: 65/255, alpha: 1)
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        navigationController?.title = "Title"
        self.addLeftBarButtonWithImage(UIImage(named: "burger")!)
    }
    
    private func showAccessLocationAlert(text: String){
        let settingsAppURL = URL(string: UIApplication.openSettingsURLString)!
        let alert = UIAlertController(title: "Location", message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {(alert)in
            print("cancel")
        }))
        alert.addAction(UIAlertAction(title: "Enable",
                                      style: .default,
                                      handler: { (alert) -> Void in
                                        UIApplication.shared.open(settingsAppURL,
                                                                  options: [:],
                                                                  completionHandler: nil)
        }))
        self.navigationController?.present(alert, animated: false, completion: nil)
    }
    
    private func checkAccessLocation(){
                switch CLLocationManager.authorizationStatus() {
                case .authorizedAlways:
                    createRequestUserInfo()
                case .authorizedWhenInUse:
                    createRequestUserInfo()
                case .denied:
                    showAccessLocationAlert(text: "Unable to retrieve your location data because geolocation is disabled")
                case .notDetermined: createRequireLocation()
                case .restricted:
                    showAccessLocationAlert(text: "Unable to retrieve your location data because geolocation is disabled")
                @unknown default:
                    return
                }
    }
    
    private func showPopUpResult(isSick:Bool) {
        visualEffectView.isUserInteractionEnabled = true
        popUpResult.isUserInteractionEnabled = true
        popUpResult.setupViews()
        popUpResult.updateDescription(isResultPositive: isSick)
        UIView.animate(withDuration: 0.5){
            self.visualEffectView.alpha = 1
            self.popUpResult.alpha = 1
            self.popUpResult.transform = CGAffineTransform.identity
        }
    }
    
    private func hidePopUpResult(){
        visualEffectView.isUserInteractionEnabled = false
        popUpResult.isUserInteractionEnabled = false
        UIView.animate(withDuration: 0.3){
            self.visualEffectView.alpha = 0
            self.popUpResult.alpha = 0
            self.popUpResult.transform = CGAffineTransform.identity
        }
    }
}

extension ViewController{
    
    private func createFetchTotalStatistic(){
        let request = MainViewDataFlow.CountriesTotalStatisticCase.Request()
        interactor?.fetchTotalStatistic(request: request)
    }
    
    private func createFetchCountiesInfo(){
        let request = MainViewDataFlow.CountriesInfoCase.Request()
        interactor?.fetchCountriesInfo(request: request)
    }
    
    private func createSendTestResult(count:Int){
        loader.startLoading()
        let request:MainViewDataFlow.TestCase.RequestBody
        request = .positiveCount(count)
        interactor?.sendResultTest(request: MainViewDataFlow.TestCase.Request(request: request))
    }
    
    private func createRequestUserInfo(){
        let request = MainViewDataFlow.CreateUserCase.Request()
        interactor?.sendRequestUser(request: request)
    }
    
    private func createRequireLocation(){
        let request = MainViewDataFlow.CheckLocationAccessCase.Request()
        interactor?.requireLocation(request: request)
    }
    
}

extension ViewController: MainViewControllerProtocols{
    func completeUserInfo(viewState: MainViewDataFlow.CreateUserCase.ViewModel) {
        router?.routeUserInfo()
        loader.stopLoading()
    }
    
    func showCountiesInfo(viewState: MainViewDataFlow.CountriesInfoCase.ViewModel) {
        switch viewState.result {
        case .success(countriesItems: let items):
            router?.routeCountriesInfo()
            items.forEach{[unowned self](item) in
                if let lat = item.lat, let lon = item.lon, item.cases > 0{
                    let iMarker = GMSMarker()
                    iMarker.position = CLLocationCoordinate2DMake(lat, lon)
                    let rect =  CGRect(origin: .zero, size: CGSize(width: 30, height: 30))
                    let icon = MarkAnnotationView(frame: rect, mark: String(item.cases), freeBoxes: item.cases)
                    iMarker.icon = icon.asImage()
                    iMarker.map = self.mapView
                }
            }
            createRequestUserInfo()
            self.loadViewIfNeeded()
        case .failure(let err):break
        }
    }
    
    func showTestResult(viewState: MainViewDataFlow.TestCase.ViewModel) {
        loader.stopLoading()
        switch viewState.result {
        case .success(let isSick):
            showPopUpResult(isSick: isSick)
            router?.routeSickStatus()
        case .failure(err: let err):break
        }
    }
    
    func showFullStatistic(viewState: MainViewDataFlow.CountriesTotalStatisticCase.ViewModel) {
        switch viewState.result {
        case .success(infected: let infect, deceased: let deces, recovered: let recov):
            self.infectedValue.text = infect
            self.deceasedValue.text = deces
            self.recoveredValue.text = recov
        case .failure(err: let err):break
        }
    }
    
    
}

extension ViewController: TestDataStoreProtocols{
    func requestResultTest(positive: Int) {
        createSendTestResult(count: positive)
        collectionTest.scrollToItem(at: IndexPath(row: 0, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    func scrollToNext(index:IndexPath) {
            collectionTest.isScrollEnabled = true
        collectionTest.isUserInteractionEnabled = false
            collectionTest.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.collectionTest.isUserInteractionEnabled = true
        }
    }
    
    
}



