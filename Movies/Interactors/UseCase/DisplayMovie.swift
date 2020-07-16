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
    func getMovies() -> Single<MoviesViewParams>
}

class DisplayMovie: DisplayMovieProtocol {
    
    private let api: MoviesApi

    init(api: MoviesApi) {
        self.api = api
    }
    
    func getMovies() -> Single<MoviesViewParams> {
        return api.getMovies()
            .map { [weak self] movies in
                guard let weakSelf = self else { return MoviesViewParams() }
                return MoviesViewParams.create(movies: movies)
        }
    }
}
