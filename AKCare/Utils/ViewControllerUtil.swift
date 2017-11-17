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
        HUD.flash(.label("text"), delay: HUDPresentTimeInterval)
    }
    
    func showError() {
        HUD.flash(.error, delay: HUDPresentTimeInterval)
    }
}


extension UIViewController {
    
    func delay(seconds: Double,completion: @escaping ()->()) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime(floatLiteral: seconds)) {
            completion()
        }
    }
    
}
