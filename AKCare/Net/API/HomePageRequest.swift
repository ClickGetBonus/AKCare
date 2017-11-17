//
//  HomePageRequest.swift
//  AKCare
//
//  Created by Aki on 2017/11/16.
//  Copyright © 2017年 Ian. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct HomePageRequest: Request {
    
    typealias Response = BaseResponse
    
    let path = "homePage.do"
    let method: HTTPMethod = .post
    
    var sid: String
    
    var parameters: [String: Any] { return ["sid" : sid] }
}

