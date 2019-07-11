//
//  SearchResultTableCell.swift
//  Movy-ios
//
//  Created by Fernando de la Fuente on 6/12/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import UIKit
import Kingfisher
import Cosmos

class SearchResultTableCell: UITableViewCell {

    var movie: Movie? {
        didSet {
            updateCell()
            setNeedsDisplay()
        }
    }

    static let identifier = "SearchResultTableCell"

    private let movieImage: UIImageView = {
        let view = UIImageView(image: #imageLiteral(resourceName: "sample_moovie_poster"))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()

    private let movieTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.movyBodyText
        label.textColor = UIColor.movyWhite
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()

    private let ratingView: CosmosView = {
        let view = CosmosView()
        view.settings.updateOnTouch = false
        view.settings.filledColor = UIColor.movyYellowStar
        view.settings.emptyBorderColor = UIColor.movyYellowStar
        view.settings.filledBorderColor = UIColor.movyYellowStar
        view.settings.starSize = 15
        view.settings.totalStars = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let playButton: UIImageView = {
        let view = UIImageView(image: #imageLiteral(resourceName: "play_icon"))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        setupLayout()
    }

    private func setupView() {
        backgroundColor = .black
        clipsToBounds = true
        selectionStyle = .none

        addSubview(movieImage)
        addSubview(movieTitle)
        addSubview(ratingView)
        addSubview(playButton)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            movieImage.heightAnchor.constraint(equalToConstant: CellConstants.MovieImage.height),
            movieImage.widthAnchor.constraint(equalToConstant: CellConstants.MovieImage.width),
            movieImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CellConstants.leftMargin),
            movieImage.topAnchor.constraint(equalTo: topAnchor),

            movieTitle.leadingAnchor.constraint(
                equalTo: movieImage.trailingAnchor,
                constant: CellConstants.MovieTitle.leftMargin
            ),
            movieTitle.topAnchor.constraint(equalTo: topAnchor, constant: CellConstants.MovieTitle.topMargin),
            movieTitle.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: CellConstants.MovieTitle.rightMargin
            ),

            ratingView.topAnchor.constraint(
                equalTo: movieTitle.bottomAnchor,
                constant: CellConstants.RatingView.topMargin
            ),
            ratingView.leadingAnchor.constraint(
                equalTo: movieImage.trailingAnchor,
                constant: CellConstants.RatingView.leftMargin
            ),

            playButton.heightAnchor.constraint(equalToConstant: CellConstants.PlayButton.height),
            playButton.widthAnchor.constraint(equalToConstant: CellConstants.PlayButton.height),
            playButton.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: CellConstants.PlayButton.marginRight
            ),
            playButton.topAnchor.constraint(
                equalTo: movieTitle.bottomAnchor,
                constant: CellConstants.PlayButton.topMargin
            )
        ])
    }

    private func updateCell() {
        guard let movie = movie else { return }

        movieTitle.text = movie.title

        guard let imageURL = movie.posterPath else {
            movieImage.image = #imageLiteral(resourceName: "no_movie_poster")
            return
        }
        let url = URL(string: "\(Constants.Network.imageBaseURL)\(imageURL)")
        movieImage.kf.setImage(with: url, options: [.transition(.fade(0.2))])

        ratingView.rating = convertVoteAverageToScaleOf5(value: movie.voteAverage)
    }

    private func convertVoteAverageToScaleOf5(value: Double) -> Double {
        guard value != 0 else { return 0}
        return (value/10)*5
    }
}

private struct CellConstants {
    static let leftMargin: CGFloat = 15

    struct MovieImage {
        static let height: CGFloat = 87
        static let width: CGFloat = 158
    }

    struct MovieTitle {
        static let topMargin: CGFloat = 15
        static let leftMargin: CGFloat = 31
        static let rightMargin: CGFloat = -25
    }

    struct RatingView {
        static let topMargin: CGFloat = 13.2
        static let leftMargin: CGFloat = 31
    }

    struct PlayButton {
        static let height: CGFloat = 17
        static let marginRight: CGFloat = -25
        static let topMargin: CGFloat = 13.2
    }
}
