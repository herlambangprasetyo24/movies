//
//  MovieViewParam.swift
//  Movies
//
//  Created by Herlambang Prasetyo on 16/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import Foundation

class MovieViewParams {
    var posterPath = ""
    var title = ""
    var originalTitle = ""
    var overview = ""
    var releaseDate = ""
    var id = 0
    
    static func create(movie: Movie) -> MovieViewParams {
        
        let movieViewParams = MovieViewParams()
        movieViewParams.posterPath = movie.posterPath
        movieViewParams.title = movie.title
        movieViewParams.originalTitle = movie.originalTitle
        movieViewParams.overview = movie.overview
        movieViewParams.releaseDate = movie.releaseDate
        movieViewParams.id = movie.id
        
        return movieViewParams
    }
}
