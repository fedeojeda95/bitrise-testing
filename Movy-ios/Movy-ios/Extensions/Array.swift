//
//  Array.swift
//  Movy-ios
//
//  Created by Fernando de la Fuente on 6/10/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import Foundation

extension Array {
    func item(at index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
