//
//  GenOrderRequest.swift
//  AKCare
//
//  Created by Aki on 2018/1/24.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import Alamofire

/*
 1.6.2    生成订单
 */
struct GenOrderRequest: Request {
    
    typealias Response = BaseResponse
    
    let path = "genOrder.do"
    let method: HTTPMethod = .post
    
    var sid: String //会话id
    var name: String //收件人
    var tel: String //联系电话
    var ticketId: String //默认卡券id
    var actId: String //活动id
    var toBuys: String //要买的套餐
    var do4Confirm: Int //下单前进行确认。0为否，1为是
    
    var parameters: [String: Any] { return ["sid" : sid,
                                            "name" : name,
                                            "tel" : tel,
                                            "ticketId" : ticketId,
                                            "actId" : actId,
                                            "toBuys" : toBuys,
                                            "do4Confirm" : do4Confirm] }
    
}
