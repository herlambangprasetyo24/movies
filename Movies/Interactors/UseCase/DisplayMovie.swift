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
    func saveMovieFavourite(movieDetailViewParam: MovieDetailViewParams)
    func getMovieFavourite() -> Single<MoviesViewParams>
}

class DisplayMovie: DisplayMovieProtocol {
    
    private let api: MoviesApi
    private let movieListStore: MovieListStore

    init(api: MoviesApi, movieListStore: MovieListStore) {
        self.api = api
        self.movieListStore = movieListStore
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
    
    func saveMovieFavourite(movieDetailViewParam: MovieDetailViewParams) {
        movieListStore.save(movie: MovieDetailViewParams.create(movieDetailViewParams: movieDetailViewParam))
    }
    
    func getMovieFavourite() -> Single<MoviesViewParams> {
        let moviesViewParams = MoviesViewParams()
        let movieFavouriteList = movieListStore.getMovies()
        movieFavouriteList.forEach { movie in
            moviesViewParams.movieList.append(MovieDetailViewParams.create(movieDetail: movie))
        }
        
        return Single.just(moviesViewParams)
    }
}
