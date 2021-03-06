//
//  GetPromSetRequest.swift
//  AKCare
//
//  Created by Aki on 2018/1/22.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import Alamofire

/*
 1.4.3    查询活动套餐
 */
struct GetPromSetRequest: Request {
    
    typealias Response = GetPromSetResponse
    
    let path = "showAllActSet.do"
    let method: HTTPMethod = .post
    
    var sid: String
    var actId: String
    
    var parameters: [String: Any] { return ["sid" : sid, "actId" : actId] }
}


