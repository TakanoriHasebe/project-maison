 recomment-person
  
`LongTapPressMotio1` 長押しした時と、タップした時のモーションの変更 こちらを用いる  
`PopUpView` Pressを押したら、プロフィール画面に遷移  
`SwiftAdaptiveUILabel` 設定された文章の長さによって、UILabelの長さが変わる  
`multipleCollectionView` RecommendPersonViewの基本形。Tap・LongPressなどの動作はついていない。  
AutoLayoutに対応するためには、CollectionViewのCellの大きさ・並び方について考える必要性がある。    
`SwiftImgBlurEffect` BlurEffectをコードで書いている。 
`SwiftBlureffect` Effectボタンを押すと、背景画像（Effectボタンも含めた）にBlurがかかり、PopUpViewが出現。  
PopUpViewのDoneボタンを押すことで、PopUpViewとBlurを消すことができる。   
`RecommedPersonMain` Firebaseから画像を読み込み、RecommendPersonの最初のViewに表示するというところまでを再現し  
タップするとプロフィールが表示される。長押しの動作についてはまだ付与していない。  
また、複数選択のボタンの配置も行っていない。   
`SwiftBlurEffectCollection` 別のCollectionViewからRecommendPersonに遷移。  
遷移してからはtap・longpressに対応指定ないが、人の複数選択はできるようになっている。  
しかし、複数選択を解除するか・しないかというところには対応していない。   
