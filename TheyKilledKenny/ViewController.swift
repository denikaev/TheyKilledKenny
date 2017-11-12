//
//  ViewController.swift
//  TheyKilledKenny
//
//  Created by Maxim Dvortsov on 11.11.2017.
//  Copyright © 2017 Maxim Dvortsov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CAAnimationDelegate {
    
    //TEST
    var gradientLayer: CAGradientLayer! {
        didSet {
            gradientLayer.startPoint = CGPoint(x: 0, y: 0) // 0 0 левый верхний угол
            gradientLayer.endPoint = CGPoint(x: 0, y: 1) // 0 1 левый нижний угол
            
            let startColor = #colorLiteral(red: 0.9561417588, green: 0.3419922289, blue: 0.2882198394, alpha: 1).cgColor
            let endColor = #colorLiteral(red: 0.8941176471, green: 0.3137254902, blue: 0.262745098, alpha: 1).cgColor
            gradientLayer.colors = [startColor, endColor]
            //gradientLayer.locations = [0, 0.1, 1]
        }
    }
    
    
    override func viewDidLayoutSubviews() {
        gradientLayer.frame = CGRect(x: 0, y: 0,
                                     width: self.view.bounds.size.width,
                                     //height: 20 + 50 + imageView.frame.size.height / 2)
                                    height: self.view.bounds.size.height)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        gradientLayer = CAGradientLayer()
        view.layer.insertSublayer(gradientLayer, at: 0)
        //view на весь экран
        
        
        
        
        //Создаем вьюшку над полем типа HEADER (таймер, имя и прочая херня)
        
        let headerViewRect = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 100)
        let headerView = UIView(frame: headerViewRect)
        //headerView.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        //headerView.layer.borderWidth = 3
        //headerView.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).cgColor
        self.view.addSubview(headerView)
        
        //Текстовый лейбл с именем?
        let nameLabelRect = CGRect(x: 5, y: 5, width: 200, height: 50)
        let nameLabel = UILabel(frame: nameLabelRect)
        nameLabel.center = headerView.center
        nameLabel.center.y = headerView.center.y + 10
        nameLabel.textAlignment = .center
        nameLabel.text = "Мэйби тут имя игрока"
        nameLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        headerView.addSubview(nameLabel)
        
        
        // Создаем вьюшку поля
        let boardSide = self.view.bounds.size.width - 20
        let boardCenter = self.view.center.y
        let gameBoardViewRect = CGRect(x: 10, y: boardCenter - (boardSide / 2), width: boardSide, height: boardSide)
        let gameBoardView = UIView(frame: gameBoardViewRect)
        gameBoardView.layer.cornerRadius = 10
        gameBoardView.layer.borderWidth = 1
        gameBoardView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        //gameBoardView.layer.masksToBounds = true
       //gameBoardView.backgroundColor = #colorLiteral(red: 0.8941176471, green: 0.3137254902, blue: 0.262745098, alpha: 1)
        self.view.addSubview(gameBoardView)
        
        
        
        
        
        // Надо бы наверное для фишки сделать структуру или класс
        struct Piece {
            var index: Int
            var coordinates: [Int] //[1, 1] для единицы, например... [4, 3] для 15
        }
        
        
        //Функция для создания фишек
        func createViewForPiece(count: Int) {
            
            for i in 1...count {
                let pieceSide = Int((boardSide - 30) / 4)
                
                //Ничего мне не говорите, вы просто ничего не понимаете в высокой математике
                var yPoint = 0
                var xPoint = 0
                if i > 0 && i < 5 {
                    xPoint = 6 * i + pieceSide * (i - 1)
                    yPoint = 6
                } else if i > 4 && i < 9 {
                    xPoint = 6 * (i - 4) + pieceSide * (i - 5)
                    yPoint = 12 + pieceSide
                } else if i > 8 && i < 13 {
                    xPoint = 6 * (i - 8) + pieceSide * (i - 9)
                    yPoint = 18 + pieceSide * 2
                } else if i > 12 && i < 17 {
                    xPoint = 6 * (i - 12) + pieceSide * (i - 13)
                    yPoint = 24 + pieceSide * 3
                }
                let gamePieceRect = CGRect(x: xPoint, y: yPoint, width: pieceSide, height: pieceSide)
                let gamePieceView = UIImageView(frame: gamePieceRect)
                
                //Тэг фишки
                gamePieceView.tag = i
               // gamePieceView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                gamePieceView.image = UIImage(named: "Button")
                //gamePieceView.layer.cornerRadius = 10
                //gamePieceView.layer.borderWidth = 2
                //gamePieceView.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                //gamePieceView.layer.masksToBounds = true
                gamePieceView.contentMode = .scaleAspectFit
                
    
//                gamePieceView.layer.shadowOffset = CGSize(width: 5, height: 5)
//                gamePieceView.layer.shadowRadius = 5
//                gamePieceView.layer.shadowOpacity = 0.8
//                gamePieceView.layer.shadowColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
                
                gameBoardView.addSubview(gamePieceView)
                
                // отображаемый номер фишки
                let numberRect = CGRect(x: 0, y: 0, width: pieceSide, height: pieceSide)
                let numberLabel = UILabel(frame: numberRect)
                
                //на фишке 16 номер не показываем
                if i < 16 {
                    numberLabel.text = "\(i)"
                }
                numberLabel.textAlignment = .center
                numberLabel.textColor = #colorLiteral(red: 0.8941176471, green: 0.3137254902, blue: 0.262745098, alpha: 1)
                //numberLabel.attributedText =
                gamePieceView.addSubview(numberLabel)
                
            }
        }
        
        
        createViewForPiece(count: 16)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
