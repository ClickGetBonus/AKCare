//
//  Response.swift
//  AKCare
//
//  Created by Aki on 2017/11/2.
//  Copyright © 2017年 Ian. All rights reserved.
//

import Foundation
import HandyJSON
import SwiftyJSON

class BaseResponse: Decodable, HandyJSON {
    var success: Bool = false
    var resStr: String = ""
    
    required init() {}
    
    static func parse(_ json: String) -> Self? {
        return deserialize(from: json)
    }
}
