// swiftlint:disable force_cast
//
//  GradientView.swift
//  Movy-ios
//
//  Created by Fernando de la Fuente on 6/6/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import UIKit

class TopOpaqueGradientView: UIView {
    override open class var layerClass: AnyClass {
        return CAGradientLayer.classForCoder()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setGradient()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setGradient()
    }

    private func setGradient() {
        let gradientLayer = layer as! CAGradientLayer
        gradientLayer.colors = [UIColor.black.cgColor, UIColor.clear.cgColor]
    }
}
