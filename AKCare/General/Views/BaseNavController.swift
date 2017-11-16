//
//  BaseNavController.swift
//  AKCare
//
//  Created by Aki on 2017/11/15.
//  Copyright © 2017年 Ian. All rights reserved.
//

import Foundation
import UIKit

class BaseNavController: UINavigationController,UINavigationControllerDelegate {
    
    override func loadView() {
        super.loadView()
        
//        let navBar = UINavigationBar.appearance()
        
        // 设置导航栏变得不透明 ， 使得视图的坐标的原点从导航栏下边缘开始，也可以设置背景图片达到这个效果
        //        navBar.backIndicatorImage = UIImage(named: "ty_backarrow")
//        navBar.setBackgroundImage(UIImage.imageWithColor(UIColor(0x002b72)), for: .default)
        
    }
    
    var popDelegate: UIGestureRecognizerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.popDelegate = self.interactivePopGestureRecognizer?.delegate
        self.delegate = self
    }
    
    
    
    //UINavigationControllerDelegate方法
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        //实现滑动返回功能
        //清空滑动返回手势的代理就能实现
        if viewController == self.viewControllers[0] {
            self.interactivePopGestureRecognizer!.delegate = self.popDelegate
        }
        else {
            self.interactivePopGestureRecognizer!.delegate = nil
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}


