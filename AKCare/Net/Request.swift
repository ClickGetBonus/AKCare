//
//  Request.swift
//  AKCare
//
//  Created by Aki on 2017/10/31.
//  Copyright © 2017年 Ian. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol Request {
    var path: String { get }
    
    var method: HTTPMethod { get }
    var parameters: [String: Any] { get }
    associatedtype Response: Decodable
}



