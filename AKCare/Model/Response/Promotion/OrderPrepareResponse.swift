//
//  OrderPrepareResponse.swift
//  AKCare
//
//  Created by Aki on 2018/1/23.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation


class OrderPrepareResponse: BaseResponse {
    var name: String = "" //收件人
    var tel: String = "" //联系电话
    var address: String = "" //门店详细地址。
    var shopId: String = "" //收货门店id
    var shopName: String = "" //收货门店
    var ticketId: String = "" //默认卡券id
    var ticketName: String = "" //默认卡券名
    var haveCanUseCard: Int = 0 //可用卡券数量
    var do4Confirm: Int = 0 //下单前进行确认。0为否，1为是
}
