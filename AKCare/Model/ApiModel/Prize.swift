//
//  Prize.swift
//  AKCare
//
//  Created by Lan on 2018/1/20.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import HandyJSON

/*
 老虎机奖品
 */
struct Prize: HandyJSON {
    var fruitType: Int = 0 //所属水果类型
    var platPoint: Int = 0 //可获得的平台积分
    var ticket: String = "" //可获得的卡券名称
    var cardId: String = "" //卡券ID
    var en_card: Int = 0 //可以获得卡券。0为否，1为是
}
