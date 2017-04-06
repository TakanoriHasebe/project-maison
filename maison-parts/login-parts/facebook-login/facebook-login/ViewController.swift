//
//  ViewController.swift
//  facebook-login
//
//  Created by Takanori.H on 2017/04/04.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit
import FBSDKLoginKit //
import Firebase

class ViewController: UIViewController, FBSDKLoginButtonDelegate{

    
    var name = String()
    var base64String = String()
    var uuid = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ここでFacebookの元から存在するボタンを貼り付け
        let fbLoginButton = FBSDKLoginButton()
        fbLoginButton.frame = CGRect(x: self.view.frame.size.width/10, y:self.view.frame.size.height/2, width: self.view.frame.size.width-(self.view.frame.size.width/10 + self.view.frame.size.width/10), height: 50)
        self.view.addSubview(fbLoginButton)
        
        fbLoginButton.delegate = self
        
        // 画面が呼ばれた瞬間に次のページへ飛ばす
        // viewDidLoadのところに書けるpodを探す
        if UserDefaults.standard.object(forKey: "OK") != nil{
            
            print("１度ログインしているので, 次の画面へ画面遷移")
            performSegue(withIdentifier: "next", sender: nil)
            
        }
        
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        if error != nil{
            
            print("エラーです")
            print(error)
            
        }else if result.isCancelled{
            
            
            
        }else{
            
            // 取得
            getFacebookUerInfo()
            
            
        }
        
    }
    
    func getFacebookUerInfo(){
        
        // 取得
        if FBSDKAccessToken.current() != nil{
            
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"id,name"]).start{
                (connection, result, error) in
                
                self.name = (result! as AnyObject).value(forKey: "name") as! String
                
                let id = (result! as AnyObject).value(forKey: "id") as! String
                
                let url = URL(string : "http://graph.facebook.com/\(id)/picture?type=large&return_ssl_resources=1")
                
                let dataURL = NSData(contentsOf:url!)
                
                self.base64String = dataURL!.base64EncodedString(options:NSData.Base64EncodingOptions.lineLength64Characters) as String
                
                // アプリ内へ保存する
                UserDefaults.standard.set(self.base64String, forKey: "profileImage")
                UserDefaults.standard.set(self.name, forKey: "name")
                
                
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                FIRAuth.auth()?.signIn(with: credential){
                    (user, error) in
                    
                    if UserDefaults.standard.object(forKey: "OK") != nil{
                        
                        // １度ログインしているので、飛ばす
                        
                        
                    }else{
                        
                        self.uuid = user!.uid
                        // 以下が呼ばれたことで１度ログインした。
                        self.createNewUserDB()
                        
                    }
                    
                }
                
            }
            
            performSegue(withIdentifier: "next", sender: nil)
            
            
            
        }
        
    }
    
    // firebaseのDatabaseから情報を取り出し
    func createNewUserDB(){
        
        // サーバーに情報を飛ばす
        // urlはFirebaseから引き出してくる
        let firebase = FIRDatabase.database().reference(fromURL:"https://maison-login-parts.firebaseio.com/")
        
        // サーバーに飛ばす箱
        let user:NSDictionary = ["username":self.name, "profileImage":self.base64String, "uuid":self.uuid]
        
        firebase.child("users").childByAutoId().setValue(user)
        
        // ユーザー情報にセットした。
        UserDefaults.standard.set("OK", forKey:"OK")
        
    }

    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("ログアウトしました")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
    }


}

