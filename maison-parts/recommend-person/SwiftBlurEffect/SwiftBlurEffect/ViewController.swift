//
//  ViewController.swift
//  SwiftBlurEffect
//
//  Created by Takanori.H on 2017/08/01.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var addItemView: UIView!
    
        
    var effect:UIVisualEffect!
    
    /* Effectボタンを押すとBlurがでる */
    @IBAction func BlurEffect(_ sender: Any) {
        
        
        /* BlurEffectの初期設定 */
        /* コピペ */
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame.size = CGSize(width: self.view.layer.bounds.width, height: self.view.layer.bounds.height)
        blurView.center = view.center
        // view.addSubview(blurView)
        /* コピペ */
        
        
        /* addItemViewの初期設定 */
        /* コピペ */
        addItemView.center = self.view.center
        // self.view.addSubview(addItemView)
        /* コピペ */
        
        addItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        addItemView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.view.addSubview(blurView)
            self.view.addSubview(self.addItemView)
            self.addItemView.alpha = 1
            self.addItemView.transform = CGAffineTransform.identity
        }
        
    }
    
    @IBAction func removeBlurEffect(_ sender: Any) {
        
        UIView.animate(withDuration: 0.3, animations: {
            self.addItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.addItemView.alpha = 0
            
            
        }) { (success:Bool) in
            self.addItemView.removeFromSuperview()
            
        }
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addItemView.layer.cornerRadius = 5
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
    }


}

