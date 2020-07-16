//
//  MovieListStore.swift
//  Movies
//
//  Created by Herlambang Prasetyo on 16/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import Foundation

import Foundation

protocol MovieListStore {
    
    func save(movie: MovieDetail)
    func getMovies() -> [MovieDetail]
    func delete(movieId: Int)
    func write(writeBlock: () -> Void)
    
}
