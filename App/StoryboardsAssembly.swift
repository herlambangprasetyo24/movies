//
//  StoryboardAssembly.swift
//  Movies
//
//  Created by Herlambang Prasetyo on 16/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

class StoryboardsAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.storyboardInitCompleted(MoviesListViewController.self) { r, c in
            c.moviesListViewModel = r.resolve(MoviesListViewModel.self)!
        }
    }
}
