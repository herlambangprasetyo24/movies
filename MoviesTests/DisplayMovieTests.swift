//
//  DisplayMovieTests.swift
//  MoviesTests
//
//  Created by Herlambang Prasetyo on 17/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import XCTest
import RxSwift
@testable import Movies

class DisplayMovieTests: XCTestCase {
    
    var displayMovie: DisplayMovie!
    var disposeBag = DisposeBag()
    
    override func setUp() {
        let apiClient = ApiClient()
        let moviesApi = MoviesApiServices(apiClient: apiClient)
        let movieListStore = MovieListRealmStore()
        displayMovie = DisplayMovie(api: moviesApi, movieListStore: movieListStore)
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetMovies() {
        weak var getMoviesPromise = expectation(description: "Success get movies")
        
        displayMovie.getMovies(path: "popular")
            .subscribe(onSuccess: { moviesViewParam in
                XCTAssertTrue(moviesViewParam.page > 0)
                XCTAssertTrue(!moviesViewParam.movieList.isEmpty)
                getMoviesPromise?.fulfill()
            }).disposed(by: disposeBag)
        
        waitForExpectations(timeout: 120, handler: nil)
    }
    
    func testGetMovieDetail() {
        weak var getMovieDetailPromise = expectation(description: "Success get movie detail")
        let expectedMovieId = 696374
        let expectedMovieTitle = "Gabriel's Inferno"
        
        displayMovie.getMovieDetail(movieId: expectedMovieId)
            .subscribe(onSuccess: { movieDetailViewParam in
                XCTAssertTrue(expectedMovieId == movieDetailViewParam.id)
                XCTAssertTrue(expectedMovieTitle == expectedMovieTitle)
                getMovieDetailPromise?.fulfill()
            }).disposed(by: disposeBag)
        
        waitForExpectations(timeout: 120, handler: nil)
    }
    
    func testSaveMoviesFavourite() {
        weak var getMovieDetailPromise = expectation(description: "Success save movies favourite to local db")
        
        let movieDetailViewParams = MovieDetailViewParams()
        movieDetailViewParams.id = 696374
        movieDetailViewParams.title = "Gabriel's Inferno"
        movieDetailViewParams.releaseDate = "2020-05-29"
        
        displayMovie.saveMovieFavourite(movieDetailViewParam: movieDetailViewParams)
        
        displayMovie.getMovieFavourite()
            .subscribe(onSuccess: { movieDetailViewParams in
                XCTAssertTrue(!movieDetailViewParams.movieList.isEmpty)
                getMovieDetailPromise?.fulfill()
            }).disposed(by: disposeBag)
        
        displayMovie.deleteFavouriteMovie(movieId: 696374)
        
        waitForExpectations(timeout: 120, handler: nil)
    }

    func testDeleteMovieFavorite() {
        weak var deleteMovieFavouritePromise = expectation(description: "Success delete movies favourite from local db")
        
        let movieDetailViewParams = MovieDetailViewParams()
        movieDetailViewParams.id = 696374
        movieDetailViewParams.title = "Gabriel's Inferno"
        movieDetailViewParams.releaseDate = "2020-05-29"
        
        displayMovie.saveMovieFavourite(movieDetailViewParam: movieDetailViewParams)
        displayMovie.deleteFavouriteMovie(movieId: 696374)
        sleep(10)
        
        displayMovie.getMovieFavourite()
            .subscribe(onSuccess: { moviesViewParams in
                let movieDetail = moviesViewParams.movieList.filter { $0.id == 696374 }.first
                XCTAssertNil(movieDetail)
                deleteMovieFavouritePromise?.fulfill()
            }).disposed(by: disposeBag)
        
        waitForExpectations(timeout: 120, handler: nil)
    }
}
