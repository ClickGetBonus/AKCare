//
//  RegProvinceRequest.swift
//  AKCare
//
//  Created by Aki on 2018/1/22.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

/*
 列表可进行注册的省份
 */
struct RegProvinceRequest: Request {
    
    typealias Response = RegProvinceResponse
    
    let path = "listRegProvince.do"
    let method: HTTPMethod = .get
    
    var parameters: [String: Any] { return [:] }
}


