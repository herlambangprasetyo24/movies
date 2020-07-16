//
//  BottomSheetTitleTableViewCell.swift
//  Movies
//
//  Created by Herlambang Prasetyo on 16/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import UIKit

class BottomSheetTitleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var stckView: UIStackView!
    
    static func nib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
    
    static func cellReuseIdentifier() -> String {
        return String(describing: self)
    }

    
}
