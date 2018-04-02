//
//  GetOrderRequest.swift
//  AKCare
//
//  Created by Aki on 2018/1/24.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import Alamofire

/*
 1.6.3    查询个人订单
 */
struct GetOrderRequest: Request {
    
    typealias Response = GetOrderResponse
    
    let path = "fetchOrderList.do"
    let method: HTTPMethod = .post
    
    var sid: String //会话id
    var type: OrderState //查询方式。0为全部，1为待发货，2为配送中，3为已完成
    var startDataId: String //分页起始数据id。查询该数据id后面的下一分页显示数据，不是一个有效的uuid时表示从第1页开始查
    
    var parameters: [String: Any] { return ["sid" : sid,
                                            "type" : String(type.rawValue),
                                            "startDataId" : startDataId] }
    
}
