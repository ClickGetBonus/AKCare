//
//  GetPopupRequest.swift
//  AKCare
//
//  Created by Aki on 2018/1/22.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import Alamofire

/*
 1.3.1    查询可显示弹窗
 */
struct GetPopupRequest: Request {
    
    typealias Response = GetPopupResponse
    
    let path = "showPopup.do"
    let method: HTTPMethod = .post
    
    var sid: String
    
    var parameters: [String: Any] { return ["sid" : sid] }
    
}

