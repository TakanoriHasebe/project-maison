//
//  FrostedRecommendPersonViewController.swift
//  maison
//
//  Created by Takanori.H on 2017/05/15.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit

class FrostedRecommendPersonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func onBurger() {
        (tabBarController as! TabBarController).sidebar.showInViewController(self, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
