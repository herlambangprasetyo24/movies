//
//  MovieReviewResult.swift
//  Movies
//
//  Created by Herlambang Prasetyo on 16/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import Foundation
import RealmSwift

class MovieReviewResult: Object {
    @objc dynamic var author = ""
    @objc dynamic var content = ""
}
