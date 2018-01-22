//
//  Popup.swift
//  AKCare
//
//  Created by Aki on 2018/1/22.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import HandyJSON

/*
 弹窗
 id 数据id
 en_app_click APP启用点击。0为否，1为是
 clk_type 点击类型。0为显示线上促销活动，1为显示线上培训资料，2为显示商品详情，3为显示签到
 clk_show_data_id 关联数据id
 pic 图片地址
 */
struct Popup: HandyJSON {
    var id: String = ""
    var en_app_click: Int = 0
    var clk_type: Int = 0
    var clk_show_data_id: String = ""
    var pic: String = ""
}
