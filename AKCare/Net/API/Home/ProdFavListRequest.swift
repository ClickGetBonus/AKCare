//
//  ProdFavListRequest.swift
//  AKCare
//
//  Created by Aki on 2018/1/24.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import Alamofire

/*
 1.7.4    个人收藏商品列表
 */
struct ProdFavListRequest: Request {
    
    typealias Response = ProdListResponse
    
    let path = "listFavProd.do"
    let method: HTTPMethod = .post
    
    var sid: String
    var startDataId: String //商品id
    
    var parameters: [String: Any] { return ["sid" : sid, "startDataId" : startDataId] }
    
}

