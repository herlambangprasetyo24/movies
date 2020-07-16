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
    var overview = ""
    var releaseDate = ""
    var voteAverage = 0.0
    var isFavourite = false
    
    static func create(movieDetail: MovieDetail) -> MovieDetailViewParams {
        
        let movieDetailViewParams = MovieDetailViewParams()
        movieDetailViewParams.id = movieDetail.id
        movieDetailViewParams.backdropPath = movieDetail.backdropPath
        movieDetailViewParams.posterPath = movieDetail.posterPath
        movieDetailViewParams.title = movieDetail.title
        movieDetailViewParams.originalTitle = movieDetail.originalTitle
        movieDetailViewParams.overview = movieDetail.overview
        movieDetailViewParams.releaseDate = movieDetail.releaseDate
        movieDetailViewParams.voteAverage = movieDetail.voteAverage
        movieDetailViewParams.isFavourite = movieDetail.isFavourite
        
        return movieDetailViewParams
    }
    
    static func create(movieDetailViewParams: MovieDetailViewParams) -> MovieDetail {
        
        let movieDetail = MovieDetail()
        movieDetail.id = movieDetailViewParams.id
        movieDetail.backdropPath = movieDetailViewParams.backdropPath
        movieDetail.posterPath = movieDetailViewParams.posterPath
        movieDetail.title = movieDetailViewParams.title
        movieDetail.originalTitle = movieDetailViewParams.originalTitle
        movieDetail.overview = movieDetailViewParams.overview
        movieDetail.releaseDate = movieDetailViewParams.releaseDate
        movieDetail.voteAverage = movieDetailViewParams.voteAverage
        movieDetail.isFavourite = movieDetailViewParams.isFavourite
        
        return movieDetail
    }

}
