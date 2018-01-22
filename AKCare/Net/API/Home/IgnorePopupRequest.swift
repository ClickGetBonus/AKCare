//
//  IgnorePopupRequest.swift
//  AKCare
//
//  Created by Aki on 2018/1/22.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import Alamofire

struct IgnorePopupRequest: Request {
    
    typealias Response = BaseResponse
    
    let path = "stopPopup.do"
    let method: HTTPMethod = .post
    
    var sid: String
    var popupId: String
    
    var parameters: [String: Any] { return ["sid" : sid, "popupId" : popupId] }
    
}
