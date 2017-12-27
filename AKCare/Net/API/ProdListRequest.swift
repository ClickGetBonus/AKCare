//
//  ProdListRequest.swift
//  AKCare
//
//  Created by Aki on 2017/12/27.
//  Copyright © 2017年 Ian. All rights reserved.
//

import Foundation
import Alamofire

struct ProdListRequest: Request {
    typealias Response = BaseResponse
    
    let path = "getCcAct.do"
    let method: HTTPMethod = .post
    
    var sid: String
    var prodTypeId: String
    
    var parameters: [String: Any] { return ["sid" : sid, "prodTypeId" : prodTypeId] }
    
    
}
