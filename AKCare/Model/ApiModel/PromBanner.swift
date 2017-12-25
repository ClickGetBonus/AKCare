//
//  PromBanner.swift
//  AKCare
//
//  Created by Aki on 2017/11/20.
//  Copyright © 2017年 Ian. All rights reserved.
//

import Foundation
import HandyJSON

struct PromBanner: HandyJSON {
    var id: String = ""
    var left: Int = 0  //剩余配额
    var leftUnit: String = "" //单位
    var name: String = ""  //名称
    var pic: String = ""   //图片url
    var showLeft: Bool = false // 是否展示剩余配额
}

