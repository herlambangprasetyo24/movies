//
//  MovieListRealmStore.swift
//  Movies
//
//  Created by Herlambang Prasetyo on 16/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import Foundation
import RealmSwift

class MovieListRealmStore: MovieListStore {
    
    let realm = try! Realm()
    
    func save(movie: MovieDetail) {
        try! realm.write {
            realm.add(movie, update: .all)
        }
    }
    
    func getMovies() -> [MovieDetail] {
        return Array(realm.objects(MovieDetail.self))
    }
    
    func getMovie(movieId: Int) -> MovieDetail? {
        return realm.objects(MovieDetail.self).filter("id = \(movieId)").first
    }
    
    func delete(movieId: Int) {
        try! realm.write {
            realm.delete(realm.objects(MovieDetail.self).filter("id = \(movieId)").first ?? MovieDetail())
        }
    }
    
    func write(writeBlock: () -> Void) {
        do {
            try realm.write(writeBlock)
        } catch {
            debugPrint("fail to realm write")
        }
    }

}
