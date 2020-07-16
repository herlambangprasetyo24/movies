//
//  ViewModelAssembly.swift
//  Movies
//
//  Created by Herlambang Prasetyo on 16/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import Foundation
import Swinject

class ViewModelsAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(MoviesListViewModel.self) { r in
            MoviesListViewModel(displayMovie: r.resolve(DisplayMovieProtocol.self)!)
        }
    }
}
