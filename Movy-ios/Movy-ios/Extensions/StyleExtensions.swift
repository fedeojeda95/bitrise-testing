//
//  StyleExtensions.swift
//  Movy-ios
//
//  Created by Fernando de la Fuente on 6/4/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//
import UIKit

extension UIColor {

    @nonobjc class var movyWhite: UIColor {
        return UIColor(white: 1.0, alpha: 1.0)
    }

    @nonobjc class var movyMainSkyBlue: UIColor {
        return UIColor(red: 5.0 / 255.0, green: 120.0 / 255.0, blue: 1.0, alpha: 1.0)
    }

    @nonobjc class var movyBlack: UIColor {
        return UIColor(white: 15.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var movyYellowStar: UIColor {
        return UIColor(red: 1.0, green: 208.0 / 255.0, blue: 0.0, alpha: 1.0)
    }

    @nonobjc class var movyGrey: UIColor {
        return UIColor(white: 59.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var movyGreyBody: UIColor {
        return UIColor(white: 215.0 / 255.0, alpha: 1.0)
    }
}

extension UIFont {

    class var movyHeader1Text: UIFont {
        return UIFont.systemFont(ofSize: 38.78, weight: .semibold)
    }

    class var movyHeader2Text: UIFont {
        return UIFont.systemFont(ofSize: 13.69, weight: .semibold)
    }

    class var movyHeader3Text: UIFont {
        return UIFont.systemFont(ofSize: 17.0, weight: .regular)
    }

    class var movyBodyTitle: UIFont {
        return UIFont(name: Constants.FontNames.sfProDisplayBold, size: 17.0)!
    }

    class var movyBodyText: UIFont {
        return UIFont(name: Constants.FontNames.sfProDisplayRegular, size: 16.0)!
    }

    class var movySectionButtonText: UIFont {
        return UIFont.systemFont(ofSize: 14.0, weight: .regular)
    }

    class var movyLogoTopBar: UIFont {
        return UIFont(name: Constants.FontNames.exoSemiBold, size: 30.0)!
    }

    class var smallTextButton: UIFont {
        return UIFont(name: Constants.FontNames.sfProDisplayMedium, size: 13.7)!
    }

    class var tryNowButtonFont: UIFont {
        return UIFont(name: Constants.FontNames.sfProDisplayMedium, size: 21.4)!
    }

    class var barTitle: UIFont {
        return UIFont(name: Constants.FontNames.sfProDisplayRegular, size: 18.0)!
    }

    class var profileSection: UIFont {
        return UIFont(name: Constants.FontNames.sfProDisplayBold, size: 18.0)!
    }

    class var hdViewFont: UIFont {
        return UIFont(name: Constants.FontNames.sfProDisplayBold, size: 13.8)!
    }
}
