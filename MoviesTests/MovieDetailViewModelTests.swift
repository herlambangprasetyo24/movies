//
//  MovieDetailViewModelTests.swift
//  MoviesTests
//
//  Created by Herlambang Prasetyo on 17/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import XCTest
import RxSwift
@testable import Movies

class MovieDetailViewModelTests: XCTestCase {

    var movieDetailViewModel: MovieDetailViewModel!
    
    override func setUp() {
        let apiClient = ApiClient()
        let moviesApi = MoviesApiServices(apiClient: apiClient)
        let movieListStore = MovieListRealmStore()
        let displayMovie = DisplayMovie(api: moviesApi, movieListStore: movieListStore)
        movieDetailViewModel = MovieDetailViewModel(displayMovie: displayMovie)
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testViewDidLoad() {
        XCTAssertNotNil(movieDetailViewModel.viewDidLoad(), "")
    }
    
    func testSetMovieId() {
        let expectedMovieId = 123456
        movieDetailViewModel.setMovieId(movieId: expectedMovieId)
        XCTAssertTrue(movieDetailViewModel.getMovieId() == expectedMovieId)
    }

}
