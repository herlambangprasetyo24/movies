//
//  MoviesListViewModel.swift
//  Movies
//
//  Created by Herlambang Prasetyo on 16/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import Foundation
import RxSwift

class MoviesListViewModel {
    
    var rxEventLoadMovies: PublishSubject<Void> {
        return eventLoadMovies
    }
    
    var moviesViewParam = MoviesViewParams()
    
    private let eventLoadMovies = PublishSubject<Void>()
    private let displayMovie: DisplayMovieProtocol
    
    private let disposeBag = DisposeBag()

    init(displayMovie: DisplayMovieProtocol) {
        self.displayMovie = displayMovie
    }
    
    func viewDidLoad() {
        getMovies()
    }
    
    func getMovies(path: String = "popular") {
        displayMovie.getMovies(path: path)
            .subscribe(onSuccess: { [weak self] moviesViewParam in
                guard let weakSelf = self else { return }
                weakSelf.moviesViewParam = moviesViewParam
                weakSelf.eventLoadMovies.onNext(())
            }).disposed(by: disposeBag)
    }
}
