//
//  ViewController.swift
//  SwiftImperialLogin
//
//  Created by Takanori.H on 2017/12/10.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

/**************************
 
 1. Googleでログインに対して以下のURLを参考にボタンを配置
 http://type.jp/et/feature/3137
 上記のURLとの違いは、下に対してConstraintsをつける
 下に対してのConstraintsが大きければ大きいほど、iPadに適応しやすくなるが
 一旦はiPhoneに対応でも良い。
 2. Facebookログインを実装する
 Googleログインと違い下にConstraintsをとるのではなくて、Googleボタンに対してConstraitnsをとる
 
***************************/

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

