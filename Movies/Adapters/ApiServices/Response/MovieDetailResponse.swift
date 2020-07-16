//
//  MovieDetailResponse.swift
//  Movies
//
//  Created by Herlambang Prasetyo on 16/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import Foundation
import ObjectMapper

class MovieDetailResponse: Mappable {
    
    var id = 0
    var backdropPath = ""
    var posterPath = ""
    var title = ""
    var originalTitle = ""
    var overView = ""
    var releaseDate = ""
    var voteAverage = 0.0
    
    required init?(map: Map) {
        //Nothing to do!?
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        backdropPath <- map["backdrop_path"]
        posterPath <- map["poster_path"]
        title <- map["title"]
        originalTitle <- map["original_title"]
        overView <- map["overview"]
        releaseDate <- map["release_date"]
        voteAverage <- map["vote_average"]
    }
    
    func toMovieDetail() -> MovieDetail {
        let movieDetail = MovieDetail()
        movieDetail.id = id
        movieDetail.backdropPath = backdropPath
        movieDetail.posterPath = posterPath
        movieDetail.title = title
        movieDetail.originalTitle = originalTitle
        movieDetail.overview = overView
        movieDetail.releaseDate = releaseDate
        movieDetail.voteAverage = voteAverage
        
        return movieDetail
    }
}
