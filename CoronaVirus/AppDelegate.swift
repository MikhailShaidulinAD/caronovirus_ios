//
//  AppDelegate.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 12.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import UIKit
import GoogleMaps
import SlideMenuControllerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
        private let apiKeyGoogleMaps = "AIzaSyCviEslXpqKakPE2rcnItNT2SnjydSKcro"

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupGoogleMaps()
//        self.window = UIWindow(frame: UIScreen.main.bounds)
//        let storyboardMain = UIStoryboard(name: "Main", bundle: nil)
//        let storyboardHome = UIStoryboard(name: "Home", bundle: nil)
////        let navigation = UINavigationController()
//        let initialViewControllerHome = storyboardHome.instantiateViewController(withIdentifier: "HomeController") as! HomeController
//        let initialViewController = storyboardMain.instantiateViewController(withIdentifier: "ViewController") as! ViewController
////        navigation.viewControllers.append(initialViewController)
////        navigation.isNavigationBarHidden = true
////        self.window?.rootViewController = navigation
////        self.window?.makeKeyAndVisible()
//        let slideMenuController = SlideMenuController(mainViewController: initialViewController, leftMenuViewController: initialViewControllerHome)
        let mainVC = NavigationBottomMenu()
        self.window?.rootViewController = mainVC
        self.window?.makeKeyAndVisible()

        
        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return true
    }
}

extension AppDelegate{
    
    private func setupGoogleMaps() {
        GMSServices.provideAPIKey(apiKeyGoogleMaps)
    }
}

