//
//  SendResetSmsRequest.swift
//  AKCare
//
//  Created by Aki on 2018/1/22.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

/*
 1.1.8    发送用户重置密码的手机验证码
 */
struct SendResetSmsRequest: Request {
    
    typealias Response = BaseResponse
    
    let path = "sendResetPasswdSms.do"
    let method: HTTPMethod = .get
    
    var tel: String
    
    var parameters: [String: Any] { return [ "tel" : tel] }
}

