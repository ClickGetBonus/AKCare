//
//  RegCityRequest.swift
//  AKCare
//
//  Created by Aki on 2018/1/22.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

/*
 1.1.4    可进行注册的城市列表
 */
struct RegCityRequest: Request {
    
    typealias Response = RegCityResponse
    
    let path = "listRegProvince.do"
    let method: HTTPMethod = .get
    
    var provinceId: String
    var regType: RegType
    
    var parameters: [String: Any] { return [ "provinceId" : provinceId, "regType" : regType.rawValue] }
}



