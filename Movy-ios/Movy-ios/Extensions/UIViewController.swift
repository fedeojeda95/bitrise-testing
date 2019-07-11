//
//  UIViewController.swift
//  Movy-ios
//
//  Created by Fernando de la Fuente on 6/14/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import UIKit

extension UIViewController {
     func showError(title: String, description: String) {
        let alert = UIAlertController(
            title: title,
            message: description,
            preferredStyle: .alert
        )
        self.present(alert, animated: true)
    }
}
