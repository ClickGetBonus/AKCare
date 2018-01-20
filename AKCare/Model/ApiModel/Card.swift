//
//  Card.swift
//  AKCare
//
//  Created by Lan on 2018/1/20.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import HandyJSON

/*
 卡券
 */
struct Card: HandyJSON {
    var ticketId: String = "" //券id
    var ticketCode: String = "" //卡券号
    var expiredDate: String = "" //失效日期
    var startUseDate: String = "" //生效日期
    var useScene: Int = 0 //使用场景。0为线上活动，1为线下门店活动，2为线下商品卡券
    var name: String = "" //卡券名称
    var describe: String = "" //券描述
    var usedTime: String = "" //使用时间
    var eftDays: Int = 0 //剩余多少天后过期
}
