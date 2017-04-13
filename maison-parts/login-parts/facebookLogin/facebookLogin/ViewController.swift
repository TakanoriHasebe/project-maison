//
//  ViewController.swift
//  facebookLogin
//
//  Created by Takanori.H on 2017/04/11.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//
// https://www.udemy.com/ios_linetalkroom_swift3/learn/v4/t/lecture/6055490?start=0
// https://console.firebase.google.com/project/facebooklogin-f8c44/authentication/users


import UIKit
import FBSDKLoginKit // コピペ
import Firebase

class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // コピペ
        // Facebookログインのボタンの作成
        let fbLoginButton = FBSDKLoginButton()
        fbLoginButton.frame = CGRect(x: self.view.frame.size.width/10, y:self.view.frame.size.height/1.5, width: self.view.frame.size.width-(self.view.frame.size.width/10 + self.view.frame.size.width/10), height: self.view.frame.size.height / 15)
        self.view.addSubview(fbLoginButton)
        
        // コピペ
        fbLoginButton.delegate = self
        
    }
    
    // コピペ
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        if error != nil{
            
            print("エラーです")
            print(error)
            
        }else if result.isCancelled{
            
            
            
        }else{
            
            // 取得
            self.buttonTapped()
            
            
        }
        
    }
    
    // コピペ
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("ログアウトしました")
    }
    
    // コピペ
    func buttonTapped(){
        performSegue(withIdentifier: "target", sender: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

