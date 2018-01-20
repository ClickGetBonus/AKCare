//
//  InfoTypeListRequest.swift
//  AKCare
//
//  Created by Lan on 2018/1/20.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import Alamofire

struct InfoTypeListRequest: Request {
    
    typealias Response = BaseResponse
    
    let path = "listContentType.do"
    let method: HTTPMethod = .post
    
    var sid: String
    
    /*
     parentId 父资讯分类id
     */
    var parentId: String
    
    var parameters: [String: Any] { return ["sid" : sid, "parentId" : parentId] }
}
