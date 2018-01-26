//
//  VerifyRegRequest.swift
//  AKCare
//
//  Created by Aki on 2018/1/22.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

/*
 1.1.2    验证注册码和用户名
 */
struct VerifyRegRequest: Request {
    
    typealias Response = BaseResponse
    
    let path = "regStep1.do"
    let method: HTTPMethod = .get
    
    /*
     regCode 注册码
     account 登录账号
     regType 注册类型。md为门店会员、sg为施工会员
     */
    var regCode: String
    var account: String
    var regType: RegType
    
    
    var parameters: [String: Any] { return ["userName" : regCode, "passwd" : account, "regType" : regType.rawValue] }
}



