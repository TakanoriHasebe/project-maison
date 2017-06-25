//
//  PopUpViewController.swift
//  PopUpView
//
//  Created by Takanori.H on 2017/05/31.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    /* Main.storyboardを用いた場合には、画像の読み込み、自己紹介の読み込みについて */
    /******************** call first ********************/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* 背景色の設定 */
        // self.view.backgroundColor = UIColor.black
        
        self.showAnimate()
        
    }
    
    @IBOutlet weak var profileLabel: UILabel!
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
    }
    
    
    /******************** setting animation ********************/
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.10, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.20, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
    
}

/* 残り書き */
/*
 /* UILabelをコードで書いている */
 let label = UILabel()
 label.frame = CGRect(x:150, y:300, width:100, height:100)
 label.text = "In my free time I like reading, going out with friends, listening to music, and going for walks around Tokyo."
 label.backgroundColor = UIColor.white
 label.textColor = UIColor.black
 /* Labelのフォントを変更 */
 label.font = UIFont(name: "HiraMinProN-W3", size: 15)
 label.sizeToFit()
 self.view.addSubview(label)
 */

/*
 /******************** create UI ********************/
 
 /* 自己紹介の画像 */
 let profileImage: UIImageView = {
 
 let profileImage = UIImageView()
 profileImage.image = UIImage(named: "personImage0")
 profileImage.translatesAutoresizingMaskIntoConstraints = false
 profileImage.contentMode = .scaleAspectFill
 
 return profileImage
 
 }()
 
 /* 名前の文 */
 let nameLabel: UILabel = {
 
 let nameLabel = UILabel()
 nameLabel.textColor = UIColor.white
 nameLabel.backgroundColor = UIColor.black
 nameLabel.text = "Mick Willoughby"
 nameLabel.sizeToFit()
 
 return nameLabel
 
 }()
 
 /* 自己紹介の文 */
 let profileLabel: UILabel = {
 
 let profileLabel = UILabel()
 profileLabel.backgroundColor = UIColor.black
 profileLabel.textColor = UIColor.white
 profileLabel.text = "Test"
 profileLabel.font = UIFont(name: "HiraMinProN-W3", size: 15)
 profileLabel.sizeToFit()
 
 return profileLabel
 
 }()
 */

/*
 /******************** contraints ********************/
 
 /* プロフィールの画像 */
 func setupProfileImage(){
 // need x, y, width, hegiht, constraints
 profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
 profileImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
 profileImage.widthAnchor.constraint(equalToConstant: view.bounds.size.width).isActive = true
 profileImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
 }
 
 /* プロフィールの名前 */
 func setupProfileName(){
 // need x, y, width, hegiht, constraints
 // nameLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 100).isActive = true
 
 }
 
 /* プロフィールの文 */
 func setupProfileLabel(){
 // need x, y, width, hegiht, constraints
 
 
 }
 */

/*
 /*
 @IBAction func closePopUp(_ sender: AnyObject) {
 
 // self.view.removeFromSuperview()
 self.removeAnimate()
 
 }*/
 */
