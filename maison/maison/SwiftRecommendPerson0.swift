//
//  SwiftRecommendPerson0.swift
//  
//
//  Created by Takanori.H on 2017/05/30.
//
//

import UIKit

class SwiftRecommendPerson0: UIViewController {

    var tapLocation: CGPoint = CGPoint()
    
    // タップした場所を取得する関数
    /* この中に書いていく */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // タッチイベントを取得する
        let touch = touches.first
        
        // タップした座標を取得する
        tapLocation = touch!.location(in: self.view)
        
    }
    
    /* Tapの時のジェスチャーをここに追加 */
    @IBAction func Tap(_ sender: UITapGestureRecognizer) {
        
        print("Tap")
        
    }
    
    /* 長押しの時のジェスチャーをここに追加 */
    @IBAction func LongPress(_ sender: UILongPressGestureRecognizer) {
        
        //呼び出されたタイミングを確認する。
        if(sender.state == UIGestureRecognizerState.began) {
            print("LongPress")
            print(tapLocation.x)
        } else if (sender.state == UIGestureRecognizerState.ended) {
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
    }

    
}
