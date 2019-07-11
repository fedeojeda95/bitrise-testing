//
//  MyListViewController.swift
//  Movy-ios
//
//  Created by Fernando de la Fuente on 6/6/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import UIKit
import RxRealm
import RxSwift
import RxCocoa

class MyListViewController: UIViewController {

    private(set) var movies: [Movie] = [] {
        didSet {
            guard let collection = collection else { return }
            collection.reloadData()
        }
    }

    var myList: MyList?

    private var collection: UICollectionView?

    private let disposeBag = DisposeBag()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.Home.myList
        label.textColor = UIColor.movyWhite
        label.font = UIFont.barTitle
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
        loadMyList()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    private func setupView() {
        view.accessibilityIdentifier = AccessibilityConstants.MyList.myListView

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = MyListConstants.collectionCellSpacing

        collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collection = collection else { return }

        collection.alwaysBounceVertical = true
        collection.delegate = self
        collection.register(
            HomeMovieCollectionViewCell.self,
            forCellWithReuseIdentifier: HomeMovieCollectionViewCell.identifier
        )
        collection.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(titleLabel)
        view.addSubview(collection)
    }

    private func setupLayout() {
        guard let collection = collection else { return }

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: MyListConstants.TitleLabel.topMargin
            ),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: MyListConstants.TitleLabel.heigth),

            collection.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: MyListConstants.Collection.topMargin
            ),
            collection.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: MyListConstants.Collection.leftMargin
            ),
            collection.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: MyListConstants.Collection.rightMargin
            ),
            collection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    private func loadMyList() {
        let myList = retrieveMyListFromDb()
        guard
            let list = myList,
            let collection = collection
        else { return }

        Observable.collection(from: list.movies)
            .bind(to: collection.rx.items) { (collectionView, index, movie) in
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: HomeMovieCollectionViewCell.identifier,
                    for: IndexPath(item: index, section: 1)
                )

                guard let movieCell = cell as? HomeMovieCollectionViewCell else { return cell }
                movieCell.imageURL = movie.posterPath
                return cell
            }
            .disposed(by: disposeBag)
    }

    private func retrieveMyListFromDb() -> MyList? {
        return RealmManager().objects(MyList.self)?.filter {
            $0.userId == 0
            }.first
    }
}

extension MyListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: MyListConstants.cellWidth, height: MyListConstants.cellHeight)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {}
}

private struct MyListConstants {
    static let cellWidth: CGFloat = 108.3
    static let cellHeight: CGFloat = 186.2
    static let collectionCellSpacing: CGFloat = 5

    struct Collection {
        static let topMargin: CGFloat = 90
        static let leftMargin: CGFloat = 22
        static let rightMargin: CGFloat = -22
    }

    struct TitleLabel {
        static let heigth: CGFloat = 20
        static let topMargin: CGFloat = 27
    }
}
