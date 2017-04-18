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

class ViewController: UIViewController, FBSDKLoginButtonDelegate, GIDSignInUIDelegate, GIDSignInDelegate {
    
    @IBOutlet weak var googleBtnTapped: GIDSignInButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setupFacebookButton()
        
        // setupGoogleButton()
        
        // Google
        GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        
        
    }
    
    /*
    //ログインが成功した場合
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
                withError error: NSError!) {
        print("Google Sing In didSignInForUser")
        
        
        
        if let error = error {
            print(error.localizedDescription)
            return
        }
        let authentication = user.authentication
        let credential = FIRGoogleAuthProvider.credential(withIDToken: (authentication?.idToken)!,accessToken: (authentication?.accessToken)!)
        //ユーザ登録後の処理....
        
    }*/
    
    
    /*
    fileprivate func setupGoogleButton(){
        
        // コピペ③
        let googleButton = GIDSignInButton()
        /*googleButton.frame = CGRect(x: self.view.frame.size.width/10, y: 100, width: self.view.frame.size.width-(self.view.frame.size.width/10 + self.view.frame.size.width/10), height: self.view.frame.size.height / 15)*/
        googleButton.frame = CGRect(x:((self.view.bounds.width-320)/2),y:400,width:320,height:50)
        self.view.addSubview(googleButton)
        
        GIDSignIn.sharedInstance().uiDelegate = self
        
    }*/
    
    // Google
    @IBAction func googleBtnTapped(_ sender: AnyObject) {
        
        // GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
        print("Googleボタンが押されました")
        
    }
    
    // Google
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        print("Googleログインに成功しました。")
        if let error = error {
            print(error.localizedDescription)
            return
        }
        let authentication = user.authentication
        let credential = FIRGoogleAuthProvider.credential(withIDToken: (authentication?.idToken)!,accessToken: (authentication?.accessToken)!)
        //ユーザ登録後の処理....
        
        self.performSegue(withIdentifier: "target", sender: nil)
        
    }
    
    // Google
    //ログインがキャンセル・失敗した場合
    func signIn(signIn: GIDSignIn!, didDisconnectWithUser user:GIDGoogleUser!,
                withError error: NSError!) {
        print("Googleログインに失敗しました。")
        // Perform any operations when the user disconnects from app here.
        // ...
    }
    
    
    
    
    
    
    
    
    
    
    
    // Facebook
    @IBAction func facebookBtnTapped(_ sender: AnyObject) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil{
                print("Facebookログインに失敗しました。")
            }else if result?.isCancelled == true{
                print("Facebookログインをキャンセルしました。")
            }else{
                print("Facebookログインに成功しました。")
                self.showEmailAddress()
                self.performSegue(withIdentifier: "target", sender: nil)
            }
        }
        
        
    }
    
    /*
    fileprivate func setupFacebookButton(){
        
        // コピペ①
        // Facebookログインのボタンの作成
        let fbLoginButton = FBSDKLoginButton()
        /*fbLoginButton.frame = CGRect(x: self.view.frame.size.width/10, y:self.view.frame.size.height/1.5, width: self.view.frame.size.width-(self.view.frame.size.width/10 + self.view.frame.size.width/10), height: self.view.frame.size.height / 15)*/
        fbLoginButton.frame = CGRect(x:((self.view.bounds.width-314)/2),y:465,width:314,height:40)
        self.view.addSubview(fbLoginButton)
        
        // コピペ①
        fbLoginButton.delegate = self
        fbLoginButton.readPermissions = ["email"]
        
    }*/
    
    
    
    // ①
    // Facebook
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("ログアウトしました")
    }
    
    // ①
    // Facebook
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
    // Facebook
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

