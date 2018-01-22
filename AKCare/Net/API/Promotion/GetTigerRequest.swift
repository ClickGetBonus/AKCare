//
//  GetTigerRequest.swift
//  AKCare
//
//  Created by Aki on 2018/1/22.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import Alamofire

struct GetTigerRequest: Request {
    
    typealias Response = BaseResponse
    
    let path = "showTgGame.do"
    let method: HTTPMethod = .get
    
    var sid: String
    var actId: String
    
    var parameters: [String: Any] { return ["sid" : sid, "actId" : actId] }
}
