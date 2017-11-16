//
//  Client.swift
//  AKCare
//
//  Created by Aki on 2017/11/2.
//  Copyright © 2017年 Ian. All rights reserved.
//

import Foundation

protocol Client {
    
    var host: String { get }
    
    func send<T: Request>(_ r: T, handler: @escaping (T.Response?) -> Void)
}
