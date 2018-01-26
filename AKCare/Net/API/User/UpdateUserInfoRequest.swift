//
//  UpdateUserInfoRequest.swift
//  AKCare
//
//  Created by Aki on 2018/1/24.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import Alamofire

/*
 1.10.2    更新个人资料
 */
struct UpdateUserInfoRequest: Request {
    
    typealias Response = BaseResponse
    
    let path = "updateUserInfo.do"
    let method: HTTPMethod = .post
    
    var sid: String //会话id
    var name: String //用户的真实姓名
    var tel: String //手机号
    var jobTitle: String //职位
    var address: String //地址
    var birthDate: String //出生日期
    var userLevel: Int //用户等级
    var point4level: Int //等级积分
    var leftPoint4CurLevel: Int //用户当前等级的“积分区间”的左起始点值。数学上为“大于等于” 例如：等级积分在100至299时为2级用户，则本属性的值应为100
    var rightPoint4CurLevel: Int //用户当前等级的“积分区间”的右结束点值。数学上为“小于等于” 例如：等级积分在100至299时为2级用户，则本属性的值应为299
    var remainInCurLevNeedPoint: Int //用户差多少分才可以保级。如果已达到保级要求，则为0
    var sex: Int //性别。值为1时是男性，值为2时是女性
    var provinceName: String //用户所属省份名
    
    
    
    var parameters: [String: Any] { return ["sid" : sid,
                                            "name": name,
                                            "tel": tel,
                                            "jobTitle": jobTitle,
                                            "address": address,
                                            "birthDate": birthDate,
                                            "userLevel": userLevel,
                                            "point4level": point4level,
                                            "leftPoint4CurLevel": leftPoint4CurLevel,
                                            "rightPoint4CurLevel": rightPoint4CurLevel,
                                            "remainInCurLevNeedPoint": remainInCurLevNeedPoint,
                                            "sex": sex,
                                            "provinceName" : provinceName,] }
}



