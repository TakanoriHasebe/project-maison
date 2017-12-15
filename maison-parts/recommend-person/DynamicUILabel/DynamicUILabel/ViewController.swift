//
//  ViewController.swift
//  DynamicUILabel
//
//  Created by Takanori.H on 2017/12/15.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        """
        英文
        500文字
        self.textLabel.text = "Aside from the activities I've listed, there are plenty of other seasonal events that spring up quickly around here, so please keep an eye out for those, and hopefully you can help publicize them as they come up. For more specific information about the events listed, please contact the respective facilities. Here's a list of community resources in the Fountain Hills area. In the Fountain Hills downtown area we have a few centers that serve the general public. I hope you will include that informa"
        """
        
        """
        日本文
        263文字
        self.textLabel.text = "昔の人々は、明るい星を結んで星座を思い描きました。星座を作ったのは、シュメール人という説もありますが、一般的には、約五千年前、バビロニアの羊飼いたちによって、作られたのが最初と言われています。【２】初めのころは、十二星座でしたが、その後、四十八星座に増えました。十七世紀に、オランダで望遠鏡が発明され、暗い星も観測できるようになると、四十八星座のすきまにも新しい星座が作られるようになりました。【３】そのころ、星を見つけるたびに、こんな会話が交わされたかもしれません。「新しい星を見つけたぞ。」「だめ。それは、おらンダ。」 "
        """
        
        
        print()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

