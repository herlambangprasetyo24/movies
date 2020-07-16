//
//  StorageAssembly.swift
//  Movies
//
//  Created by Herlambang Prasetyo on 16/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import Foundation
import Swinject

class StoragesAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(MovieListStore.self) { r in
            MovieListRealmStore()
        }
    }
}
