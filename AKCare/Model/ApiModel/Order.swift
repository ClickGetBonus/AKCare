//
//  Order.swift
//  AKCare
//
//  Created by Lan on 2018/1/20.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import HandyJSON

/*
 订单
 */
struct Order: HandyJSON {
    var orderId: String = "" //订单id
    var orderNo: String = "" //订单号
    var createTime: String = "" //订单创建时间
    var totalQuantity: Int = 0 //总共商品数量
    var totalPrice: Int = 0 //总价
    var receiverName: String = "" //收件人
    var tel: String = "" //联系电话
    var address: String = "" //详细收货地址
    var remarkTime: String = "" //创建评价时间
    var prods: [Product] = [] //订单中的商品。其中元素参见数据类型：订单商品。
}
