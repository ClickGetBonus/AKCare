//
//  Product.swift
//  AKCare
//
//  Created by Aki on 2017/12/27.
//  Copyright © 2017年 Ian. All rights reserved.
//

import Foundation
import HandyJSON

/*
 商品
 prodId 产品id
 name 产品名称
 prodDims 产品规格
 plasterLayer 粉刷涂层
 pic 商品图地址
 prodCode 产品编码
 */
struct Product: HandyJSON {
    var plasterLayer: String = ""
    var pic: String = ""
    var name: String = ""
    var prodCode = ""
    var prodDims = ""
    var prodId: String = ""
}

