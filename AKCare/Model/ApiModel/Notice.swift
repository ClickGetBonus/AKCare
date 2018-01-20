//
//  Notice.swift
//  AKCare
//
//  Created by Lan on 2018/1/20.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import HandyJSON

/*
 通知
 */
struct Notice: HandyJSON {
    var wsNoticeId: String = "" //通知id
    var createTime: String = "" //创建时间
    var content: String = "" //内容
    var enAppClick: Int = 0 //是否可点击。0为否，1为是
    var clkType: Int = 0 //点击类型。0为显示线上促销活动，1为显示线上培训资料，2为显示商品详情，3为显示签到(就是其它)
    var clkShowDataId: String = "" //点击显示数据id
    var readFlag: Int = 0 //是否读过的标志，1为已读
}
