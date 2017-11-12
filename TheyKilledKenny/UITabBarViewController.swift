//
//  UITabBarViewController.swift
//  TheyKilledKenny
//
//  Created by Maxim Dvortsov on 12.11.2017.
//  Copyright © 2017 Maxim Dvortsov. All rights reserved.
//

import UIKit

class UITabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tabBar.barTintColor = UIColor.clear
        self.tabBar.tintColor = #colorLiteral(red: 0.8941176471, green: 0.3137254902, blue: 0.262745098, alpha: 1)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
