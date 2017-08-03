//
//  ViewController.swift
//  SwiftBlurEffect
//
//  Created by Takanori.H on 2017/08/01.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

/******************************

 Blurをつける時にVibrancyが上のチェックには入っていないが
 下のチェックには入っている。
 
******************************/


import UIKit

class ViewController: UIViewController {

    /* PopUpViewに対すつOutlet */
    @IBOutlet var addItemView: UIView!
    
    /* blurに対するOutlet */
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    
    /* blurEffectの制御 */
    var effect:UIVisualEffect!
    
    /* Effectボタンを押すとBlurがでる */
    @IBAction func BlurEffect(_ sender: Any) {
        
        /*
        /************ コピペ ***********/
        /* BlurEffectの初期設定 */
        /* codeで記述している */
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        /* Blurのかける範囲 */
        blurView.frame.size = CGSize(width: self.view.layer.bounds.width, height: self.view.layer.bounds.height)
        /* どこに中央を設定するか */
        blurView.center = view.center
        // view.addSubview(blurView)
        /************ コピペ ***********/
        */
        
        
        /************ コピペ ***********/
        /* addItemViewの初期設定 */
        addItemView.center = self.view.center
        // self.view.addSubview(addItemView)
        /************ コピペ ***********/
        
        
        /************ コピペ ***********/
        /* Animationの設定 */
        addItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        addItemView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            // self.view.addSubview(blurView) /* code */
            self.visualEffectView.effect = self.effect
            self.view.addSubview(self.addItemView)
            self.addItemView.alpha = 1
            self.addItemView.transform = CGAffineTransform.identity
        }
        /************ コピペ ***********/
        
    }
    
    /* BlurエフェクトとViewを取り外す */
    @IBAction func removeBlurEffect(_ sender: Any) {
        
        UIView.animate(withDuration: 0.3, animations: {
            self.addItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.addItemView.alpha = 0
            
            self.visualEffectView.effect = nil
            
        }) { (success:Bool) in
            
            
            self.addItemView.removeFromSuperview()
            
        }
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* コピペ */
        effect = visualEffectView.effect
        visualEffectView.effect = nil
        
        addItemView.layer.cornerRadius = 5
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
    }


}

