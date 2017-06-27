//
//  ViewController.swift
//  SwiftAdaptiveUILabel
//
//  Created by Takanori.H on 2017/06/27.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    var count = 0
    
    let items = ["A simple sentence has only one clause", "The children were laughing.", "This is a pen.", "A complex sentence has a main clause and one or more adverbial clauses. Adverbial clauses usually come after the main clause"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func changeText(_ sender: UIButton) {
        if (self.count > 3){
            self.count = 0
        }
        self.textLabel.text = items[count]
        self.count = self.count + 1
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

