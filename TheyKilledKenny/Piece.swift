//
//  Piece.swift
//  TheyKilledKenny
//
//  Created by Vladislav Ilyenko on 12.11.2017.
//  Copyright © 2017 Maxim Dvortsov. All rights reserved.
//

import Foundation
import UIKit

class Piece {
    var index: Int
    var coordinates: [Int] //[1, 1] для единицы, например... [4, 3] для 15
    
    var gamePieceRect = CGRect()
    var gamePieceView = UIImageView()
    
    init() {
        self.index = 0
        self.coordinates = [Int]()
    }
}
