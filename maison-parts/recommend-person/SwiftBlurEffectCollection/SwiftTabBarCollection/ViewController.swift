//
//  ViewController.swift
//  SwiftTabBarCollection
//
//  Created by Takanori.H on 2017/07/22.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIGestureRecognizerDelegate{
    
    @IBOutlet var addItemView: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var images = ["one", "two", "three", "four", "five", "six", "person11", "person12", "person13", "person14", "person15", "person16", "person17", "person18", "person19", "person20", "person21"]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Collection Viewに必要 */
        collectionView.delegate = self
        collectionView.dataSource = self
        
        /* LongPress */
        let lpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.handleLongPress(_:)))
        lpgr.minimumPressDuration = 0.3
        lpgr.delaysTouchesBegan = true
        lpgr.delegate = self
        self.collectionView.addGestureRecognizer(lpgr)
        
        /* PopUpView */
        addItemView.layer.cornerRadius = 5
        
        self.collectionView.isUserInteractionEnabled = true
        
    }
    
    
    /* LongPressの時の動作 */
    func handleLongPress(_ gestureReconizer: UILongPressGestureRecognizer) {
        /*
         if gestureReconizer.state != UIGestureRecognizerState.ended {
         return
         }*/
        
        let p = gestureReconizer.location(in: collectionView)
        let indexPath = collectionView.indexPathForItem(at: p)
        
        if let index = indexPath {
            var cell = collectionView.cellForItem(at: index)
            // do stuff with your cell, for example print the indexPath
            
            if( gestureReconizer.state == UIGestureRecognizerState.began) {
                print("Long Press Begin")
                let transform = self.collectionView.transform
                UICollectionView.animate(withDuration: 0.0, animations: {
                    cell?.transform = CGAffineTransform(scaleX: 0.98, y: 0.98)
                })
                
                /************ コピペ ***********/
                /* addItemViewの初期設定 */
                addItemView.center = self.view.center
                /************ コピペ ***********/
                
                /************ コピペ ***********/
                /* Animationの設定 */
                // self.backgoundImg.addBlurEffect() /* Extensionを用いたBlur */
                self.collectionView.addBlurEffect()
                addItemView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
                addItemView.alpha = 0
                
                UIView.animate(withDuration: 0.4) {
                    self.view.addSubview(self.addItemView)
                    self.addItemView.alpha = 1
                    self.addItemView.transform = CGAffineTransform.identity
                }
                /************ コピペ ***********/
                
                print(index.row)
                
            }else if (gestureReconizer.state == UIGestureRecognizerState.ended) {
                
                cell?.transform = CGAffineTransform.identity
                print("Long Press Over")
                
            }
            
            
        } else {
            print("Could not find index path")
        }
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        return images.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        cell.layer.cornerRadius = 50
        
        cell.myImages.setBackgroundImage(UIImage(named: images[indexPath.row])!, for: UIControlState.normal)
        cell.myImages.contentMode = .scaleToFill
        
        return cell
        
    }
    
    /* BlurとPopUpViewを取り外す */
    @IBAction func removeBlurEffect(_ sender: Any) {
        
        UIView.animate(withDuration: 0.3, animations: {
            self.addItemView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.addItemView.alpha = 0
        }) { (success:Bool) in
            
            self.collectionView.removeBlurEffect()
            self.addItemView.removeFromSuperview()
            
        }

        
    }
    
    /* CollctionViewのcellを複数選択する */
    @IBAction func multiSelection(_ sender: Any) {
        
        collectionView.allowsMultipleSelection = true
    
    }
    
    
}

/************ コピペ ***********/
extension UICollectionView
{
    
    func addBlurEffect(){
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.extraLight)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
        
    }
    
    func removeBlurEffect() {
        // UIImageViewのsubviewすべてに対して、
        self.subviews.forEach{
            // 型をUIVisualEffectViewにキャストできる、すなわち型がUIVisualEffectViewであるsubviewは、
            if let effectView = $0 as? UIVisualEffectView {
                // superviewから取り外す。
                effectView.removeFromSuperview()
            }
        }
    }
}
/************ コピペ ***********/


