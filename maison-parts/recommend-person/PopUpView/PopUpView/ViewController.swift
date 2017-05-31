//
//  ViewController.swift
//  PopUpView
//
//  Created by Takanori.H on 2017/05/31.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//
/*
 
 PopUpView
 https://www.youtube.com/watch?v=FgCIRMz_3dE
 
 Animation
 https://www.youtube.com/watch?v=CXvOS6hYADc
 
*/



import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showPopup(_ sender: AnyObject) {
        
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sbPopUpID") as! PopUpViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
        
    }

}

