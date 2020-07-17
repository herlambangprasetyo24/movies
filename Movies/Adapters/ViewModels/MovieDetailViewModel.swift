//
//  MovieDetailViewModel.swift
//  Movies
//
//  Created by Herlambang Prasetyo on 16/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import Foundation
import RxSwift

class MovieDetailViewModel {
    
    var rxEventLoadMovieDetail: PublishSubject<Void> {
        return eventLoadMovieDetail
    }
    
    var rxEventUpdateFavouriteButton: PublishSubject<Void> {
        return eventUpdateFavouriteButton
    }
    
    var movieDetailViewParams = MovieDetailViewParams()
    var movieReviewViewParams = MovieReviewViewParam()
    
    private var movieId = 0
    
    private let eventLoadMovieDetail = PublishSubject<Void>()
    private let eventUpdateFavouriteButton = PublishSubject<Void>()
    private let displayMovie: DisplayMovieProtocol
    
    private let disposeBag = DisposeBag()
    
    init(displayMovie: DisplayMovieProtocol) {
        self.displayMovie = displayMovie
    }
    
    func viewDidLoad() {
        getMovieDetail()
    }
    
    func setMovieId(movieId: Int) {
        self.movieId = movieId
    }
    
    func getMovieId() -> Int {
        return movieId
    }
    
    func manageFavouriteButton() {
        if movieDetailViewParams.isFavourite {
            deleteFromFavourite()
        } else {
            saveToFavourite()
        }
    }
    
    func saveToFavourite() {
        movieDetailViewParams.isFavourite = true
        displayMovie.saveMovieFavourite(movieDetailViewParam: movieDetailViewParams)
        eventUpdateFavouriteButton.onNext(())
    }
    
    func deleteFromFavourite() {
        movieDetailViewParams.isFavourite = false
        displayMovie.deleteFavouriteMovie(movieId: movieDetailViewParams.id)
        eventUpdateFavouriteButton.onNext(())
    }
    
    private func getMovieDetail() {
        displayMovie.getMovieDetail(movieId: movieId)
            .subscribe(onSuccess: { [weak self] movieDetailViewParams in
                guard let weakSelf = self else { return }
                weakSelf.movieDetailViewParams = movieDetailViewParams
                weakSelf.getMovieReview()
            }).disposed(by: disposeBag)
    }
    
    private func getMovieReview() {
        displayMovie.getMovieReview(movieId: movieId)
            .subscribe(onSuccess: { [weak self] movieReviewViewParams in
                guard let weakSelf = self else { return }
                weakSelf.movieReviewViewParams = movieReviewViewParams
                weakSelf.eventLoadMovieDetail.onNext(())
            }).disposed(by: disposeBag)
    }
}
