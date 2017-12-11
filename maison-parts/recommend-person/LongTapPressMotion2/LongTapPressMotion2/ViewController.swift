//
//  ViewController.swift
//  LongTapPressMotion2
//
//  Created by Takanori.H on 2017/12/11.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func getView() -> UIView {
        let myView: UIView = UIView(frame: CGRect(x:0, y:0, width:20, height:100))
        
        // ダブルタップ
        let doubleTap = UITapGestureRecognizer(target: myView, action: "tappdDouble:")
        doubleTap.numberOfTapsRequired = 2
        myView.addGestureRecognizer(doubleTap)
        
        // シングルタップ
        let singleTap = UITapGestureRecognizer(target: myView, action: "tappedSingle:")
        singleTap.numberOfTapsRequired = 1
        singleTap.require(toFail: doubleTap)
        myView.addGestureRecognizer(singleTap)
        
        // ホールド
        let longPress = UILongPressGestureRecognizer(target: myView, action: "pressedLong:")
        myView.addGestureRecognizer(longPress)
        
        return myView
    }
    
    func tappdDouble(sender: UITapGestureRecognizer!) {
        // ダブルタップしたときの処理
        print("double tapped")
    }
    
    func tappedSingle(sender: UITapGestureRecognizer!) {
        // シングルタップしたときの処理
        print("tapped")
    }
    
    func pressedLong(sender: UILongPressGestureRecognizer!) {
        // 長押ししたときの処理
        
        // ジェスチャーの状態に応じて処理を分ける
        switch sender.state {
        case .began:
            break
        case .cancelled:
            break
        case .ended:
            break
        case .failed:
            break
        default:
            break
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

