//
//  OtherPrize.swift
//  AKCare
//
//  Created by Lan on 2018/1/20.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import HandyJSON

/*
 他人中奖信息
 */
struct OtherPrize: HandyJSON {
    var dataId: String = "" //用户中奖信息id
    var userAccount: String = "" //用户登录账号
    var userRealName: String = "" //用户真实姓名
    var fruitType: Int = 0 //所属水果类型
    var platPoint: Int = 0 //获得的平台积分
    var ticket: String = "" //获得的卡券
}



