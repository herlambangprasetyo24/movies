//
//  ApiAssembly.swift
//  Movies
//
//  Created by Herlambang Prasetyo on 16/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import Foundation
import Swinject

class ApisAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(ApiClientProtocol.self) { r in
            ApiClient()
        }
        
        container.register(MoviesApi.self) { r in
            MoviesApiServices(apiClient: r.resolve(ApiClientProtocol.self)!)
        }
    }
}
