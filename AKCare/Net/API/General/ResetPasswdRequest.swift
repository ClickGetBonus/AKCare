//
//  ResetPasswdRequest.swift
//  AKCare
//
//  Created by Aki on 2018/1/22.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

/*
 重置用户密码
 */
struct ResetPasswdRequest: Request {
    
    typealias Response = BaseResponse
    
    let path = "resetPasswd.do"
    let method: HTTPMethod = .get
    
    var tel: String
    var smsValidCode: String
    var passwd: String
    
    var parameters: [String: Any] { return [ "tel" : tel, "smsValidCode" : smsValidCode, "passwd" : passwd] }
}

