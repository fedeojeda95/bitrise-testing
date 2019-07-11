//
//  MovieGallery.swift
//  Movy-ios
//
//  Created by Fernando de la Fuente on 6/11/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import UIKit

class MovieGallery: UIView {
    private(set) var movies: [Movie] = [] {
        didSet {
            collection.reloadData()
        }
    }
    private var collection: UICollectionView!

    weak var movieGalleryDelegate: MovieGalleryDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = MovieGalleryConstants.collectionCellSpacing

        collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.register(
            HomeMovieCollectionViewCell.self,
            forCellWithReuseIdentifier: HomeMovieCollectionViewCell.identifier
        )

        collection.backgroundColor = .black
        collection.contentInset = UIEdgeInsets(
            top: 0,
            left: MovieGalleryConstants.collectionLeftInset,
            bottom: 0,
            right: 0
        )
        collection.translatesAutoresizingMaskIntoConstraints = false

        addSubview(collection)

        NSLayoutConstraint.activate([
            collection.leadingAnchor.constraint(equalTo: leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: trailingAnchor),
            collection.topAnchor.constraint(equalTo: topAnchor),
            collection.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }

    func addOrRemoveMovieFromCollection(movie: Movie) {
        if movies.contains(movie) {
            guard let index = movies.firstIndex(of: movie) else { return }
            movies.remove(at: index)
        } else {
            movies.append(movie)
        }
    }

    func setDataSource(data: [Movie]) {
        movies = data
    }
}

extension MovieGallery: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
        -> UICollectionViewCell {

            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: HomeMovieCollectionViewCell.identifier,
                for: indexPath
            )

            guard let homeMovieCell = cell as? HomeMovieCollectionViewCell else { return cell }

            let movie = movies[indexPath.item]
            homeMovieCell.imageURL = movie.posterPath

            return homeMovieCell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: MovieGalleryConstants.cellWidth, height: MovieGalleryConstants.cellHeight)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = movies[indexPath.item]
        movieGalleryDelegate?.onMovieTapEvent(movie: movie)
    }
}

private struct MovieGalleryConstants {
    static let cellWidth: CGFloat = 85.6
    static let cellHeight: CGFloat = 147.3
    static let collectionLeftInset: CGFloat = 34
    static let collectionCellSpacing: CGFloat = 20
}
