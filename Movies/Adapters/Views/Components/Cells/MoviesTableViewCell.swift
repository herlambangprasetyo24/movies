//
//  MoviesTableViewCell.swift
//  Movies
//
//  Created by Herlambang Prasetyo on 16/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {

    @IBOutlet weak var moviesImageView: UIImageView!
    @IBOutlet weak var titleMoviesLabel: UILabel!
    @IBOutlet weak var releaseDateMoviesLabel: UILabel!
    @IBOutlet weak var moviesOverviewLabel: UILabel!
    
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
    
    func setupUI(movieViewParam: MovieDetailViewParams) {
        titleMoviesLabel.text = movieViewParam.title
        releaseDateMoviesLabel.text = movieViewParam.releaseDate
        moviesOverviewLabel.text = movieViewParam.overview
        moviesImageView.loadUrl("https://image.tmdb.org/t/p/w500" + movieViewParam.posterPath)
    }

}
