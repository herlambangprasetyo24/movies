//
//  MovieReviewResponse.swift
//  Movies
//
//  Created by Herlambang Prasetyo on 16/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import Foundation
import ObjectMapper

class MovieReviewResponse: Mappable {
    
    var id = 0
    var page = 0
    var results = [MovieReviewResultResponse]()
    
    required init?(map: Map) {
        //Nothing to do!?
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        page <- map["page"]
        results <- map["results"]
    }
    
    func toMovieReview() -> MovieReview {
        let movieReview = MovieReview()
        movieReview.id = id
        movieReview.page = page
        
        results.forEach { result in
            movieReview.results.append(result.toMovieReview())
        }
        
        return movieReview
    }
}
