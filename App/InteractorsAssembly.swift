//
//  InteractorsAssembly.swift
//  Movies
//
//  Created by Herlambang Prasetyo on 16/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import Foundation
import Swinject

class InteractorsAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(DisplayMovieProtocol.self) { r in
            DisplayMovie(api: r.resolve(MoviesApi.self)!)
        }
    }
}
