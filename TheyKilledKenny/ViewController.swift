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
        
        
        //Создаем вьюшку над полем типа HEADER (таймер, имя и прочая херня)
        
        let headerViewRect = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 100)
        let headerView = UIView(frame: headerViewRect)
        headerView.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        self.view.addSubview(headerView)
        
        //Текстовый лейбл с именем?
        let nameLabelRect = CGRect(x: 5, y: 5, width: 200, height: 50)
        let nameLabel = UILabel(frame: nameLabelRect)
        nameLabel.center = headerView.center
        nameLabel.center.y = headerView.center.y + 10
        nameLabel.textAlignment = .center
        nameLabel.text = "Мэйби тут имя игрока"
        headerView.addSubview(nameLabel)
        
        
        // Создаем вьюшку поля
        let boardSide = self.view.bounds.size.width - 20
        let boardCenter = self.view.center.y
        let gameBoardViewRect = CGRect(x: 10, y: boardCenter - (boardSide / 2), width: boardSide, height: boardSide)
        let gameBoardView = UIView(frame: gameBoardViewRect)
        gameBoardView.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        self.view.addSubview(gameBoardView)
        
        
        
        
        
        // Надо бы наверное для фишки сделать структуру или класс
        struct Piece {
            var index: Int
            var coordinates: [Int] //[1, 1] для единицы, например... [4, 3] для 15
        }
        
        
        //Функция для создания фишек
        func createViewForPiece(count: Int) {
            
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
                
                //Тэг фишки
                gamePieceView.tag = i
                gamePieceView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                gameBoardView.addSubview(gamePieceView)
                
                // отображаемый номер фишки
                let numberRect = CGRect(x: 0, y: 0, width: pieceSide, height: pieceSide)
                let numberLabel = UILabel(frame: numberRect)
                
                //на фишке 16 номер не показываем
                if i < 16 {
                    numberLabel.text = "\(i)"
                }
                numberLabel.textAlignment = .center
                gamePieceView.addSubview(numberLabel)
                
            }
        }
        
        
        createViewForPiece(count: 16)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
