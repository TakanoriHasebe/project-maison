//
//  ViewController.swift
//  SwiftButtonBlurEffect
//
//  Created by Takanori.H on 2017/07/31.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundIMG: UIImageView!
    
    @IBAction func ButtonTapped(_ sender: Any) {
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = backgroundIMG.bounds
        backgroundIMG.addSubview(blurView)
        
    }
    
    
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
    }


}

