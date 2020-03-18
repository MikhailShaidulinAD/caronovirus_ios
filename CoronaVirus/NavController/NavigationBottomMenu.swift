//
//  NavigationBottomMenu.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 16.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import UIKit

class NavigationBottomMenu: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        delegate = self
    }
    
    private func setupTabBar(){
        tabBar.barTintColor = UIColor(red: 250/255, green: 248/255, blue: 243/255, alpha: 1)
         let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let mapController = UINavigationController(rootViewController: vc)
        mapController.tabBarItem.image = UIImage(named: "bar_map")
        mapController.tabBarItem.selectedImage = UIImage(named: "bar_map")?.imageWithColor(color1: UIColor(red: 52/255, green: 120/255, blue: 246/255, alpha: 1))
        mapController.tabBarItem.title = "Map"
        let newsController = UINavigationController(rootViewController: NewsViewController())
        newsController.tabBarItem.image = UIImage(named: "bar_news")
        newsController.tabBarItem.selectedImage = UIImage(named: "bar_news")?.imageWithColor(color1: UIColor(red: 52/255, green: 120/255, blue: 246/255, alpha: 1))
        newsController.tabBarItem.title = "News"
        let faqController = UINavigationController(rootViewController: FaqViewController())
        faqController.tabBarItem.image = UIImage(named: "bar_quest")
        faqController.tabBarItem.selectedImage = UIImage(named: "bar_quest")?.imageWithColor(color1: UIColor(red: 52/255, green: 120/255, blue: 246/255, alpha: 1))
        faqController.tabBarItem.title = "Info"
        let vcProfile = UIStoryboard(name: "ProfileView", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        let profileController = UINavigationController(rootViewController: vcProfile)
        profileController.tabBarItem.image = UIImage(named: "bar_profile")
        profileController.tabBarItem.selectedImage = UIImage(named: "bar_profile")?.imageWithColor(color1: UIColor(red: 52/255, green: 120/255, blue: 246/255, alpha: 1))
        profileController.tabBarItem.title = "Profile"
        
        viewControllers = [mapController, faqController, newsController, profileController]
    }
}

extension NavigationBottomMenu: UITabBarControllerDelegate  {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {

        guard let fromView = selectedViewController?.view, let toView = viewController.view else {
          return false // Make sure you want this as false
        }

        if fromView != toView {
          UIView.transition(from: fromView, to: toView, duration: 0.3, options: [.transitionFlipFromLeft], completion: nil)
        }

        return true
    }
}
