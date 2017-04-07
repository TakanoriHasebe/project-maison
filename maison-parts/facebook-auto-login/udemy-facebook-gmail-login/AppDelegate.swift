//
//  AppDelegate.swift
//  udemy-facebook-gmail-login
//
//  Created by Takanori.H on 2017/04/05.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit
import Firebase // コピペ
import FBSDKLoginKit // コピペ
import GoogleSignIn // コピペ

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    // コピペ
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // コピペ
        // print("App delegateが呼ばれました")
        FIRApp.configure()
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions) 
        
        /*
        // コピペ
        /*Firebaseにログインしていたら、次の画面に移動する。*/
        if (FIRAuth.auth()?.currentUser) != nil {
            
            /*Firebaseにログインしていたら、次の画面に移動する。*/
            
            //windowを生成
            self.window = UIWindow(frame: UIScreen.main.bounds)
            //Storyboardを指定
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            //Viewcontrollerを指定
            let initialViewController = storyboard.instantiateViewController(withIdentifier: "target")
            //rootViewControllerに入れる
            self.window?.rootViewController = initialViewController
            // 表示
            self.window?.makeKeyAndVisible()
 
            
            
        } else {
            
            
        }*/
                
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        let handle = GIDSignIn.sharedInstance().handle(url, sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplicationOpenURLOptionsKey.annotation])
        
        /*
        // Facebookの時はこちらを用いる
        let handle = FBSDKApplicationDelegate.sharedInstance().application(app, open: url, sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String!, annotation: options[UIApplicationOpenURLOptionsKey.annotation])
        */
 
        return handle
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // 
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: AnyObject) -> Bool{
        
        return FBSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
        
    }
    

}

