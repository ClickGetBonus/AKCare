//
//  NoticeUnreadRequest.swift
//  AKCare
//
//  Created by Aki on 2018/1/24.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import Alamofire

/*
 1.8.3    查询未读消息数
 */
struct NoticeUnreadRequest: Request {
    
    typealias Response = NoticeUnreadResponse
    
    let path = "listUnRead.do"
    let method: HTTPMethod = .post
    
    var sid: String
    
    var parameters: [String: Any] { return ["sid" : sid] }
    
}



