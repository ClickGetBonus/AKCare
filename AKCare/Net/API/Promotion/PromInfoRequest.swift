//
//  PromInfoRequest.swift
//  AKCare
//
//  Created by Aki on 2017/12/1.
//  Copyright © 2017年 Ian. All rights reserved.
//

import Foundation
import Alamofire

/*
 1.4.2    查询活动
 */
struct PromInfoRequest: Request {
    
    typealias Response = GetPromResponse
    
    let path = "getCcAct.do"
    let method: HTTPMethod = .post
    
    var sid: String
    var actId: String
    
    var parameters: [String: Any] { return ["sid" : sid, "actId" : actId] }
}


