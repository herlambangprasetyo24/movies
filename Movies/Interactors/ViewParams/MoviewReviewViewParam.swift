//
//  MovieReviewViewParam.swift
//  Movies
//
//  Created by Herlambang Prasetyo on 16/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import Foundation

class MovieReviewViewParam {
    
    var id = 0
    var page = 0
    var results = [MovieReviewResultViewParam]()
    
    static func create(movieReview: MovieReview) -> MovieReviewViewParam {
        
        let movieReviewViewParam = MovieReviewViewParam()
        movieReviewViewParam.id = movieReview.id
        movieReviewViewParam.page = movieReview.page
        
        movieReview.results.forEach { result in
            movieReviewViewParam.results.append(MovieReviewResultViewParam.create(movieReviewResult: result))
        }
        
        return movieReviewViewParam
    }

}
