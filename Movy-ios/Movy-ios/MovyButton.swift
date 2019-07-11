//
//  MovyButton.swift
//  Movy-ios
//
//  Created by Fernando de la Fuente on 6/5/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//
import UIKit

class MovyButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        layer.cornerRadius = MovyButtonConstants.cornerRadius
        setTitleColor(UIColor.movyWhite, for: .normal)
        backgroundColor = UIColor.movyMainSkyBlue
    }
}

private struct MovyButtonConstants {
    static let cornerRadius: CGFloat = 5
}
