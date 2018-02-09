//
//  LogInOut.swift
//  AKCare
//
//  Created by Aki on 2018/2/9.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import UIKit

class LogInOut {
    
    static func login(auth: Auth) {
        
        AKUserManager.userAuth = auth
        UIApplication.shared.keyWindow?.rootViewController = R.storyboard.main.instantiateInitialViewController()
    }
    
    static func logout() {
        
        AKUserManager.userAuth = nil
        UIApplication.shared.keyWindow?.rootViewController = R.storyboard.login().instantiateInitialViewController()!
        UIApplication.shared.keyWindow?.rootViewController!.showInfo("登录已过期, 请重新登录")
    }
}
