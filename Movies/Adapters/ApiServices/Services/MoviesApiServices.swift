//
//  MoviesApiServices.swift
//  Movies
//
//  Created by Herlambang Prasetyo on 16/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import Foundation
import RxSwift
import ObjectMapper

class MoviesApiServices: MoviesApi {
    
    let apiClient: ApiClientProtocol
    
    init(apiClient: ApiClientProtocol) {
        self.apiClient = apiClient
    }
    
    func getMovies(path: String) -> Single<Movies> {
        return apiClient.getString(url: "https://api.themoviedb.org/3/movie/\(path)?api_key=3ccad205be6a95ed811ebffdfb3f8f6f&language=en-US&page=1")
            .map { (success, jsonString)  in
                Mapper<MoviesListResponse>().map(JSONString: jsonString)?.toMovies() ?? Movies()
        }
    }
    
    func getMoviesDetail(movieId: Int) -> Single<MovieDetail> {
        return apiClient.getString(url: "https://api.themoviedb.org/3/movie/\(movieId)?api_key=3ccad205be6a95ed811ebffdfb3f8f6f&language=en-US")
            .map { (success, jsonString) in
                Mapper<MovieDetailResponse>().map(JSONString: jsonString)?.toMovieDetail() ?? MovieDetail()
                
        }
    }
    
    func getMovieReview(movieId: Int) -> Single<MovieReview> {
        return apiClient.getString(url:  "https://api.themoviedb.org/3/movie/\(movieId)/reviews?api_key=3ccad205be6a95ed811ebffdfb3f8f6f&language=en-US&page=1")
            .map { (success, jsonString) in
                Mapper<MovieReviewResponse>().map(JSONString: jsonString)?.toMovieReview() ?? MovieReview()
                
        }
    }
    
}

