//
//  AKApi.swift
//  AKCare
//
//  Created by Aki on 2017/11/28.
//  Copyright © 2017年 Ian. All rights reserved.
//

import Foundation
import UIKit

class AKApi {
    
    static func send<T: Request>(request: T, _ complete: @escaping (T.Response?) -> Void) {
        
        guard (!request.parameters.keys.contains("sid") || AKUserManager.getSid() != nil) else {
            
            UIApplication.shared.keyWindow?.rootViewController!.showInfo("登录已过期, 请重新登录")
            UIApplication.shared.keyWindow?.rootViewController = R.storyboard.login().instantiateInitialViewController()!
            return
        }
        
        
        URLSessionClient.share.send(request, handler: complete)
    }
    
    static func sendWithoudSid<T: Request>(request: T, _ complete: @escaping (T.Response?) -> Void) {
        URLSessionClient.share.send(request, handler: complete)
    }
}

