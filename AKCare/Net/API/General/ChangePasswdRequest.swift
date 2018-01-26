//
//  ChangePasswdRequest.swift
//  AKCare
//
//  Created by Aki on 2018/1/24.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import Alamofire

/*
 1.10.3    修改个人密码
 */
struct ChangePasswdRequest: Request {
    
    typealias Response = BaseResponse
    
    let path = "changePw.do"
    let method: HTTPMethod = .post
    
    var sid: String
    var passwd: String
    var newPasswd: String
    
    var parameters: [String: Any] { return [ "sid" : sid, "newPasswd" : newPasswd, "passwd" : passwd] }
}


