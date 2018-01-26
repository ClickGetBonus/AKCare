//
//  GetInfoRequest.swift
//  AKCare
//
//  Created by Aki on 2018/1/22.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import Alamofire

/*
 1.4.4    查询资讯
 */
struct GetInfoRequest: Request {
    
    typealias Response = GetInfoResponse
    
    let path = "listContent.do"
    let method: HTTPMethod = .post
    
    var sid: String
    
    //parentId 资讯分类id
    var contentTypeId: String
    //分页起始数据id。查询该数据id后面的下一分页显示数据，不是一个有效的uuid时表示从第1页开始查
    var startDataId: String
    //二级资讯分类id
    var lv2_cont_type_id: String
    
    var parameters: [String: Any] { return ["sid" : sid, "contentTypeId" : contentTypeId, "lv2_cont_type_id" : lv2_cont_type_id] }
}

