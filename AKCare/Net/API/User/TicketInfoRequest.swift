//
//  TicketInfoRequest.swift
//  AKCare
//
//  Created by Aki on 2018/1/24.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import Alamofire

/*
 1.9.3    查询卡券详情
 */
struct TicketInfoRequest: Request {
    
    typealias Response = TicketInfoResponse
    
    let path = "getTicketDetail.do"
    let method: HTTPMethod = .post
    
    var sid: String
    var ticketId: String //卡券id
    
    var parameters: [String: Any] { return ["sid" : sid, "ticketId" : ticketId] }
}



