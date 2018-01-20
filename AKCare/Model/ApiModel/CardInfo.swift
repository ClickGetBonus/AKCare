//
//  CardInfo.swift
//  AKCare
//
//  Created by Lan on 2018/1/20.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import HandyJSON

/*
 卡券详情
 */
struct CardInfo: HandyJSON {
    var wsUserGiftTickId: String = "" //卡券id
    var wsActId: String = "" //活动id
    var wsCardId: String = "" //后台配置卡券id
    var createTime: String = "" //创建时间
    var giftStartUseTime: String = "" //可以开始使用时间
    var endTime: String = "" //过期时间
    var usedTime: String = "" //卡券被使用时间
    var cardCode: String = "" //卡券编码
    var name: String = "" //卡券名称
    var descri: String = "" //卡券描述
    var wsShopId: String = "" //销卡门店id
    var shopName: String = "" //销卡门店名称
    var useScene: Int = 0 //使用场景。0为线上活动，1为线下门店活动，2为线下商品卡券
    var consumeType: Int = 0 //消费类型。0为消费类，1为礼品类
    var dscRule: Int = 0 //折扣规则。0为打折，1为立减
    var dscValue: Int = 0 //折扣力度
    var dscCondition: Int = 0 //折扣使用条件。
    var giftPrice: Int = 0 //礼品价格
    var canUseNow: Bool = false //是否可用
}
