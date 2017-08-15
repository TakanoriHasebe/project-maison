//
//  ViewController.swift
//  multipleCollectionView
//
//  Created by Takanori.H on 2017/08/14.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var images = ["person0", "person1", "person2", "person3", "person4", "person5", "person6", "person7", "person8", "person9", "person10", "person11", "person12"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        return images.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        cell.layer.cornerRadius = 50
        
        cell.myButton.setBackgroundImage(UIImage(named: images[indexPath.row])!, for: UIControlState.normal)
        cell.myButton.contentMode = .scaleToFill
        
        if indexPath.row == 1{
            cell.layer.borderColor = UIColor.cyan.cgColor
            cell.layer.borderWidth = 1.5
        }
        
        return cell
    }
    
    
    
    @IBAction func multiPerson(_ sender: Any) {
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
            
            cell.layer.borderColor = UIColor.cyan.cgColor
            cell.layer.borderWidth = 1.5
            
            
        }
        
    }
    

}

