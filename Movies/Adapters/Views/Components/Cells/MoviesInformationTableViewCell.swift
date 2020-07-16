//
//  MoviesInformationTableViewCell.swift
//  Movies
//
//  Created by Herlambang Prasetyo on 16/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import UIKit

class MoviesInformationTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieOverviewLabel: UILabel!
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
    
    func setupUI(movieDetailViewParams: MovieDetailViewParams) {
        movieImageView.loadUrl("https://image.tmdb.org/t/p/w500" + movieDetailViewParams.backdropPath)
        movieTitleLabel.text = movieDetailViewParams.title
        movieReleaseDate.text = "Release: \(movieDetailViewParams.releaseDate)"
        movieRatingLabel.text = "Rating: \(movieDetailViewParams.voteAverage)"
        movieOverviewLabel.text = movieDetailViewParams.overview
    }

}
