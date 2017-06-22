//
//  PopUpViewController.swift
//  PopUpView
//
//  Created by Takanori.H on 2017/05/31.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        let label = UILabel()
        // label.frame = CGRect(x:150, y:300, width:100, height:100)
        label.text = "Test"
        label.backgroundColor = UIColor.white
        label.textColor = UIColor.black
        self.view.addSubview(label)
        
        let screenWidth:CGFloat = view.frame.size.width
        label.frame = CGRect(x:10, y:300, width:screenWidth-20, height:100)
        
        label.textAlignment = .right
        
        self.showAnimate()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
    }
    
    
    /*
    @IBAction func closePopUp(_ sender: AnyObject) {
        
        // self.view.removeFromSuperview()
        self.removeAnimate()
        
    }*/
    
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
    
}
