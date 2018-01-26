//
//  OrderPrepareRequest.swift
//  AKCare
//
//  Created by Aki on 2018/1/23.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import Alamofire

/*
 1.6.1    获取下单前的基本信息 (填写收货地址页面)
 */
struct OrderPrepareRequest: Request {
    
    typealias Response = OrderPrepareResponse
    
    let path = "showToBuy.do"
    let method: HTTPMethod = .get
    
    var sid: String
    var actId: String
    var toBuys: String
    
    var parameters: [String: Any] { return ["sid" : sid, "actId" : actId] }
}


