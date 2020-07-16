//
//  MoviesListResponse.swift
//  Movies
//
//  Created by Herlambang Prasetyo on 16/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import Foundation
import ObjectMapper

class MoviesListResponse: Mappable {
    
    
    var page = 0
    var totalResults = 0
    var totalPages = 0
    var movieList = [MovieDetailResponse]()
    
    required init?(map: Map) {
        //Nothing to do!?
    }
    
    func mapping(map: Map) {
        page <- map["page"]
        totalResults <- map["total_results"]
        totalPages <- map["total_pages"]
        movieList <- map["results"]
    }
    
    func toMovies() -> Movies {
        let movies = Movies()
        movies.page = page
        movies.totalPages = totalPages
        movies.totalResults = totalResults
        
        movieList.forEach { movie in
            movies.movieList.append(movie.toMovieDetail())
        }
        
        return movies
    }
}
