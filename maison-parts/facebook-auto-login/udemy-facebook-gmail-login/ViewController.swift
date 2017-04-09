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
import GoogleSignIn //

class ViewController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate{

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let googleButton = GIDSignInButton()
        googleButton.frame = CGRect(x: self.view.frame.size.width/10, y: self.view.frame.size.height/1.8, width: self.view.frame.size.width-(self.view.frame.size.width/10 + self.view.frame.size.width/10), height: self.view.frame.size.height / 15)
        view.addSubview(googleButton)
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
        // コピペ
        // Facebookログインのボタンの作成
        let fbLoginButton = FBSDKLoginButton()
        fbLoginButton.frame = CGRect(x: self.view.frame.size.width/10, y:self.view.frame.size.height/1.5, width: self.view.frame.size.width-(self.view.frame.size.width/10 + self.view.frame.size.width/10), height: self.view.frame.size.height / 15)
        self.view.addSubview(fbLoginButton)
        
        
    }

    // コピペ
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if let err = error{
            
            print("エラーです。", err)
            return
        }
        
        print("成功しました")
        
        guard  let idToken = user.authentication.idToken else {
            return
        }
        
        guard let accessToken = user.authentication.accessToken else{
            return
        }
        
        let credential = FIRGoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
        
        FIRAuth.auth()?.signIn(with: credential, completion: { (user,error) in
            
            if let err = error{
                
                print("エラーです。")
                return
            }
            
            print("成功")
            
            // 画面移動の際に必要になる。
            self.performSegue(withIdentifier: "target", sender: nil)
            
        })
        
    }
    
    // ユーザーの情報を渡す
    // コピペ
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "target"){
            
            
            
        }
        
    }
    
    /*
    // Facebookログイン
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
    // Facebookログイン
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

