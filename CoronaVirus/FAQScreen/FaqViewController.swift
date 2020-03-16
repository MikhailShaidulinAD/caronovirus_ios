//
//  FaqViewController.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 16.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import UIKit

class FaqViewController: UIViewController {
    
    let titleTest:UILabel = {
           let view = UILabel()
           view.translatesAutoresizingMaskIntoConstraints = false
           view.text = "What is “coronavirus”?"
           view.textColor = UIColor(red: 1, green: 0.647, blue: 0, alpha: 1)
           view.textAlignment = .center
           view.font = UIFont(name: "sourcesanspro_bold", size: 16)
           return view
       }()
       
       let descriptionAboutOne:UILabel = {
           let view = UILabel()
           view.translatesAutoresizingMaskIntoConstraints = false
           view.text = "Coronaviruses refer to a family of viruses which cause different diseases by humans- from a usual cold to severe acute respiratory syndrome. \nThe name “coronavirus” is derived from the spin-like appendices on its cover, which resemble a crown"
           view.textColor = .black
           view.textAlignment = .left
           view.numberOfLines = 0
           view.font = UIFont(name: "sourcesanspro_bold", size: 16)
           return view
       }()
       
       let titleAboutTwo:UILabel = {
           let view = UILabel()
           view.translatesAutoresizingMaskIntoConstraints = false
           view.text = "Possible transmission mechanisms"
           view.textColor = UIColor(red: 1, green: 0.647, blue: 0, alpha: 1)
           view.textAlignment = .center
           view.font = UIFont(name: "sourcesanspro_bold", size: 16)
           return view
       }()
       let titleAboutThree:UILabel = {
           let view = UILabel()
           view.translatesAutoresizingMaskIntoConstraints = false
           view.text = "Covid-19"
           view.textColor = UIColor(red: 1, green: 0.647, blue: 0, alpha: 1)
           view.textAlignment = .center
           view.font = UIFont(name: "sourcesanspro_bold", size: 16)
           return view
       }()
       let titleAboutFour:UILabel = {
           let view = UILabel()
           view.translatesAutoresizingMaskIntoConstraints = false
           view.text = "Symptoms of coronavirus"
           view.textColor = UIColor(red: 1, green: 0.647, blue: 0, alpha: 1)
           view.textAlignment = .center
           view.font = UIFont(name: "sourcesanspro_bold", size: 16)
           return view
       }()

       let titleAboutFive:UILabel = {
           let view = UILabel()
           view.translatesAutoresizingMaskIntoConstraints = false
           view.text = "Measures of prevention of coronavirus"
           view.textColor = UIColor(red: 1, green: 0.647, blue: 0, alpha: 1)
           view.textAlignment = .center
           view.font = UIFont(name: "sourcesanspro_bold", size: 16)
           return view
       }()

       
       let descriptionAboutTwo:UILabel = {
           let view = UILabel()
           view.translatesAutoresizingMaskIntoConstraints = false
           view.text = "Possible transmission mechanisms\nThe source of coronavirus infection might be both an infected human and an animal. Some coronaviruses get infectious even before expression of its symptoms.\nThis disease is transmitted in the following ways-\n\u{2022}By airborne transmission\n\u{2022}By air and dust transmission\n\u{2022}By fecal and oral transmission\n\u{2022}By the means of communication\nThe disease incidence rises in winter and spring. After recovery the immunity cannot protect against the re-infection."
           view.textColor = .black
           view.textAlignment = .left
           view.numberOfLines = 0
           view.font = UIFont(name: "sourcesanspro_bold", size: 16)
           return view
       }()
       let descriptionAboutThree:UILabel = {
           let view = UILabel()
           view.translatesAutoresizingMaskIntoConstraints = false
           view.text = "In December there occurred an outbreak of 2019-nCoV ( a new coronavirus, appeared in the year 2019), presumably originated from the sea products market of the city Wuchang, where also the bats and the snakes are sold.\nThe prevailing form of infection, triggered by this virus, is a respiratory infection. The intestinal form occurs much less often, mostly by children. An acute respiratory virus infection, caused by this virus, mostly lasts several days and concludes by the full recovery. Nevertheless, in some cases the ARVI might take the shape of atypical pneumonia or a severe acute respiratory syndrome (TORC). This pathology is characterised by a high lethal rate (38%) due to the accompanying acute respiratory failure.\nOn February 11, 2020 the World Health Organization attributed an official name to the new coronavirus- Covid-19."
           view.textColor = .black
           view.textAlignment = .left
           view.numberOfLines = 0
           view.font = UIFont(name: "sourcesanspro_bold", size: 16)
           return view
       }()
       let descriptionAboutFour:UILabel = {
           let view = UILabel()
           view.translatesAutoresizingMaskIntoConstraints = false
           view.text = "The incubative stage of coronavirus Covid-19 may last up to 2 weeks. The longer durations of an incubative stage might occur by transmission of the virus from animals.\nThe symptoms of coronavirus Covid-19 resemble the symptoms of pneumonia or a severe acute respiratory syndrome-\n\u{2022}Loss of consciousness\n\u{2022}Dry non-productive cough\n\u{2022}Fever and increased temperature\n\u{2022}Difficulties by breathing\n\u{2022}Pain in the chest area\n\u{2022}Headache\n\u{2022}Pain in muscles\n\u{2022}General sickness"
           view.textColor = .black
           view.textAlignment = .left
           view.numberOfLines = 0
           view.font = UIFont(name: "sourcesanspro_bold", size: 16)
           return view
       }()
       let descriptionAboutFive:UILabel = {
           let view = UILabel()
           view.translatesAutoresizingMaskIntoConstraints = false
           view.text = "\n\u{2022}Wash your hands with soap often during at least 20 seconds.\n\u{2022}Do not touch eyes, mouth and mucous membrane with dirty hands.\n\u{2022}Avoid a close contact with infected people.\n\u{2022}Use the wet sweeping with the disinfecting agents more frequently\n\u{2022}Specify the epidemiologic situation by planning the voyage.\n\u{2022}Use the masks to protect the organs of respiration\n\u{2022}Apply for the medical care in the dedicated organisations by the first symptoms of disease."
           view.textColor = .black
           view.textAlignment = .left
           view.numberOfLines = 0
           view.font = UIFont(name: "sourcesanspro_bold", size: 16)
           return view
       }()
       
