//
//  OrderProduct.swift
//  AKCare
//
//  Created by Aki on 2018/4/12.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import HandyJSON

/*
 订单商品
 */
struct OrderProduct: HandyJSON {
    var actSetType: Int = 0 //套餐类型 0主套餐 1子套餐 2其他
    var consumeType: String = "" // ???
    var dataType: Int = 0 //数据类型
    var name: String = "" //名称
    var orderProdId: Int = 0 //商品id
    var pic: String = "" //图片
    var price: String = "" //价格
    var prodId: String = "" //商品id
    var quantity: Int = 0 //数量
}

