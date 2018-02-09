//
//  AKUserManager.swift
//  AKCare
//
//  Created by Aki on 2017/11/6.
//  Copyright © 2017年 Ian. All rights reserved.
//


import Foundation
import SwiftyJSON

class AKUserManager {
    
    static func getSid() -> String {
        return self.userAuth?.sid ?? ""
    }
    
    static var userAuth: Auth? {
        get {
            let json = UserDefaults.standard.string(forKey: "userAuth")
            return Auth.deserialize(from: json)
        }
        set {
            if newValue != nil {
                let json = newValue!.toJSONString()
                UserDefaults.standard.set(json, forKey: "userAuth")
            }
        }
    }
}
