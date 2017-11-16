//
//  AppDelegate.swift
//  AKCare
//
//  Created by Aki on 2017/10/25.
//  Copyright © 2017年 Ian. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window!.backgroundColor = UIColor.white
        
        self.window!.rootViewController = self.getInitialVC()
        self.window!.makeKeyAndVisible()
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}


extension AppDelegate {
    
    func setupLoader() {
        
        var config : SwiftLoader.Config = SwiftLoader.Config()
        config.size = 100
        config.spinnerLineWidth = 1.5
        config.spinnerColor = UIColor.lightGray
        
        SwiftLoader.setConfig(config: config)
    }
    
    func getInitialVC() -> UIViewController {
        
        let main: UITabBarController = R.storyboard.main().instantiateInitialViewController() as! UITabBarController
        
        let homeVC = R.storyboard.home().instantiateInitialViewController()!
        homeVC.tabBarItem = UITabBarItem(title: "首页", image: #imageLiteral(resourceName: "home_1"), selectedImage: #imageLiteral(resourceName: "home_2"))
        let messageVC = R.storyboard.message().instantiateInitialViewController()!
        messageVC.tabBarItem = UITabBarItem(title: "资讯", image: #imageLiteral(resourceName: "message_1"), selectedImage: #imageLiteral(resourceName: "message_2"))
        let promotionVC = R.storyboard.promotion().instantiateInitialViewController()!
        promotionVC.tabBarItem = UITabBarItem(title: "活动", image: #imageLiteral(resourceName: "promotion_1"), selectedImage: #imageLiteral(resourceName: "promotion_2"))
        let meVC = R.storyboard.me().instantiateInitialViewController()!
        meVC.tabBarItem = UITabBarItem(title: "我", image: #imageLiteral(resourceName: "me_1"), selectedImage: #imageLiteral(resourceName: "me_2"))
        main.viewControllers = [homeVC,
                                messageVC,
                                promotionVC,
                                meVC]
        return main
    }
}

