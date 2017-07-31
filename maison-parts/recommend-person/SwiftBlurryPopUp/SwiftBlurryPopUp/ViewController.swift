//
//  ViewController.swift
//  SwiftBlurryPopUp
//
//  Created by Takanori.H on 2017/07/27.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

/*****************
 
 Blurをつけるときに、ControllerとUIVisualEffectViewの結びつけに気をつける。
 コード自体は動作に問題を出さない。
 
 *****************/

import UIKit

class ViewController: UIViewController {

    /* Viewに対する動作を記述している */
    @IBOutlet var addItemView: UIView!
    
    /* BlurのAction */
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    
    /* コピペ */
    var effect:UIVisualEffect!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* コピペ */
        effect = visualEffectView.effect
        visualEffectView.effect = nil
        
        /* コピペ */
        addItemView.layer.cornerRadius = 5
        
    }

    /* コピペ */
    func animateIn(){
        
        self.view.addSubview(addItemView)
        addItemView.center = self.view.center
        
        addItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        addItemView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.visualEffectView.effect = self.effect
            self.addItemView.alpha = 1
            self.addItemView.transform = CGAffineTransform.identity
        }
        
    }
    
    /* コピペ */
    func animateOut() {
        UIView.animate(withDuration: 0.3, animations: {
            self.addItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.addItemView.alpha = 0
            
            self.visualEffectView.effect = nil
            
        }) { (success:Bool) in
            self.addItemView.removeFromSuperview()
        }
    }
    
    /* コピペ */
    @IBAction func addItem(_ sender: AnyObject) {
        
        animateIn()
        
    }
    
    /* コピペ */
    @IBAction func dissmissPopUp(_ sender: AnyObject) {
        
        animateOut()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