       lazy var scrollView:UIScrollView = {
           let view = UIScrollView()
           view.isScrollEnabled = true
           view.translatesAutoresizingMaskIntoConstraints = false
           view.contentSize.height = self.view.frame.height
           return view
       }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
    }
    
    private func setupViews(){
        self.view.addSubview(scrollView)
        self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        self.scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        self.scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
               self.scrollView.addSubview(titleTest)
               titleTest.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 22).isActive = true
               titleTest.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor, constant: 0).isActive = true
               titleTest.leftAnchor.constraint(equalTo: self.scrollView.leftAnchor, constant: 16).isActive = true
               titleTest.rightAnchor.constraint(equalTo: self.scrollView.rightAnchor, constant: -16).isActive = true
               self.scrollView.addSubview(descriptionAboutOne)
               descriptionAboutOne.topAnchor.constraint(equalTo: self.titleTest.bottomAnchor, constant: 16).isActive = true
               descriptionAboutOne.leftAnchor.constraint(equalTo: self.scrollView.leftAnchor, constant: 16).isActive = true
               descriptionAboutOne.rightAnchor.constraint(equalTo: self.scrollView.rightAnchor, constant: -16).isActive = true
               self.scrollView.addSubview(titleAboutTwo)
               titleAboutTwo.topAnchor.constraint(equalTo: self.descriptionAboutOne.bottomAnchor, constant: 16).isActive = true
               titleAboutTwo.leftAnchor.constraint(equalTo: self.scrollView.leftAnchor, constant: 16).isActive = true
               titleAboutTwo.rightAnchor.constraint(equalTo: self.scrollView.rightAnchor, constant: -16).isActive = true
               self.scrollView.addSubview(descriptionAboutTwo)
               descriptionAboutTwo.topAnchor.constraint(equalTo: self.titleAboutTwo.bottomAnchor, constant: 16).isActive = true
               descriptionAboutTwo.leftAnchor.constraint(equalTo: self.scrollView.leftAnchor, constant: 16).isActive = true
               descriptionAboutTwo.rightAnchor.constraint(equalTo: self.scrollView.rightAnchor, constant: -16).isActive = true
               self.scrollView.addSubview(titleAboutThree)
               titleAboutThree.topAnchor.constraint(equalTo: self.descriptionAboutTwo.bottomAnchor, constant: 16).isActive = true
               titleAboutThree.leftAnchor.constraint(equalTo: self.scrollView.leftAnchor, constant: 16).isActive = true
               titleAboutThree.rightAnchor.constraint(equalTo: self.scrollView.rightAnchor, constant: -16).isActive = true
               self.scrollView.addSubview(descriptionAboutThree)
               descriptionAboutThree.topAnchor.constraint(equalTo: self.titleAboutThree.bottomAnchor, constant: 16).isActive = true
               descriptionAboutThree.leftAnchor.constraint(equalTo: self.scrollView.leftAnchor, constant: 16).isActive = true
               descriptionAboutThree.rightAnchor.constraint(equalTo: self.scrollView.rightAnchor, constant: -16).isActive = true
               self.scrollView.addSubview(titleAboutFour)
               titleAboutFour.topAnchor.constraint(equalTo: self.descriptionAboutThree.bottomAnchor, constant: 16).isActive = true
               titleAboutFour.leftAnchor.constraint(equalTo: self.scrollView.leftAnchor, constant: 16).isActive = true
               titleAboutFour.rightAnchor.constraint(equalTo: self.scrollView.rightAnchor, constant: -16).isActive = true
               self.scrollView.addSubview(descriptionAboutFour)
               descriptionAboutFour.topAnchor.constraint(equalTo: self.titleAboutFour.bottomAnchor, constant: 16).isActive = true
               descriptionAboutFour.leftAnchor.constraint(equalTo: self.scrollView.leftAnchor, constant: 16).isActive = true
               descriptionAboutFour.rightAnchor.constraint(equalTo: self.scrollView.rightAnchor, constant: -16).isActive = true
               self.scrollView.addSubview(titleAboutFive)
               titleAboutFive.topAnchor.constraint(equalTo: self.descriptionAboutFour.bottomAnchor, constant: 16).isActive = true
               titleAboutFive.leftAnchor.constraint(equalTo: self.scrollView.leftAnchor, constant: 16).isActive = true
               titleAboutFive.rightAnchor.constraint(equalTo: self.scrollView.rightAnchor, constant: -16).isActive = true
               self.scrollView.addSubview(descriptionAboutFive)
               descriptionAboutFive.topAnchor.constraint(equalTo: self.titleAboutFive.bottomAnchor, constant: 16).isActive = true
               descriptionAboutFive.leftAnchor.constraint(equalTo: self.scrollView.leftAnchor, constant: 16).isActive = true
               descriptionAboutFive.rightAnchor.constraint(equalTo: self.scrollView.rightAnchor, constant: -16).isActive = true
               DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                   self.scrollView.contentSize.height = self.descriptionAboutFive.frame.maxY
                   self.view.layoutIfNeeded()
               }
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

}
