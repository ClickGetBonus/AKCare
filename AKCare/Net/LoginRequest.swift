//
//  LoginRequest.swift
//  AKCare
//
//  Created by Aki on 2017/11/1.
//  Copyright © 2017年 Ian. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct LoginRequest: Request {
    
    typealias Response = LoginResponse
    
    let path = "login.do"
    let method: HTTPMethod = .get
    
    var userName: String
    var passwd: String
    
    var parameters: [String: Any] { return ["userName" : userName, "passwd" : passwd] }
}

