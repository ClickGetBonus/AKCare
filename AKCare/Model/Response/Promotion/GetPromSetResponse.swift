//
//  GetPromSetResponse.swift
//  AKCare
//
//  Created by Aki on 2018/1/22.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation

class GetPromSetResponse: BaseResponse {
    var act: Prom?
    var actSets: [PromSet] = []
}
