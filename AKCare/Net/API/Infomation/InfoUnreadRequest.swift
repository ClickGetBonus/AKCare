//
//  InfoUnreadRequest.swift
//  AKCare
//
//  Created by Aki on 2018/1/22.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import Alamofire

struct InfoUnreadRequest: Request {
    
    typealias Response = InfoUnreadResponse
    
    let path = "fetchUnReadInfo.do"
    let method: HTTPMethod = .post
    
    var sid: String
    
    var parameters: [String: Any] { return ["sid" : sid] }
}

