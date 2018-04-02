//
//  URLSessionClient.swift
//  AKCare
//
//  Created by Aki on 2017/11/2.
//  Copyright © 2017年 Ian. All rights reserved.
//

import Foundation
import Alamofire
import PKHUD

struct URLSessionClient: Client {
    
//    var host: String = "http://cx2.dlsapp.cn/dlsInterfaceV3/"
    var host: String = "http://wx1.dlsapp.cn/dlsInterface/"
    
    static let share = URLSessionClient()
    
    func send<T: Request>(_ r: T, handler: @escaping (T.Response?) -> Void)  {
        
        let url = URL(string: host + r.path)!
        var request = URLRequest(url: url)
        request.httpMethod = r.method.rawValue
        
        var parameters = r.parameters
        
        let vid: Int = 30100 //当前app的版本标识
        let osn: String = "ios" //手机平台标识。ios为苹果，ndr为安卓
        parameters["osn"] = osn
        parameters["vid"] = vid
        
        SwiftLoader.show(animated: true)
        
        print("request url : \(url) ")
        print("request parameters: \(parameters)")
        Alamofire.request(url, method: r.method, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseString { (response) in
            
            SwiftLoader.hide()
            if let json = response.result.value {
                
                let baseResponse = BaseResponse.parse(json)
                if let success = baseResponse?.success, success == true {
                    handler(T.Response.parse(json))
                } else {
                    HUD.flash(.label(baseResponse?.resStr), delay: HUDPresentTimeInterval)
                    handler(nil)
                }
                
                print("response json = \(json)")
            } else {
                HUD.flash(.label(response.description), delay: HUDPresentTimeInterval)
                handler(nil)
            }
        }
    }
    
}
