//
//  ViewController.swift
//  SwiftTapPointGet
//
//  Created by Takanori.H on 2017/05/28.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tapLocation: CGPoint = CGPoint()
    
    // タップした場所を取得する関数
    /* この中に書いていく */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // タッチイベントを取得する
        let touch = touches.first
        
        // タップした座標を取得する
        tapLocation = touch!.location(in: self.view)
        
        // タップした座標の表示
        // print(tapLocation.x)
        // print(tapLocation.y)
        
        /* 以下if文 */
        
    }
    
    @IBAction func Tap(_ sender: UITapGestureRecognizer) {
        
        print("Tap")
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
    }


}

