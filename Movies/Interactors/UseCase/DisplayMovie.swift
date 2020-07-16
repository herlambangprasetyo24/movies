//
//  DisplayMovie.swift
//  Movies
//
//  Created by Herlambang Prasetyo on 16/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import Foundation
import RxSwift

protocol DisplayMovieProtocol {
    func getMovies(path: String) -> Single<MoviesViewParams>
    func getMovieDetail(movieId: Int) -> Single<MovieDetailViewParams>
    func getMovieReview(movieId: Int) -> Single<MovieReviewViewParam>
}

class DisplayMovie: DisplayMovieProtocol {
    
    private let api: MoviesApi

    init(api: MoviesApi) {
        self.api = api
    }
    
    func getMovies(path: String) -> Single<MoviesViewParams> {
        return api.getMovies(path: path)
            .map { movies in
                return MoviesViewParams.create(movies: movies)
        }
    }
    
    func getMovieDetail(movieId: Int) -> Single<MovieDetailViewParams> {
        return api.getMoviesDetail(movieId: movieId)
            .map { movie in
                return MovieDetailViewParams.create(movieDetail: movie)
        }
    }
    
    func getMovieReview(movieId: Int) -> Single<MovieReviewViewParam> {
        return api.getMovieReview(movieId: movieId)
            .map { movieReview in
                return MovieReviewViewParam.create(movieReview: movieReview)
                
        }
    }
}
