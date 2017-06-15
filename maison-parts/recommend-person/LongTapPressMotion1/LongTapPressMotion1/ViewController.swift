//
//  ViewController.swift
//  LongTapPressMotion1
//
//  Created by Takanori.H on 2017/05/25.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.handleLongPress(_:)))
        lpgr.minimumPressDuration = 0.5
        lpgr.delaysTouchesBegan = false
        lpgr.delegate = self
        self.btn.addGestureRecognizer(lpgr)
        
    }
    
    /* LongPressの時の動作 */
    func handleLongPress(_ gestureReconizer: UILongPressGestureRecognizer) {
        
        /*
        if gestureReconizer.state != UIGestureRecognizerState.ended {
            return
        }*/
        
            
        if( gestureReconizer.state == UIGestureRecognizerState.began) {
            print("Long Press Begin")
        }else if (gestureReconizer.state == UIGestureRecognizerState.ended) {
            print("Long Press Over")
        }
            
            
    }


    @IBAction func TapBtn(_ sender: UITapGestureRecognizer) {
        
        print("Tap")
        
    }
    
    /*
    @IBAction func LongTapBtn(_ sender: UILongPressGestureRecognizer) {
        
        //呼び出されたタイミングを確認する。
        if(sender.state == UIGestureRecognizerState.began) {
            print("LongPress")
        } else if (sender.state == UIGestureRecognizerState.ended) {
            print("LongPress Over")
        }
    }*/
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

