//
//  MoviesListViewModel.swift
//  Movies
//
//  Created by Herlambang Prasetyo on 16/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import Foundation
import RxSwift

enum PageType {
    
    case MoviesList
    case FavouriteList
}

class MoviesListViewModel {
    
    var rxEventLoadMovies: PublishSubject<Void> {
        return eventLoadMovies
    }
    
    var rxEventOpenMoviesDetail: PublishSubject<MovieDetailViewParams> {
        return eventOpenMovieDetail
    }
    var rxEventShowHideCategoryButton: PublishSubject<Bool> {
        return eventShowHideCategoryButton
    }
    
    var moviesViewParam = MoviesViewParams()
    
    private var pageType: PageType = .MoviesList
    
    private let eventLoadMovies = PublishSubject<Void>()
    private let eventOpenMovieDetail = PublishSubject<MovieDetailViewParams>()
    private let eventShowHideCategoryButton = PublishSubject<Bool>()
    private let displayMovie: DisplayMovieProtocol
    
    private let disposeBag = DisposeBag()

    init(displayMovie: DisplayMovieProtocol) {
        self.displayMovie = displayMovie
    }
    
    func viewWillAppear() {
        getMoviesListData()
    }
    
    func setPageType(pageType: PageType) {
        self.pageType = pageType
    }
    
    func getPageType() -> PageType {
        return pageType
    }
    
    func getMoviesFromServer(path: String = "popular") {
        displayMovie.getMovies(path: path)
            .subscribe(onSuccess: { [weak self] moviesViewParam in
                guard let weakSelf = self else { return }
                weakSelf.moviesViewParam = moviesViewParam
                weakSelf.eventLoadMovies.onNext(())
            }).disposed(by: disposeBag)
    }
    
    func openMoviesDetail(index: Int) {
        guard !moviesViewParam.movieList.isEmpty, index <= moviesViewParam.movieList.count else { return }
        eventOpenMovieDetail.onNext(moviesViewParam.movieList[index])
    }
    
    private func getMoviesListData() {
        if pageType == .MoviesList {
            getMoviesFromServer()
        } else {
            getFavouriteMoviesList()
        }
        showHideCategoryButton()
    }
    
    private func getFavouriteMoviesList() {
        displayMovie.getMovieFavourite()
            .subscribe(onSuccess: { [weak self] moviesViewParam in
                guard let weakSelf = self else { return }
                weakSelf.moviesViewParam = moviesViewParam
                weakSelf.eventLoadMovies.onNext(())
            }).disposed(by: disposeBag)
    }
    
    private func showHideCategoryButton() {
        eventShowHideCategoryButton.onNext(pageType == .MoviesList)
    }
}
