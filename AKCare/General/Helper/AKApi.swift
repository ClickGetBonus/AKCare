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
    
    
    static func getHomePage(_ complete: @escaping (HomePageRequest.Response?) -> Void) {
        
        guard let sid = self.verifyAuth() else {
            complete(nil)
            return
        }
        
        URLSessionClient.share.send(HomePageRequest(sid: sid)) { (response) in
            complete(response)
        }
    }
    
    static func getMsgType(_ complete: @escaping (InfoTypeRequest.Response?) -> Void) {
        
        guard let sid = self.verifyAuth() else {
            complete(nil)
            return
        }
        
        URLSessionClient.share.send(InfoTypeRequest(sid: sid)) { (response) in
            complete(response)
        }
    }
    
    static func getPromInfo(actId: String, _ complete: @escaping (PromInfoRequest.Response?) -> Void) {
        
        guard let sid = self.verifyAuth() else {
            complete(nil)
            return
        }
        
        URLSessionClient.share.send(PromInfoRequest(sid: sid, actId: actId, actType: "prom")) { (response) in
            complete(response)
        }
    }
    
    
    static func getProdType(_ complete: @escaping (ProdTypeRequest.Response?) -> Void) {
        
        guard let sid = self.verifyAuth() else {
            complete(nil)
            return
        }
        
        URLSessionClient.share.send(ProdTypeRequest(sid: sid)) { (response) in
            complete(response)
        }
    }
    
    
    
    
    
    
    
    private static func verifyAuth() -> String? {
        
        
        if let sid = AKUserManager.userAuth?.sid {
            return sid
        } else {
            UIApplication.shared.keyWindow?.rootViewController!.showInfo("登录已过期, 请重新登录")
            UIApplication.shared.keyWindow?.rootViewController = R.storyboard.login().instantiateInitialViewController()!
            return nil
        }
    }
    
    
}
