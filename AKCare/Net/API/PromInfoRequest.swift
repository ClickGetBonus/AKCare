//
//  PromInfoRequest.swift
//  AKCare
//
//  Created by Aki on 2017/12/1.
//  Copyright © 2017年 Ian. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct PromInfoRequest: Request {
    
    typealias Response = GetPromResponse
    
    let path = "getCcAct.do"
    let method: HTTPMethod = .post
    
    var sid: String
    var actId: String
    var actType: String
    
    var parameters: [String: Any] { return ["sid" : sid, "actId" : actId, "actType" : actType] }
}


