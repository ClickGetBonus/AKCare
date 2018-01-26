//
//  GetUserInfoRequest.swift
//  AKCare
//
//  Created by Aki on 2018/1/24.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import Alamofire

/*
 1.10.1    查看个人资料
 */
struct GetUserInfoRequest: Request {
    
    typealias Response = BaseResponse
    
    let path = "fetchUserInfo.do"
    let method: HTTPMethod = .post
    
    var sid: String
    
    var parameters: [String: Any] { return ["sid" : sid] }
}


