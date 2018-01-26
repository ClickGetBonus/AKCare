//
//  UseProdOfflineTicketRequest.swift
//  AKCare
//
//  Created by Aki on 2018/1/24.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import Alamofire

/*
 1.9.4    使用线下商品兑换卡券
 */
struct UseProdOfflineTicketRequest: Request {
    
    typealias Response = BaseResponse
    
    let path = "useProdExtTicket.do"
    let method: HTTPMethod = .post
    
    var sid: String
    var ticketId: String //卡券id
    var qrCode: String //店长的二维码
    
    var parameters: [String: Any] { return ["sid" : sid, "ticketId" : ticketId, "qrCode" : qrCode] }
}



