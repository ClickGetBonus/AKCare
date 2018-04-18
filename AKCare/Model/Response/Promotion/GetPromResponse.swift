//
//  GetPromResponse.swift
//  AKCare
//
//  Created by Aki on 2017/12/21.
//  Copyright © 2017年 Ian. All rights reserved.
//

import Foundation

class GetPromResponse: BaseResponse {
    
    var actId: String = "" //活动主键
    var name: String = "" //活动名称
    var needQuantity: Bool = false //是否需要用户输入数量
    var remark: String = "" //活动备注
    var picTexts: [IntroElement] = [] //图文介绍。其中元素参见数据类型：图文。
    var haveActSet: Bool = false //是否有套餐
    var haveGiveGift: Bool = false //是否有按概率赠送的礼物
    var actStarted: Bool = false //活动是否开始
    var maxInputUnit: String = "" //数量的单位
    var ticketName: String = "" //赠送卡券的名称
    
}
