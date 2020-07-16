//
//  MoviesApi.swift
//  Movies
//
//  Created by Herlambang Prasetyo on 16/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import Foundation
import RxSwift

protocol MoviesApi {
    func getMovies(path: String) -> Single<Movies>
    func getMoviesDetail(movieId: Int) -> Single<MovieDetail>
    func getMovieReview(movieId: Int) -> Single<MovieReview>
}
