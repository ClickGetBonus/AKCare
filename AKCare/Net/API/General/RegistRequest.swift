//
//  RegistRequest.swift
//  AKCare
//
//  Created by Aki on 2018/1/22.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

/*
 用户注册
 */
struct RegistRequest: Request {
    
    typealias Response = BaseResponse
    
    let path = "finishReg.do"
    let method: HTTPMethod = .post
    
    var regType: RegType //注册类型。md为门店会员，sg为施工会员
    var regCode: String //注册码
    var account: String //账号
    var passwd: String //密码
    var promAccount: String //推荐人
    var shopId: String //所属门店id
    var name: String //用户真实姓名
    var birthday: String //生日。格式为：yyyy-MM-dd
    var tel: String //用户手机
    var jobTitle: String //职位
    var address: String //地址
    var cityId: String //城市id
    var provinceId: String //省份id
    var smsValidCode: String //短信验证码
    var sex: Int //性别。1为男，2为女
    
    
    var parameters: [String: Any] { return
        [
            "regType" : regType.rawValue,
            "regCode" : regCode,
            "account" : account,
            "passwd" : passwd,
            "promAccount" : promAccount,
            "shopId" : shopId,
            "name" : name,
            "birthday" : birthday,
            "tel" : tel,
            "jobTitle" : jobTitle,
            "address" : address,
            "cityId" : cityId,
            "provinceId" : provinceId,
            "smsValidCode" : smsValidCode,
            "sex" : sex
        ]
    }
}

