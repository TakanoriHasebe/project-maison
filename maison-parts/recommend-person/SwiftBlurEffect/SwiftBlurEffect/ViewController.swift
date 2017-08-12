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
    
    @IBOutlet weak var backgoundImg: UIImageView!
    
    /* Effectボタンを押すとBlurがでる */
    @IBAction func BlurEffect(_ sender: Any) {
        
        /************ コピペ ***********/
        /* addItemViewの初期設定 */
        addItemView.center = self.view.center
        /************ コピペ ***********/
        
        
        /************ コピペ ***********/
        /* Animationの設定 */
        self.backgoundImg.addBlurEffect() /* Extensionを用いたBlur */
        addItemView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        addItemView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.view.addSubview(self.addItemView)
            self.addItemView.alpha = 1
            self.addItemView.transform = CGAffineTransform.identity
        }
        /************ コピペ ***********/
        
    }
    
    /* BlurエフェクトとViewを取り外す */
    @IBAction func removeBlurEffect(_ sender: Any) {
        
        self.backgoundImg.removeBlurEffect()
        UIView.animate(withDuration: 0.3, animations: {
            self.addItemView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.addItemView.alpha = 0
            
            // self.visualEffectView.effect = nil
            
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

/************ コピペ ***********/
extension UIImageView
{
    
    func addBlurEffect(){
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
        
    }
    
    func removeBlurEffect() {
        // UIImageViewのsubviewすべてに対して、
        self.subviews.forEach{
            // 型をUIVisualEffectViewにキャストできる、すなわち型がUIVisualEffectViewであるsubviewは、
            if let effectView = $0 as? UIVisualEffectView {
                // superviewから取り外す。
                effectView.removeFromSuperview()
            }
        }
    }
}
/************ コピペ ***********/
