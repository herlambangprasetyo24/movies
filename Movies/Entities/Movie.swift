//
//  Movie.swift
//  Movies
//
//  Created by Herlambang Prasetyo on 16/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import Foundation
import RealmSwift

class Movie: Object {
    @objc dynamic var posterPath = ""
    @objc dynamic var title = ""
    @objc dynamic var originalTitle = ""
    @objc dynamic var overview = ""
    @objc dynamic var releaseDate = ""
    @objc dynamic var id = 0
}
