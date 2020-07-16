//
//  Movies.swift
//  Movies
//
//  Created by Herlambang Prasetyo on 16/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import Foundation
import RealmSwift

class Movies: Object {
    @objc dynamic var page = 0
    @objc dynamic var totalResults = 0
    @objc dynamic var totalPages = 0
    var movieList = List<MovieDetail>()

}
    