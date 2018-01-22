//
//  GetRecentWinRequest.swift
//  AKCare
//
//  Created by Aki on 2018/1/22.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import Alamofire

/*
 获取最近老虎机中奖信息
 */
struct GetRecentWinRequest: Request {
    
    typealias Response = GetRecentWinResponse
    
    let path = "fetchRecentWinInfo.do"
    let method: HTTPMethod = .get
    
    var sid: String
    var actId: String
    
    var parameters: [String: Any] { return ["sid" : sid, "actId" : actId] }
}

