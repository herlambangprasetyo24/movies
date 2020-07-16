//
//  SwinjectStoryboard+Setup.swift
//  Movies
//
//  Created by Herlambang Prasetyo on 16/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import Foundation
import SwinjectStoryboard
import Swinject

extension SwinjectStoryboard {
    
    @objc class func setup() {
        Container.loggingFunction = nil
        
        _ = Assembler([
            StoryboardsAssembly(),
            ViewModelsAssembly(),
            InteractorsAssembly(),
            ApisAssembly()
            ],
            container: defaultContainer
        )
    }
}
