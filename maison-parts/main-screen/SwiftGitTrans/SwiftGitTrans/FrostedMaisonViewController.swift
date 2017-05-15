//
//  FrostedMaisonViewController.swift
//  SwiftGitTrans
//
//  Created by Takanori.H on 2017/05/15.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit

class FrostedMaisonViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    
    var resultBox = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func plus(_ sender: Any) {
        
        // ラベル(countLabel)に表示する数字をカウントアップさせていく
        
        resultBox = resultBox + 1
        
        // resultBoxの値をcountLabelの文字として代入
        countLabel.text = String(resultBox)
        
    }
    
    @IBAction func minus(_ sender: Any) {
        
        // ラベル(countLabel)に表示する数字をカウントダウンさせていく
        
        resultBox = resultBox - 1
        
        countLabel.text = String(resultBox)
        
    }
    
    
    
    
    @IBAction func onBurger() {
        (tabBarController as! TabBarController).sidebar.showInViewController(self, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
    }

}
