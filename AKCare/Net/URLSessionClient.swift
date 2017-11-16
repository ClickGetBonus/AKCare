//
//  URLSessionClient.swift
//  AKCare
//
//  Created by Aki on 2017/11/2.
//  Copyright © 2017年 Ian. All rights reserved.
//

import Foundation
import Alamofire

struct URLSessionClient: Client {
    
    var host: String = "http://120.76.216.103/dlsInterface/"
    
    static let share = URLSessionClient()
    
    func send<T: Request>(_ r: T, handler: @escaping (T.Response?) -> Void)  {
        
        let url = URL(string: host + r.path)!
        var request = URLRequest(url: url)
        request.httpMethod = r.method.rawValue
        
        var parameters = r.parameters
        parameters["osn"] = "ios"
        parameters["vid"] = 30100
        
        
        print("request url : \(url) ")
        print("request parameters: \(parameters)")
        Alamofire.request(url, method: r.method, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseString { (response) in
            
            if let json = response.result.value {
                handler(T.Response.parse(json))
                print("response json = \(json)")
            } else {
                handler(nil)
            }
        }
    }
    
    
    
}
