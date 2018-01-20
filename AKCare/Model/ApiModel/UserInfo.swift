//
//  UserInfo.swift
//  AKCare
//
//  Created by Lan on 2018/1/20.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import HandyJSON

/*
 用户详情
 */
struct UserInfo: HandyJSON {
    var name: Int = 0 //用户的真实姓名
    var tel: Int = 0 //手机号
    var jobTitle: Int = 0 //职位
    var address: Int = 0 //地址
    var birthDate: Int = 0 //出生日期
    var userLevel: Int = 0 //用户等级
    var point4level: Int = 0 //等级积分
    var leftPoint4CurLevel: Int = 0 //用户当前等级的“积分区间”的左起始点值。数学上为“大于等于” 例如：等级积分在100至299时为2级用户，则本属性的值应为100
    var rightPoint4CurLevel: Int = 0 //用户当前等级的“积分区间”的右结束点值。数学上为“小于等于” 例如：等级积分在100至299时为2级用户，则本属性的值应为299
    var remainInCurLevNeedPoint: Int = 0 //用户差多少分才可以保级。如果已达到保级要求，则为0
    var sex: Int = 0 //性别。值为1时是男性，值为2时是女性
    var provinceName: Int = 0 //用户所属省份名
}
