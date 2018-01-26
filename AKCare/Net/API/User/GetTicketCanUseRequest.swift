//
//  GetTicketCanUseRequest.swift
//  AKCare
//
//  Created by Aki on 2018/1/24.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import Alamofire

/*
 1.9.2    活动中个人可用卡券列表
 */
struct GetTicketCanUseRequest: Request {
    
    typealias Response = NoticeUnreadResponse
    
    let path = "fetchMyTicketCanUseNow.do"
    let method: HTTPMethod = .post
    
    var sid: String
    var actId: String //活动id
    
    var parameters: [String: Any] { return ["sid" : sid, "actId" : actId] }
    
}


