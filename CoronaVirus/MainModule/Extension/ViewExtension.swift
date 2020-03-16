//
//  ViewExtension.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 14.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import UIKit

extension UIView {
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        mask.backgroundColor = UIColor.black.cgColor
        layer.mask = mask
    }
    
    func addDarkShadow(){
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 1
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.21).cgColor
    }
}
