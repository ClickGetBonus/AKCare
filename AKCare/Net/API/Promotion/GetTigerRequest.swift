//
//  GetTigerRequest.swift
//  AKCare
//
//  Created by Aki on 2018/1/22.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import Alamofire

/*
 1.5.1    查询活动老虎机配置
 */
struct GetTigerRequest: Request {
    
    typealias Response = GetTigerResponse
    
    let path = "showTgGame.do"
    let method: HTTPMethod = .get
    
    var sid: String
    var actId: String
    
    var parameters: [String: Any] { return ["sid" : sid, "actId" : actId] }
}
