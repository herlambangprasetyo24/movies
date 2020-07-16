//
//  MoviesViewParams.swift
//  Movies
//
//  Created by Herlambang Prasetyo on 16/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import Foundation

class MoviesViewParams {
    var page = 0
    var totalResults = 0
    var totalPages = 0
    var movieList = [MovieDetailViewParams]()
    
    static func create(movies: Movies) -> MoviesViewParams {
        
        let moviesViewParam = MoviesViewParams()
        moviesViewParam.page = movies.page
        moviesViewParam.totalResults = movies.totalResults
        moviesViewParam.totalPages = movies.totalResults
        
        movies.movieList.forEach { movie in
            moviesViewParam.movieList.append(MovieDetailViewParams.create(movieDetail: movie))
        }
        
        return moviesViewParam
    }
}
