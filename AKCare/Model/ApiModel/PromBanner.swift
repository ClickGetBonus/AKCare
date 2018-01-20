//
//  PromBanner.swift
//  AKCare
//
//  Created by Aki on 2017/11/20.
//  Copyright © 2017年 Ian. All rights reserved.
//

import Foundation
import HandyJSON

/*
 首页活动banner
 id  数据id
 name  名称
 pic  图片地址
 showLeft  bar是否显示活动物品的“剩余数量”
 left  活动物品的剩余数量
 leftUnit  活动物品的剩余物品的单位。如：件、套
 joined  是否参加过
 */
struct PromBanner: HandyJSON {
    var id: String = ""
    var left: Int = 0
    var leftUnit: String = ""
    var name: String = ""
    var pic: String = ""
    var showLeft: Bool = false
    var joined: Bool = false
}

