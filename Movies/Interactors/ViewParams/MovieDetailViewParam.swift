//
//  MovieDetailViewParam.swift
//  Movies
//
//  Created by Herlambang Prasetyo on 16/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import Foundation

class MovieDetailViewParams {
    
    var id = 0
    var backdropPath = ""
    var posterPath = ""
    var title = ""
    var originalTitle = ""
    var overView = ""
    var releaseDate = ""
    var voteAverage = 0.0
    
    static func create(movieDetail: MovieDetail) -> MovieDetailViewParams {
        
        let movieDetailViewParams = MovieDetailViewParams()
        movieDetailViewParams.id = movieDetail.id
        movieDetailViewParams.backdropPath = movieDetail.backdropPath
        movieDetailViewParams.posterPath = movieDetail.posterPath
        movieDetailViewParams.title = movieDetail.title
        movieDetailViewParams.originalTitle = movieDetail.originalTitle
        movieDetailViewParams.overView = movieDetail.overview
        movieDetailViewParams.releaseDate = movieDetail.releaseDate
        movieDetailViewParams.voteAverage = movieDetail.voteAverage
        
        return movieDetailViewParams
    }

}
