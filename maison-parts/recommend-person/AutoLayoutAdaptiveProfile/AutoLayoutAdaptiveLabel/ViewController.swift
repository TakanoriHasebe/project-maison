//
//  ViewController.swift
//  AutoLayoutAdaptiveLabel
//
//  Created by Takanori.H on 2017/12/12.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    var count = 0
    
    /* 長文の場合デバイスによって、表示される文章が変わる。 */
    /* この部分について考える。 */
    let items = ["Aside from the activities I've listed, there are plenty of other seasonal events that spring up quickly around here, so please keep an eye out for those, and hopefully you can help publicize them as they come up. For more specific information about the events listed, please contact the respective facilities. Here's a list of community resources in the Fountain Hills area. In the Fountain Hills downtown area we have a few centers that serve the general public. I hope you will include that informaIn the Fountain Hills downtown area we have a few centers that serve the general public. I hope you will include that informaIn the Fountain Hills downtown area we have a few centers that serve the at", "二十年ほど前にソ連旅行をしたことがあるが、モスクワやレニングラード大学の日本語科の教師や学生に会い、専ら日本語を使っていた。レニングラードのホテルから空港までのインツーリストの自動車に乗る前、三人のソ連人の女性に見送られ、丁寧な日本語の挨拶を言われた。「折角遠いところまでおいでになって下さいましたのに何のお構いもできませんでした」と言われたので、私も負けずに「いいえ、身に余るほどのご接待に与ってお礼の言葉もございません」と相槌を打った。言うべき挨拶を全部言ってからいよいよ自動車に乗った。その時始めて分ったが、私と同様に空港へ向かう日本人旅行者が前から乗っていて私たちの会話をずっと聞いていた。彼は、私がソ連人ではなく、共通な言葉は日本語しかないということを勿論知どうしてソ連人同士が日本語をしゃ", "This is a pen.", "A complex sentence has a main clause and one or more adverbial clauses. Adverbial clauses usually come after the main clause"]
    
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

