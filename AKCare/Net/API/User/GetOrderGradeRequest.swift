//
//  GetOrderGradeRequest.swift
//  AKCare
//
//  Created by Aki on 2018/1/24.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import Alamofire

/*
 1.6.5    查询订单评价
 */
struct GetOrderGradeRequest: Request {
    
    typealias Response = GetOrderGradeResponse
    
    let path = "showRemark.do"
    let method: HTTPMethod = .post
    
    var sid: String //会话id
    var orderId: String //订单id
    
    var parameters: [String: Any] { return ["sid" : sid,
                                            "orderId" : orderId] }
}


