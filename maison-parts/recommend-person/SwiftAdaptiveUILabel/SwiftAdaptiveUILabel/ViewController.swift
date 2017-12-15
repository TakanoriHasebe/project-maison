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
    
    let items = ["Aside from the activities I've listed, there are plenty of other seasonal events that spring up quickly around here, so please keep an eye out for those, and hopefully you can help publicize them as they come up. For more specific information about the events listed, please contact the respective facilities. Here's a list of community resources in the Fountain Hills area. In the Fountain Hills downtown area we have a few centers that serve the general public. I hope you will include that informaIn the Fountain Hills downtown area we have a few centers that serve the general public. I hope you will include that informaIn the Fountain Hills downtown area we have a few centers that serve the at", "The children were laughing.", "This is a pen.", "A complex sentence has a main clause and one or more adverbial clauses. Adverbial clauses usually come after the main clause"]
    
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

