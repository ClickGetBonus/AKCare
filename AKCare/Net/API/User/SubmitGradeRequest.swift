//
//  SubmitGradeRequest.swift
//  AKCare
//
//  Created by Aki on 2018/1/24.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import Alamofire

/*
 1.6.6    提交订单评价
 */
struct SubmitGradeRequest: Request {
    
    typealias Response = BaseResponse
    
    let path = "submitRemark.do"
    let method: HTTPMethod = .post
    
    var sid: String //会话id
    var orderId: String //订单id
    var remark: String //评价内容
    
    var parameters: [String: Any] { return ["sid" : sid,
                                            "orderId" : orderId,
                                            "remark" : remark] }
}
