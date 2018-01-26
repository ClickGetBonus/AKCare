//
//  PlayTigerRequest.swift
//  AKCare
//
//  Created by Aki on 2018/1/22.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import Alamofire

/*
 1.5.2    进行一次老虎机游戏
 */
struct PlayTigerRequest: Request {
    
    typealias Response = PlayTigerResponse
    
    let path = "playGame.do"
    let method: HTTPMethod = .post
    
    var sid: String
    var actId: String
    var orderId: String
    
    var parameters: [String: Any] { return ["sid" : sid, "actId" : actId, "orderId" : orderId] }
}
