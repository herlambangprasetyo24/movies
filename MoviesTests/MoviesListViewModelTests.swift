//
//  MoviesListViewModelTests.swift
//  MoviesTests
//
//  Created by Herlambang Prasetyo on 17/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import XCTest
import RxSwift
@testable import Movies

class MoviesListViewModelTests: XCTestCase {
    
    var moviesListViewModel: MoviesListViewModel!
    
    override func setUp() {
        super.setUp()
        let apiClient = ApiClient()
        let moviesApi = MoviesApiServices(apiClient: apiClient)
        let movieListStore = MovieListRealmStore()
        let displayMovies = DisplayMovie(api: moviesApi, movieListStore: movieListStore)
        moviesListViewModel = MoviesListViewModel(displayMovie: displayMovies)
    }
    
    override func tearDown() {
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testViewWillAppear() {
        XCTAssertNotNil(moviesListViewModel.viewWillAppear(), "")
        sleep(20)
    }
    
    func testSetPageType() {
        moviesListViewModel.setPageType(pageType: .FavouriteList)
        XCTAssertTrue(moviesListViewModel.getPageType() == .FavouriteList)
        XCTAssertFalse(moviesListViewModel.getPageType() == .MoviesList)
    }
    
    func testOpenMoviesDetail() {
        moviesListViewModel.getMoviesFromServer()
        sleep(20)
        XCTAssertNotNil(moviesListViewModel.openMoviesDetail(index: 0), "")
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
