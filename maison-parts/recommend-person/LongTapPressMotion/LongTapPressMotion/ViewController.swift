//
//  ViewController.swift
//  LongTapPressMotion
//
//  Created by Takanori.H on 2017/05/25.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.Tap))  //Tap function will call when user tap on button
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.Long)) //Long function will call when user long press on button.
        tapGesture.numberOfTapsRequired = 1
        self.btn.addGestureRecognizer(tapGesture)
        self.btn.addGestureRecognizer(longGesture)
        
 
    }
    
    func Tap() {
        
        // self.view.backgroundColor = UIColor.blue
        print("Tap")
        
    }
    
    func Long() {
        
        // self.view.backgroundColor = UIColor.brown
        print("Long Tap")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
    }


}

