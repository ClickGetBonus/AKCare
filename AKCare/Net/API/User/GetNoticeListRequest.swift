//
//  GetNoticeListRequest.swift
//  AKCare
//
//  Created by Aki on 2018/1/24.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import Alamofire

/*
 1.8.1    查询消息
 */
struct GetNoticeListRequest: Request {
    
    typealias Response = BaseResponse
    
    let path = "listNotice.do"
    let method: HTTPMethod = .post
    
    var sid: String //会话id
    var dataType: Int //查询方式。0为显示线上促销活动，1为显示线上培训资料，2为显示商品详情，3为显示签到(就是其它)
    var startDataId: String //分页起始数据id。查询该数据id后面的下一分页显示数据，不是一个有效的uuid时表示从第1页开始查
    
    var parameters: [String: Any] { return ["sid" : sid,
                                            "dataType" : dataType,
                                            "startDataId" : startDataId] }
}

