//
//  MovieReview.swift
//  Movies
//
//  Created by Herlambang Prasetyo on 16/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import Foundation
import RealmSwift

class MovieReview: Object {
    @objc dynamic var id = 0
    @objc dynamic var page = 0
    var results = List<MovieReviewResult>()
}
