//
//  ViewControllerUtil.swift
//  AKCare
//
//  Created by Aki on 2017/11/6.
//  Copyright © 2017年 Ian. All rights reserved.
//

import Foundation
import UIKit
import PKHUD

let HUDPresentTimeInterval: Double = 1.25

extension UIViewController {
    
    func showInfo(_ text: String) {
        HUD.flash(.label(text), delay: HUDPresentTimeInterval)
    }
    
    func showError() {
        HUD.flash(.error, delay: HUDPresentTimeInterval)
    }
    
    func setupBackItem() {
        self.setupBackItem(selector: #selector(onBack))
    }
    
    func setupBackItem(selector: Selector) {
        
        let backItem = UIBarButtonItem(image: #imageLiteral(resourceName: "back"),
                                       style: .done,
                                       target: self,
                                       action: selector)
        backItem.tintColor = UIColor.lightGray
        self.navigationItem.leftBarButtonItem = backItem
    }
    
    
    @objc func onBack() {
        
        if (self.navigationController?.viewControllers.count)! > 0 {
            let _ = self.navigationController?.popViewController(animated: true)
        }
    }
}


extension UIViewController {
    
    func delay(seconds: Double,completion: @escaping ()->()) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime(floatLiteral: seconds)) {
            completion()
        }
    }
    
}
