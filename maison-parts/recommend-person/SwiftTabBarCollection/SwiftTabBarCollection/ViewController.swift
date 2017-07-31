//
//  ViewController.swift
//  SwiftTabBarCollection
//
//  Created by Takanori.H on 2017/07/22.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIGestureRecognizerDelegate{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var images = ["one", "two", "three", "four", "five", "six"]

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
    
}

