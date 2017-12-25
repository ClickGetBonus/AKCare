//
//  MainVC.swift
//  AKCare
//
//  Created by Aki on 2017/10/25.
//  Copyright © 2017年 Ian. All rights reserved.
//

import UIKit

class MainVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = R.storyboard.home().instantiateInitialViewController()!
        homeVC.tabBarItem = UITabBarItem(title: "首页", image: #imageLiteral(resourceName: "home_1"), selectedImage: #imageLiteral(resourceName: "home_2"))
        let messageVC = R.storyboard.infomation().instantiateInitialViewController()!
        messageVC.tabBarItem = UITabBarItem(title: "资讯", image: #imageLiteral(resourceName: "message_1"), selectedImage: #imageLiteral(resourceName: "message_2"))
        let promotionVC = R.storyboard.promotion().instantiateInitialViewController()!
        promotionVC.tabBarItem = UITabBarItem(title: "活动", image: #imageLiteral(resourceName: "promotion_1"), selectedImage: #imageLiteral(resourceName: "promotion_2"))
        let meVC = R.storyboard.me().instantiateInitialViewController()!
        meVC.tabBarItem = UITabBarItem(title: "我", image: #imageLiteral(resourceName: "me_1"), selectedImage: #imageLiteral(resourceName: "me_2"))
        self.viewControllers = [homeVC,
                                messageVC,
                                promotionVC,
                                meVC]
    }
    
    
}

