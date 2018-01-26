//
//  InfoContentRequest.swift
//  AKCare
//
//  Created by Aki on 2018/1/22.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import Alamofire

/*
 1.4.6    获取资讯详情
 */
struct InfoContentRequest: Request {
    
    typealias Response = InfoContentResponse
    
    let path = "showCont.do"
    let method: HTTPMethod = .post
    
    var sid: String
    
    //contentId 资讯id
    var contentId: String
    
    var parameters: [String: Any] { return ["sid" : sid, "contentId" : contentId] }
}
