//
//  MovieReviewResultViewParam.swift
//  Movies
//
//  Created by Herlambang Prasetyo on 16/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import Foundation

class MovieReviewResultViewParam {
    
    var author = ""
    var content = ""
    
    static func create(movieReviewResult: MovieReviewResult) -> MovieReviewResultViewParam {
        let moviewReviewResultViewParam = MovieReviewResultViewParam()
        moviewReviewResultViewParam.author = movieReviewResult.author
        moviewReviewResultViewParam.content = movieReviewResult.content
        
        return moviewReviewResultViewParam
    }

}
