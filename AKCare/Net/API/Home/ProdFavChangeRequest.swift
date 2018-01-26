//
//  ProdFavChangeRequest.swift
//  AKCare
//
//  Created by Aki on 2018/1/24.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import Alamofire

/*
 1.7.4    改变商品收藏状态
 */
struct ProdFavChangeRequest: Request {
    
    typealias Response = BaseResponse
    
    let path = "changeProdFav.do"
    let method: HTTPMethod = .post
    
    var sid: String
    var prodId: String //商品id
    var fav: ProdFavState //操作标识。0为删除，1为添加
    
    var parameters: [String: Any] { return ["sid" : sid, "prodId" : prodId, "fav" : fav.rawValue] }
}

