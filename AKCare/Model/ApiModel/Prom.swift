//
//  Prom.swift
//  AKCare
//
//  Created by Aki on 2017/12/21.
//  Copyright © 2017年 Ian. All rights reserved.
//

import Foundation
import HandyJSON

struct Prom: HandyJSON {
    var wsActId: Bool = false //活动id
    var name: String = "" //活动名称
    var startTime: String = "" //活动开始时间
    var endTime: String = "" //活动结束时间
    var actImg: String = "" //活动在首页显示的图片
    var platPoint: Int = 0 //参加活动可获得的成长值
    var createTime: String = "" //创建时间
    var inputUnit: String = "" //活动物品单位
    var useGameticketImmdiate: Int = 0 //游戏券立即用。0为否，1为是
    var showStartTime: String = "" //活动预热开始时间
    var showEndTime: String = "" //活动预热结束时间
    var enDsc: Int = 0 //启用折扣。0为否，1为是
    var dscRule: Int = 0 //折扣规则。0为打折，1为立减
    var dscValue: Int = 0 //折扣力度
    var dscScene: Int = 0 //折扣条件方式。0为购买数量，1为购买金额，2为参与循序
    var dscComp: Int = 0 //折扣条件比较方式。0为小于，1为小于等于，2为等于，3为大于，4为大于等于
    var dscCondition: Int = 0 //折扣条件数值
    var enGiveCard: Int = 0 //启用赠送卡券。0为否，1为是
    var wsCardId: String = "" //赠送卡券ID
    var giveCardRatio: Int = 0 //赠送卡券概率
    var giveCardLmt: Int = 0 //赠送卡券限额
    var giveGiftPrice: Int = 0 //赠送礼物价格
    var maxUserJoinTimes: Int = 0 //允许用户参加活动次数
    var enDefanltCard: Int = 0 //启用默认卡券。0为否，1为是
    var wsCardType: String = "" //默认卡券分类ID
    var enAllowCard: Int = 0 //启用可用卡券
    var enOrderSt: Int = 0 //订单是否显示金额。0为否，1为是
    var enMainSetSt: Int = 0 //主套餐是否显示金额。0为否，1为是
    var enSubSetSt: Int = 0 //子套餐是否显示金额。0为否，1为是
    var enMainSetMul: Int = 0 //下单时主套餐可多选。0为否，1为是
    var enSubSetMul: Int = 0 //下单时子套餐可多选。0为否，1为是
    var enMulMainSetLim: Int = 0 //启用多个主套餐的总购买数量限制。0为否，1为是
    var inputLtVal: Int = 0 //多个主套餐的限购数量
    var mulMainSetLimType: Int = 0 //多个主套餐的限制顺序。0以单个主套餐的为主，1以总和为主
    var en_no_actset_limit: Int = 0 //启用无套餐活动限额。0为否，1为是
    var no_actset_limit: Int = 0 //无套餐活动限额
}


