//
//  PopUpViewController.swift
//  SwiftCollectionView1
//
//  Created by Takanori.H on 2017/07/03.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

/*
 課題点
 1. タップしたところの画像、Profileを読み込む
 2. 
 
 */

import UIKit

class PopUpViewController: UIViewController {

    /* profile text */
    // @IBOutlet weak var profileLabel: UILabel!
    // private var profileImageView: UIImageView!
    
    @IBOutlet weak var profileLabel: UILabel!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /******************** setting profileImage ********************/
        var imageName: String
        
        /* AppDelegateを通して、保存された名前を取得する */
        let delegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        imageName = delegate.profileImageNumber
        
        
        let image = UIImage(named: imageName)
        profileImage.image = image
        /******************** setting profileImage ********************/
        
        
        
        self.profileLabel.text = "以前、ゼロ初級日本語学習者への1時間目の授業「自己紹介」をアップしたら、かなり好評でしで、今回は2015年バージョンの動画です。学生も今回は3人います。ドイツ・韓国・フランスの学生。韓国の学生は少し日本語を知っています。高校のときの第二外国語で勉強したそうです。"
        
        
        
        /* Animation */
        self.showAnimate()
        
        
    }
    
    @IBAction func back(_ sender: Any) {
        
        self.removeAnimate()
        
    }
    

    /******************** setting animation ********************/
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.10, animations: {
            self.view.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
    /******************** setting animation ********************/
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

}

/* 残り書き */
/*
 /******************** setting profileImage ********************/
 /* 取得された画像の名前 */
 var imageName: String!
 
 /* AppDelegateを通して、保存された名前を取得する */
 let delegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
 imageName = delegate.profileImageNumber
 
 /* 画面の横幅、縦幅を取得 */
 let screenWidth = CGFloat( UIScreen.main.bounds.size.width)
 let screenHeight = CGFloat(UIScreen.main.bounds.size.height)
 
 /* UIImageViewのサイズを設定する */
 let iWidth: CGFloat = screenWidth
 let iHeight: CGFloat = screenHeight / 3.5
 
 /* UIImageViewのx,yを設定する */
 let posX: CGFloat = (self.view.bounds.width - iWidth)/2
 let posY: CGFloat = self.view.bounds.height / 18
 
 /* UIImage Viewを設定 */
 profileImageView = UIImageView(frame: CGRect(x: posX, y: posY, width: iWidth, height: iHeight))
 
 /* UIImageを作成 */
 let myImage: UIImage = UIImage(named: imageName+".png")!
 
 /* 画像をUIImageViewに設定 */
 profileImageView.image = myImage
 
 profileImageView.contentMode = .scaleAspectFit
 
 /* UIImageViewをViewに追加 */
 self.view.addSubview(profileImageView)
 /******************** setting profileImage ********************/
 */


