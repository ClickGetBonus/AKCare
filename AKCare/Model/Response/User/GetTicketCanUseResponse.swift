//
//  GetTicketCanUseResponse.swift
//  AKCare
//
//  Created by Aki on 2018/1/24.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation

class GetTicketCanUseResponse: BaseResponse {
    var tickets: [Ticket] = [] //用户卡券
    var oldTickets: [Ticket] = [] //已用或过期的卡券
}

