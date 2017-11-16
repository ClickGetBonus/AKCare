//
//  AKUserManager.swift
//  AKCare
//
//  Created by Aki on 2017/11/6.
//  Copyright © 2017年 Ian. All rights reserved.
//


import Foundation
import SwiftyJSON

class UserManager {
    
    var userAuth: Auth? {
        get {
            let json = UserDefaults.standard.string(forKey: "userAuth")
            return Auth.deserialize(from: json)
        }
        set {
            if newValue != nil {
                UserDefaults.standard.set(JSON(newValue!).stringValue, forKey: "userAuth")
            }
        }
    }
}
