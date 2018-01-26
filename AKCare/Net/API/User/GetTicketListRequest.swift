//
//  GetTicketListRequest.swift
//  AKCare
//
//  Created by Aki on 2018/1/24.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import Alamofire

/*
 1.9.1    个人所有卡券列表
 */
struct GetTicketListRequest: Request {
    
    typealias Response = NoticeUnreadResponse
    
    let path = "fetchMyTicket.do"
    let method: HTTPMethod = .post
    
    var sid: String
    var startDataId: String //分页起始数据id。查询该数据id后面的下一分页显示数据，不是一个有效的uuid时表示从第1页开始查
    
    var parameters: [String: Any] { return ["sid" : sid, "startDataId" : startDataId] }
    
}

