//
//  MovieGalleryDelegate.swift
//  Movy-ios
//
//  Created by Fernando de la Fuente on 6/11/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import Foundation

protocol MovieGalleryDelegate: class {
    func onMovieTapEvent(movie: Movie)
}
