//
//  PopUpViewController.swift
//  PopUpView
//
//  Created by Takanori.H on 2017/05/31.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    
    @IBOutlet weak var profileLabel: UILabel!
    
    @IBAction func buttonAction(_ sender: UIButton) {
        
        self.removeAnimate()
        
    }
    
    
    /* Main.storyboardを用いた場合には、画像の読み込み、自己紹介の読み込みについて */
    
    /******************** call first ********************/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* 背景色の設定 */
        profileLabel.text = "was a cold December day when I chose the comfort of my bed over the hype of another Silicon Valley Christmas party. I spent the evening browsing the catalogue of men on Tinder, wondering if my soulmate could actually be a finger swipe away. When M’s profile came up my heart skipped a beat."
        
        
        /* アニメーションの設定 */
        self.showAnimate()
        
    }
    /******************** call first ********************/
    
    /******************** setting animation ********************/
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.10, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.20, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
    /******************** setting animation ********************/
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
    }
    
}
