//
//  ProdTypeRequest.swift
//  AKCare
//
//  Created by Aki on 2017/12/26.
//  Copyright © 2017年 Ian. All rights reserved.
//

import Foundation
import Alamofire

/*
 1.7.1 查询商品分类
 */
struct ProdTypeRequest: Request {
    
    typealias Response = ProdTypeResponse
    
    let path = "listProdType.do"
    let method: HTTPMethod = .post
    
    var sid: String
    
    var parameters: [String: Any] { return ["sid" : sid] }
}


