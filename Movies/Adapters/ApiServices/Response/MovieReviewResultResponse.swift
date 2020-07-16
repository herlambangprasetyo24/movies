//
//  MovieReviewResultResponse.swift
//  Movies
//
//  Created by Herlambang Prasetyo on 16/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import Foundation
import ObjectMapper

class MovieReviewResultResponse: Mappable {
    
    var author = ""
    var content = ""
    
    required init?(map: Map) {
        //Nothing to do!?
    }
    
    func mapping(map: Map) {
        author <- map["author"]
        content <- map["content"]
    }
    
    func toMovieReview() -> MovieReviewResult {
        let movieReviewResults = MovieReviewResult()
        movieReviewResults.author = author
        movieReviewResults.content = content
        
        return movieReviewResults
    }
}
