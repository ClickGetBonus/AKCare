//
//  PromSet.swift
//  AKCare
//
//  Created by Lan on 2018/1/20.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import HandyJSON
/*
 活动套餐
 */
struct PromSet: HandyJSON {
    var wsActSetId: String = "" //套餐id
    var wsActId: String = "" //活动id
    var parentId: String = "" //父套餐id
    var createTime: String = "" //创建时间
    var name: String = "" //名称
    var price: Int = 0 //价格
    var pic: String = "" //图片地址
    var repNum: Int = 0 //库存
    var enMasterContr: Int = 0 //启用主套餐购买数量限制。0为否，1为是
    var masterLim: Int = 0 //主套餐的限购数量
    var enMulSubContr: Int = 0 //启用多个子套餐总购买数量限制。0为否，1为是
    var mulSubLim: Int = 0 //多个子套餐的总限购数量
    var enOneSubContr: Int = 0 //启用子套餐购买数量限制。0为否，1为是
    var oneSubLim: Int = 0 //子套餐的限购数量
    var contByMoneySub1: Int = 0 //金额控制次数方法细项1
    var contByMoneySub2: Int = 0 //金额控制次数方法细项2
    var contByMoneySub3: Int = 0 //金额控制次数方法细项3
    var contByMoneySub4: Int = 0 //金额控制次数方法细项4
    var contBySetSub1: Int = 0 //套数控制次数方法细项1
    var contBySetSub2: Int = 0 //套数控制次数方法细项2
    var contBySetSub3: Int = 0 //套数控制次数方法细项3
    var contBySetSub4: Int = 0 //套数控制次数方法细项4
    var subActSets: [PromSet] = [] //子套餐。其中元素参见数据类型：活动套餐。
    var oBuyNum: Int = 0 //要买的数量
    var checked: Bool = false //套餐是否选中
    var contentId: String = "" //图文详情id
}


