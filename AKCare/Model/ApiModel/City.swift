//
//  City.swift
//  AKCare
//
//  Created by Aki on 2018/1/22.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import HandyJSON

/*
 城市
 */
struct City: HandyJSON {
    var provinceId: String = "" //省份id
    var cityId: String = "" //城市id
    var name: String = "" //城市名称
    var capFirstLetter: String = "" //大写的首字母
}

