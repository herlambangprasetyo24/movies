//
//  MovieDetailViewParamTests.swift
//  MoviesTests
//
//  Created by Herlambang Prasetyo on 17/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import XCTest
import RxSwift
@testable import Movies

class MovieDetailViewParamTests: XCTestCase {
    
    var movieDetailViewParams = MovieDetailViewParams()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCreateMovieDEtailViewParam() {
        let movieDetail = MovieDetail()
        movieDetail.id = 514207
        movieDetail.backdropPath = "/cbJNZeFkiG4ggsNcwzBs6yeCXga.jpg"
        movieDetail.posterPath = "/rpqfpSglhDpwihzsLaoketuYKbd.jpg"
        movieDetail.title = "Invasion"
        movieDetail.originalTitle = "Invasion"
        movieDetail.overview = "After the fall of the alien ship, it took three years. The catastrophe turned the girl's life from Chertanovo and forever changed our view of the universe."
        movieDetail.releaseDate = "2020-01-01"
        movieDetail.voteAverage = 7.1
        movieDetail.isFavourite = false
        
        let movieDetailViewParams = MovieDetailViewParams.create(movieDetail: movieDetail)
        XCTAssertTrue(movieDetail.id == movieDetailViewParams.id)
        XCTAssertTrue(movieDetail.backdropPath == movieDetailViewParams.backdropPath)
        XCTAssertTrue(movieDetail.posterPath == movieDetailViewParams.posterPath)
        XCTAssertTrue(movieDetail.title == movieDetailViewParams.title)
        XCTAssertTrue(movieDetail.originalTitle == movieDetailViewParams.originalTitle)
        XCTAssertTrue(movieDetail.overview == movieDetailViewParams.overview)
        XCTAssertTrue(movieDetail.releaseDate == movieDetailViewParams.releaseDate)
        XCTAssertTrue(movieDetail.voteAverage == movieDetailViewParams.voteAverage)
        XCTAssertTrue(movieDetail.isFavourite == movieDetailViewParams.isFavourite)
    }
    
    func testCreateMovieDEtail() {
        let movieDetailViewParams = MovieDetailViewParams()
        movieDetailViewParams.id = 514207
        movieDetailViewParams.backdropPath = "/cbJNZeFkiG4ggsNcwzBs6yeCXga.jpg"
        movieDetailViewParams.posterPath = "/rpqfpSglhDpwihzsLaoketuYKbd.jpg"
        movieDetailViewParams.title = "Invasion"
        movieDetailViewParams.originalTitle = "Invasion"
        movieDetailViewParams.overview = "After the fall of the alien ship, it took three years. The catastrophe turned the girl's life from Chertanovo and forever changed our view of the universe."
        movieDetailViewParams.releaseDate = "2020-01-01"
        movieDetailViewParams.voteAverage = 7.1
        movieDetailViewParams.isFavourite = false
        
        let movieDetail = MovieDetailViewParams.create(movieDetailViewParams: movieDetailViewParams)
        XCTAssertTrue(movieDetail.id == movieDetailViewParams.id)
        XCTAssertTrue(movieDetail.backdropPath == movieDetailViewParams.backdropPath)
        XCTAssertTrue(movieDetail.posterPath == movieDetailViewParams.posterPath)
        XCTAssertTrue(movieDetail.title == movieDetailViewParams.title)
        XCTAssertTrue(movieDetail.originalTitle == movieDetailViewParams.originalTitle)
        XCTAssertTrue(movieDetail.overview == movieDetailViewParams.overview)
        XCTAssertTrue(movieDetail.releaseDate == movieDetailViewParams.releaseDate)
        XCTAssertTrue(movieDetail.voteAverage == movieDetailViewParams.voteAverage)
        XCTAssertTrue(movieDetail.isFavourite == movieDetailViewParams.isFavourite)
        
    }

}
