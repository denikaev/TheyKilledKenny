//
//  ViewController.swift
//  TheyKilledKenny
//
//  Created by Maxim Dvortsov on 11.11.2017.
//  Copyright © 2017 Maxim Dvortsov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Создаем вьюшку поля
        let boardSide = self.view.bounds.size.width - 20
        let boardCenter = self.view.center.y
        let gameBoardViewRect = CGRect(x: 10, y: boardCenter - (boardSide / 2), width: boardSide, height: boardSide)
        let gameBoardView = UIView(frame: gameBoardViewRect)
        gameBoardView.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        self.view.addSubview(gameBoardView)
        
        
        
        struct Piece {
            let index: Int
            let coordinates: [Int] //[1, 1] для единицы, например... [4, 3] для 15
        }
        
        
        //Функция для создания фишек
        func newViewForPiece(count: Int) {
            
            for i in 1...count {
                let pieceSide = Int((boardSide - 25) / 4)
                
                //Ничего мне не говорите, вы просто ничего не понимаете в высокой математике
                var yPoint = 0
                var xPoint = 0
                if i > 0 && i < 5 {
                    xPoint = 5 * i + pieceSide * (i - 1)
                    yPoint = 5
                } else if i > 4 && i < 9 {
                    xPoint = 5 * (i - 4) + pieceSide * (i - 5)
                    yPoint = 10 + pieceSide
                } else if i > 8 && i < 13 {
                    xPoint = 5 * (i - 8) + pieceSide * (i - 9)
                    yPoint = 15 + pieceSide * 2
                } else if i > 12 && i < 17 {
                    xPoint = 5 * (i - 12) + pieceSide * (i - 13)
                    yPoint = 20 + pieceSide * 3
                }
                let gamePieceRect = CGRect(x: xPoint, y: yPoint, width: pieceSide, height: pieceSide)
                let gamePieceView = UIView(frame: gamePieceRect)
                gamePieceView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                gameBoardView.addSubview(gamePieceView)
            }
        }
        

        newViewForPiece(count: 16)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
