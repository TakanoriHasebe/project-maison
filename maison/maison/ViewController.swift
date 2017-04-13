//
//  ViewController.swift
//  maison
//
//  Created by Takanori.H on 2017/04/13.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase
import GoogleSignIn

class ViewController: UIViewController, FBSDKLoginButtonDelegate, GIDSignInUIDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupFacebookButton()
        
        setupGoogleButton()
        
    }
    
    fileprivate func setupGoogleButton(){
        
        // コピペ③
        let googleButton = GIDSignInButton()
        googleButton.frame = CGRect(x: self.view.frame.size.width/10, y: 100, width: self.view.frame.size.width-(self.view.frame.size.width/10 + self.view.frame.size.width/10), height: self.view.frame.size.height / 15)
        self.view.addSubview(googleButton)
        
        GIDSignIn.sharedInstance().uiDelegate = self
        
    }

    fileprivate func setupFacebookButton(){
        
        // コピペ①
        // Facebookログインのボタンの作成
        let fbLoginButton = FBSDKLoginButton()
        fbLoginButton.frame = CGRect(x: self.view.frame.size.width/10, y:self.view.frame.size.height/1.5, width: self.view.frame.size.width-(self.view.frame.size.width/10 + self.view.frame.size.width/10), height: self.view.frame.size.height / 15)
        self.view.addSubview(fbLoginButton)
        
        // コピペ①
        fbLoginButton.delegate = self
        fbLoginButton.readPermissions = ["email"]
        
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
            self.showEmailAddress()
            
        }
        
    }
    
    // ①, ②
    // id, name, emailを取得する
    func showEmailAddress(){
        
        let accessToken = FBSDKAccessToken.current()
        guard let accessTokenString = accessToken?.tokenString else{ return }
        
        let credentials = FIRFacebookAuthProvider.credential(withAccessToken: accessTokenString)
        FIRAuth.auth()?.signIn(with: credentials, completion:{ (user, error) in
            if error != nil{
                print("Firebaseでエラーが発生しています。")
                print(error ?? "")
                return
            }
            
            print("Firebaseのログインに成功しました。")
            print(user ?? "")
        })
        
        FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "name, id, email"]).start { (connection, result, err) in
            if err != nil{
                print("Failed to start graph request:", err!)
                return
            }
            
            print(result!)
            
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

