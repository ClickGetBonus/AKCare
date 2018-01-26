//
//  GetOrderResponse.swift
//  AKCare
//
//  Created by Aki on 2018/1/24.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation

class GetOrderResponse: BaseResponse {
    var total: Int = 0
    var orders: [Order] = []
}
