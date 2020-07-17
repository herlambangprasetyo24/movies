//
//  MoviesInformationTableViewCell.swift
//  Movies
//
//  Created by Herlambang Prasetyo on 16/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import UIKit

class MoviesInformationTableViewCell: UITableViewCell {
    
    typealias SelectFavouriteMovieClosure = () -> Void

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!
    
    private var movieDetailViewParams = MovieDetailViewParams()
    private var onSelectFavouriteMovie: SelectFavouriteMovieClosure = { }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
    
    static func cellReuseIdentifier() -> String {
        return String(describing: self)
    }
    
    func set(onSelectFavouriteMovie: @escaping SelectFavouriteMovieClosure) {
        self.onSelectFavouriteMovie = onSelectFavouriteMovie
    }
    
    func setupUI(movieDetailViewParams: MovieDetailViewParams) {
        self.movieDetailViewParams = movieDetailViewParams
        movieImageView.loadUrl("https://image.tmdb.org/t/p/w500" + movieDetailViewParams.backdropPath)
        movieTitleLabel.text = movieDetailViewParams.title
        movieReleaseDate.text = "Release: \(movieDetailViewParams.releaseDate)"
        movieRatingLabel.text = "Rating: \(movieDetailViewParams.voteAverage)"
        movieOverviewLabel.text = movieDetailViewParams.overview
        setFavouriteButtonTitle()
    }
    
    private func setFavouriteButtonTitle() {
        let imageName = movieDetailViewParams.isFavourite ? "fav_active" : "fav_inactive"
        favouriteButton.setImage(UIImage(named: imageName), for: .normal)
    }

    @IBAction func favouriteButtonAction(_ sender: Any) {
        onSelectFavouriteMovie()
    }
}
