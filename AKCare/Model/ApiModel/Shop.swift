//
//  Shop.swift
//  AKCare
//
//  Created by Lan on 2018/1/20.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import HandyJSON

/*
 门店
 shopId 门店id
 name 门店名称
 address 门店地址
 areaFullName 字符串区域全名。如：广东省广州市天河区
 */
struct Shop: HandyJSON {
    var shopId: String = ""
    var name: String = ""
    var address: String = ""
    var areaFullName: String = ""
}

