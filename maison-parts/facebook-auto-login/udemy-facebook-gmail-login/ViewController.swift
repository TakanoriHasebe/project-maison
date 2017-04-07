//
//  ViewController.swift
//  udemy-facebook-gmail-login
//
//  Created by Takanori.H on 2017/04/05.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit
import FBSDKLoginKit //
import FBSDKCoreKit //
import Firebase //

class ViewController: UIViewController{

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        // コピペ
        // Facebookログインのボタンの作成
        let fbLoginButton = FBSDKLoginButton()
        fbLoginButton.frame = CGRect(x: self.view.frame.size.width/10, y:self.view.frame.size.height/2, width: self.view.frame.size.width-(self.view.frame.size.width/10 + self.view.frame.size.width/10), height: 50)
        self.view.addSubview(fbLoginButton)
        */
        
    }

    /*
    // コピペ
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        if error != nil{
            
            print("エラーです")
            print(error)
            
        }else if result.isCancelled{
            
            
            
        }else{
            
            // Facebookボタンがクリックされた時に関数を呼ぶ
            self.FacebookBtnTapped()
            
            
        }
        
    }*/
    
    /*
    // コピペ
    func FacebookBtnTapped(){
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self){
            (result, error) in
            if error != nil{
                print("Unable to authenticate - \(String(describing: error))")
            }else if result?.isCancelled == true{
                print("User canceled Facebook authenticate")
                // self.performSegue(withIdentifier: "next", sender: nil)
            }else{
                
                print("Successfully authenticated with Facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
                self.performSegue(withIdentifier: "target", sender: nil)
            }
            
        }
        
    }*/
    
    
    // コピペ
    // 自分でFacebook Loginボタンをカスタマイズしたいときはこちらを用いる。
    @IBAction func FacebookBtnTapped(_ sender: AnyObject) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self){
            (result, error) in
            if error != nil{
                print("Unable to authenticate - \(String(describing: error))")
            }else if result?.isCancelled == true{
                print("User canceled Facebook authenticate")
                // self.performSegue(withIdentifier: "next", sender: nil)
            }else{
                
                print("Successfully authenticated with Facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
                self.performSegue(withIdentifier: "target", sender: nil)
            }
            
        }
        
    }
    
    // コピペ
    func firebaseAuth(_ credential: FIRAuthCredential){
        
        FIRAuth.auth()?.signIn(with: credential, completion: {
            (user, error) in
            if error != nil{
                print("Unable to authenticate with Firebase - \(String(describing: error))")
            }else{
                print("Successfully Authenticate with Firebase")
            }
        })
        
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
    }
    
}

