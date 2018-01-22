//
//  ProdInfoRequest.swift
//  AKCare
//
//  Created by Aki on 2018/1/2.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import Alamofire

struct ProdInfoRequest: Request {
    
    typealias Response = BaseResponse
    
    let path = "showProd.do"
    let method: HTTPMethod = .post
    
    var sid: String
    var prodId: String
    
    var parameters: [String: Any] { return ["sid" : sid, "prodId" : prodId] }
    
}
