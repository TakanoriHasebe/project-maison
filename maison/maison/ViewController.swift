//
//  ViewController.swift
//  maison
//
//  Created by Takanori.H on 2017/04/13.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupFacebookButton()
        
    }

    fileprivate func setupFacebookButton(){
        
        // コピペ①
        // Facebookログインのボタンの作成
        let fbLoginButton = FBSDKLoginButton()
        fbLoginButton.frame = CGRect(x: self.view.frame.size.width/10, y:self.view.frame.size.height/1.5, width: self.view.frame.size.width-(self.view.frame.size.width/10 + self.view.frame.size.width/10), height: self.view.frame.size.height / 15)
        self.view.addSubview(fbLoginButton)
        
        // コピペ①
        // fbLoginButton.delegate = self
        // fbLoginButton.readPermissions = ["email"]
        
    }
    
    // ①
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("ログアウトしました")
    }
    
    // ①
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        if error != nil{
            
            print("エラーです")
            print(error)
            return
            
        }else if result.isCancelled{
            
            
            
        }else{
            
            print("ログインしました")
            // self.showEmailAddress()
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

