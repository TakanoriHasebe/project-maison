//
//  TabBarController.swift
//  FrostedSidebar
//
//  Created by Evan Dekhayser on 8/28/14.
//  Copyright (c) 2014 Evan Dekhayser. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
	
	var sidebar: FrostedSidebar!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		delegate = self
		tabBar.isHidden = true
		
		moreNavigationController.navigationBar.isHidden = true
		
		sidebar = FrostedSidebar(itemImages: [
			UIImage(named: "FrostedMaison")!,
			UIImage(named: "FrostedPerson")!,
			UIImage(named: "FrostedChatroom")!,
			UIImage(named: "FrostedPath")!,
			UIImage(named: "FrostedGear")!],
			colors: [
				UIColor(red: 240/255, green: 159/255, blue: 254/255, alpha: 1),
				UIColor(red: 159/255, green: 254/255, blue: 240/255, alpha: 1),
				UIColor(red: 254/255, green: 159/255, blue: 221/255, alpha: 1),
				UIColor(red: 173/255, green: 254/255, blue: 159/255, alpha: 1),
				UIColor(red: 159/255, green: 173/255, blue: 254/255, alpha: 1)],
			selectionStyle: .single)
		sidebar.actionForIndex = [
			0: {self.sidebar.dismissAnimated(true, completion: { finished in self.selectedIndex = 0}) },
			1: {self.sidebar.dismissAnimated(true, completion: { finished in self.selectedIndex = 1}) },
			2: {self.sidebar.dismissAnimated(true, completion: { finished in self.selectedIndex = 2}) },
			3: {self.sidebar.dismissAnimated(true, completion: { finished in self.selectedIndex = 3}) },
			4: {self.sidebar.dismissAnimated(true, completion: { finished in self.selectedIndex = 4}) },
            ]
	}
	
}
