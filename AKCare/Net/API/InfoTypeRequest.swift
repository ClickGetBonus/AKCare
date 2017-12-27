//
//  InfoTypeRequest.swift
//  AKCare
//
//  Created by Aki on 2017/11/21.
//  Copyright © 2017年 Ian. All rights reserved.
//

import Foundation
import Alamofire

struct InfoTypeRequest: Request {
    
    typealias Response = InfoTypeResponse
    
    let path = "listContentType.do"
    let method: HTTPMethod = .post
    
    var sid: String
    
    var parameters: [String: Any] { return ["sid" : sid] }
}


