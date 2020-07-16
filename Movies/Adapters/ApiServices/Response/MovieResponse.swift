//
//  MovieResponse.swift
//  Movies
//
//  Created by Herlambang Prasetyo on 16/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import Foundation
import ObjectMapper

class MovieResponse: Mappable {
    
    var posterPath = ""
    var title = ""
    var originalTitle = ""
    var overview = ""
    var releaseDate = ""
    var id = 0
    
    required init?(map: Map) {
        //Nothing to do!?
    }
    
    func mapping(map: Map) {
        posterPath <- map["poster_path"]
        title <- map["title"]
        originalTitle <- map["original_title"]
        overview <- map["overview"]
        releaseDate <- map["release_date"]
        id <- map["id"]
    }
    
    func toMovie() -> Movie {
        let movie = Movie()
        movie.posterPath = posterPath
        movie.title = title
        movie.originalTitle = originalTitle
        movie.overview = overview
        movie.releaseDate = releaseDate
        movie.id = id
        
        return movie
    }
}
