//
//  HomeViewController.swift
//  Movy-ios
//
//  Created by Fernando de la Fuente on 6/6/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import UIKit
import Kingfisher
import Realm
import RealmSwift
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {

    let disposeBag = DisposeBag()

    var mainMovie: Movie? {
        didSet { updateMainMovie() }
    }

    var myList: MyList?

    private let trendingMoviesCollectionView = MovieGallery()
    private let recentlyAddedMoviesCollectionView = MovieGallery()
    private let myListCollectionView = MovieGallery()

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .clear
        return scrollView
    }()

    private let scrollViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = HomeConstants.scrollViewContainerStackSpacing
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let topView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let movyLogoView: MovyLogo = {
        let movyLogoView = MovyLogo()
        movyLogoView.translatesAutoresizingMaskIntoConstraints = false
        return movyLogoView
    }()

    private let backgroundImage: UIImageViewAligned = {
        let imageView = UIImageViewAligned(image: #imageLiteral(resourceName: "sample_moovie_poster"))
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.alignTop = true
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let bottomGradientView: BottomOpaqueGradientView = {
        let view = BottomOpaqueGradientView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let topGradientView: TopOpaqueGradientView = {
        let view = TopOpaqueGradientView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var genresStack: MoovieGenresStack = {
        let genres = MoovieGenresStack()
        genres.translatesAutoresizingMaskIntoConstraints = false
        return genres
    }()

    private let movyOriginalButton: MovyButton = {
        let button = MovyButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.Home.movyOriginalButton, for: .normal)
        return button
    }()

    private let addToListButton = ActionButton(iconImage: #imageLiteral(resourceName: "plus_icon"), text: Constants.Home.myList)
    private let playButton = ActionButton(iconImage: #imageLiteral(resourceName: "play_icon"), text: Constants.Home.playButton)
    private let infoButton = ActionButton(iconImage: #imageLiteral(resourceName: "info_icon"), text: Constants.Home.infoButton)

    private let buttonsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private func createHeaderLabel(text: String) -> InsetLabel {
        let textLabel = InsetLabel()
        textLabel.contentInsets = UIEdgeInsets(top: 0, left: HomeConstants.collectionHeaderLeftInset,
            bottom: 0, right: 0)
        textLabel.textColor = UIColor.movyWhite
        textLabel.font = UIFont.movyBodyTitle
        textLabel.text = text
        textLabel.sizeToFit()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
        loadMyList()
        loadTrendingMovies()
        loadRecentlyAddedMovies()
    }

    private func loadMyList() {
        let myList = retrieveMyListFromDb()
        guard let list = myList else { return }

        myListCollectionView.setDataSource(data: Array(list.movies))
        self.myList = MyList()
        self.myList?.movies.append(objectsIn: list.movies)
    }

    private func retrieveMyListFromDb() -> MyList? {
        return RealmManager().objects(MyList.self)?.filter {
            $0.userId == 0
        }.first
    }

    private func loadTrendingMovies() {
        let movies = API.discoverMovies(page: 1)
        movies
            .subscribe(
                onNext: { [weak self] movies in
                    guard let self = self else { return }
                    let data = movies.filter({ $0.posterPath != nil })
                    self.trendingMoviesCollectionView.setDataSource(data: data)
                    self.mainMovie = self.trendingMoviesCollectionView.movies[0]
                },
                onError: { [weak self] error in
                    guard let self = self else { return }
                    self.showError(
                        title: Constants.Errors.apiCallErrorTitle,
                        description: "\(Constants.Errors.apiCallErrorTitle) \(error.localizedDescription)"
                    )
                }
            )
            .disposed(by: disposeBag)
    }

    private func loadRecentlyAddedMovies() {
        let movies = API.recentlyAddedMovies(page: 1)
        movies
            .subscribe(
                onNext: { [weak self] movies in
                    guard let self = self else { return }
                    let data = movies.filter({ $0.posterPath != nil })
                    self.recentlyAddedMoviesCollectionView.setDataSource(data: data)
            }, onError: { [weak self] error in
                guard let self = self else { return }
                self.showError(
                    title: Constants.Errors.apiCallErrorTitle,
                    description: "\(Constants.Errors.apiCallErrorTitle) \(error.localizedDescription)"
                )
            }).disposed(by: disposeBag)
    }

    private func updateMainMovie() {
        guard let mainMovie = mainMovie else { return }

        let genres = Array(mainMovie.genreIds)
            .compactMap { return Constants.genres[$0] }

        self.genresStack.setGenres(items: genres)

        let imagePath = mainMovie.posterPath!
        let url = URL(string: "\(Constants.Network.imageBaseURL)\(imagePath)")
        self.backgroundImage.realImageView?.kf.setImage(with: url, options: [.transition(.fade(0.2))])

        updateAddToListButton()
    }

    private func updateAddToListButton() {
        if myListCollectionView.movies.contains(mainMovie!) {
            addToListButton.imageView.image = #imageLiteral(resourceName: "minus_icon")
        } else {
            addToListButton.imageView.image = #imageLiteral(resourceName: "plus_icon")
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    private func setupView() {
        view.accessibilityIdentifier = AccessibilityConstants.Home.homeView

        buttonsStack.addArrangedSubview(addToListButton)
        buttonsStack.addArrangedSubview(playButton)
        buttonsStack.addArrangedSubview(infoButton)

        let tap = UITapGestureRecognizer(target: self, action: #selector(onTapAddToMyList))
        addToListButton.addGestureRecognizer(tap)

        trendingMoviesCollectionView.movieGalleryDelegate = self
        recentlyAddedMoviesCollectionView.movieGalleryDelegate = self
        myListCollectionView.movieGalleryDelegate = self

        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)

        scrollViewContainer.addArrangedSubview(topView)

        topView.addSubview(backgroundImage)
        topView.addSubview(topGradientView)
        topView.addSubview(movyLogoView)
        topView.addSubview(bottomGradientView)
        topView.addSubview(genresStack)
        topView.addSubview(movyOriginalButton)
        topView.addSubview(buttonsStack)

        let myListLabel = createHeaderLabel(text: Constants.Home.myList)
        let trendingNowLabel = createHeaderLabel(text: Constants.Home.trendingNow)
        let recentlyAddedLabel = createHeaderLabel(text: Constants.Home.recentlyAdded)

        scrollViewContainer.addArrangedSubview(myListLabel)
        scrollViewContainer.addArrangedSubview(myListCollectionView)
        scrollViewContainer.addArrangedSubview(trendingNowLabel)
        scrollViewContainer.addArrangedSubview(trendingMoviesCollectionView)
        scrollViewContainer.addArrangedSubview(recentlyAddedLabel)
        scrollViewContainer.addArrangedSubview(recentlyAddedMoviesCollectionView)

        scrollViewContainer.setCustomSpacing(55, after: topView)

        scrollViewContainer.setCustomSpacing(
            HomeConstants.scrollViewContainerStackCustomSpacing,
            after: myListCollectionView
        )
        scrollViewContainer.setCustomSpacing(
            HomeConstants.scrollViewContainerStackCustomSpacing,
            after: trendingMoviesCollectionView
        )

        let paddingView = UIView()
        scrollViewContainer.addArrangedSubview(paddingView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            topView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.75),
            topView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            myListCollectionView.leadingAnchor.constraint(equalTo: scrollViewContainer.leadingAnchor),
            myListCollectionView.trailingAnchor.constraint(equalTo: scrollViewContainer.trailingAnchor),
            myListCollectionView.heightAnchor.constraint(equalToConstant: HomeConstants.collectionViewHeight),

            trendingMoviesCollectionView.leadingAnchor.constraint(equalTo: scrollViewContainer.leadingAnchor),
            trendingMoviesCollectionView.trailingAnchor.constraint(equalTo: scrollViewContainer.trailingAnchor),
            trendingMoviesCollectionView.heightAnchor.constraint(equalToConstant: HomeConstants.collectionViewHeight),

            recentlyAddedMoviesCollectionView.leadingAnchor.constraint(equalTo: scrollViewContainer.leadingAnchor),
            recentlyAddedMoviesCollectionView.trailingAnchor.constraint(equalTo: scrollViewContainer.trailingAnchor),
            recentlyAddedMoviesCollectionView.heightAnchor.constraint(
                equalToConstant: HomeConstants.collectionViewHeight
            )
        ])

        setupTopViewConstraints()
    }

    private func setupTopViewConstraints() {
        NSLayoutConstraint.activate([
            movyLogoView.topAnchor.constraint(equalTo: topView.topAnchor),
            movyLogoView.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            movyLogoView.heightAnchor.constraint(equalToConstant: HomeConstants.movyLogoHeight),
            movyLogoView.widthAnchor.constraint(equalToConstant: HomeConstants.movyLogoWidth),

            topGradientView.widthAnchor.constraint(equalTo: topView.widthAnchor),
            topGradientView.heightAnchor.constraint(equalToConstant: 200),
            topGradientView.topAnchor.constraint(equalTo: topView.topAnchor),
            topGradientView.leadingAnchor.constraint(equalTo: topView.leadingAnchor),

            backgroundImage.heightAnchor.constraint(equalTo: topView.heightAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
            backgroundImage.topAnchor.constraint(equalTo: topView.topAnchor),

            bottomGradientView.heightAnchor.constraint(equalTo: backgroundImage.heightAnchor, multiplier: 0.5),
            bottomGradientView.widthAnchor.constraint(equalTo: topView.widthAnchor),
            bottomGradientView.bottomAnchor.constraint(equalTo: topView.bottomAnchor),
            bottomGradientView.leadingAnchor.constraint(equalTo: topView.leadingAnchor),

            buttonsStack.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.75),
            buttonsStack.heightAnchor.constraint(equalToConstant: 74),
            buttonsStack.bottomAnchor.constraint(equalTo: topView.bottomAnchor),
            buttonsStack.centerXAnchor.constraint(equalTo: topView.centerXAnchor),

            movyOriginalButton.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            movyOriginalButton.heightAnchor.constraint(equalToConstant: 28),
            movyOriginalButton.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.70),
            movyOriginalButton.bottomAnchor.constraint(equalTo: buttonsStack.topAnchor, constant: -56),

            genresStack.heightAnchor.constraint(equalToConstant: 20),
            genresStack.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            genresStack.bottomAnchor.constraint(equalTo: movyOriginalButton.topAnchor, constant: -25)
            ])
    }

    @objc func onTapAddToMyList() {
        guard
            let mainMovie = mainMovie
        else { return }

        myListCollectionView.addOrRemoveMovieFromCollection(movie: mainMovie)
        addOrDeleteToMyListInDb()
    }

    private func addOrDeleteToMyListInDb() {
        myList = RealmManager().objects(MyList.self)?.filter {
            $0.userId == 0
        }.first

        guard
            let myList = myList,
            let mainMovie = mainMovie
        else { return }

        let newMyList = MyList()
        newMyList.movies.append(objectsIn: myList.movies)

        if newMyList.movies.contains(mainMovie) {
            guard let index = newMyList.movies.index(of: mainMovie) else { return }
            newMyList.movies.remove(at: index)
        } else {
            newMyList.movies.append(mainMovie)
        }
        RealmManager().add(newMyList)
        self.myList = newMyList

        updateAddToListButton()
    }
}

private struct HomeConstants {
    static let scrollViewContainerStackSpacing: CGFloat = 24
    static let scrollViewContainerStackCustomSpacing: CGFloat = 40
    static let collectionHeaderLeftInset: CGFloat = 30
    static let collectionViewHeight: CGFloat = 148
    static let movyLogoHeight: CGFloat = 50
    static let movyLogoWidth: CGFloat = 80
}

extension HomeViewController: MovieGalleryDelegate {
    func onMovieTapEvent(movie: Movie) {
        mainMovie = movie
    }
}
