//
//  ViewController.swift
//  SwiftAutoLayoutProgrammatically
//
//  Created by Takanori.H on 2017/12/10.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // here's our entry point into our app
        // view.backgroundColor = .yellow
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        view.addSubview(imageView)
        imageView.frame = CGRect(x:0, y:0, width:50, height:50)
    }

}

