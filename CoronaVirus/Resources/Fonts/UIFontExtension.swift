//
//  UIFontExtension.swift
//  Lejka
//
//  Created by Nikita Nikitsky on 01/08/2019.
//  Copyright © 2019 Lejka. All rights reserved.
//

import UIKit

extension UIFont {
    
    open class func euclidFlex(ofSize fontSize: CGFloat, weight: UIFont.Weight = .regular) -> UIFont
    {
        switch weight {
        case .light:
            return UIFont(name: "EuclidFlex-Light", size: fontSize)!
        case .regular:
            return UIFont(name: "EuclidFlex-Regular", size: fontSize)!
        case .medium:
            return UIFont(name: "EuclidFlex-Medium", size: fontSize)!
        case .semibold:
            return UIFont(name: "EuclidFlex-SemiBold", size: fontSize)!
        case .bold:
            return UIFont(name: "EuclidFlex-Bold", size: fontSize)!
        default:
            return UIFont(name: "EuclidFlex-Regular", size: fontSize)!
        }
    }
    
    open class func sourcesanspro(ofSize fontSize: CGFloat, weight: UIFont.Weight = .regular) -> UIFont
    {
        switch weight {
        case .light:
            return UIFont(name: "EuclidFlex-Light", size: fontSize)!
        case .regular:
            return UIFont(name: "sourcesanspro_regular", size: fontSize)!
        case .medium:
            return UIFont(name: "EuclidFlex-Medium", size: fontSize)!
        case .semibold:
            return UIFont(name: "EuclidFlex-SemiBold", size: fontSize)!
        case .bold:
            return UIFont(name: "SourceSansPro-Bold", size: fontSize)!
        default:
            return UIFont(name: "sourcesanspro_regular", size: fontSize)!
        }
    }
    
    open class func ocrA(ofSize fontSize: CGFloat, weight: UIFont.Weight = .regular) -> UIFont
    {
        switch weight {
        case .regular:
            return UIFont(name: "OCR-ARegular", size: fontSize)!
        default:
            return UIFont(name: "OCR-ARegular", size: fontSize)!
        }
    }
    
}
