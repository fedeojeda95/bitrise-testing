//
//  TableView.swift
//  Movy-ios
//
//  Created by Fernando de la Fuente on 6/13/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import UIKit

extension UITableView {
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(
            frame: CGRect(
                x: 0,
                y: 0,
                width: self.bounds.size.width,
                height: self.bounds.size.height
            )
        )
        messageLabel.text = message
        messageLabel.textColor = UIColor.movyWhite
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont.movyBodyText
        messageLabel.sizeToFit()

        backgroundView = messageLabel
        separatorStyle = .none
    }

    func restore() {
        backgroundView = nil
        separatorStyle = .singleLine
    }
}
