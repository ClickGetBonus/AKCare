//
//  HomePageRequest.swift
//  AKCare
//
//  Created by Aki on 2017/11/16.
//  Copyright © 2017年 Ian. All rights reserved.
//

import Foundation
import Alamofire

/*
 获取首页信息
 */
struct HomePageRequest: Request {
    
    typealias Response = HomePageResponse
    
    let path = "homePage.do"
    let method: HTTPMethod = .post
    
    var sid: String
    
    var parameters: [String: Any] { return ["sid" : sid] }
}

