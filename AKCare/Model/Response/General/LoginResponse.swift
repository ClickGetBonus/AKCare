//
//  LoginRespond.swift
//  AKCare
//
//  Created by Aki on 2017/11/1.
//  Copyright © 2017年 Ian. All rights reserved.
//

import Foundation

class LoginResponse: BaseResponse {
    
    var sid = ""
    var userName: String = ""
    var userType: String = ""
    
    var passLogin: Bool = false
    var openId: String = ""
}

