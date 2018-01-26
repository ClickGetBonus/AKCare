//
//  SubmitFeedbackRequest.swift
//  AKCare
//
//  Created by Aki on 2018/1/24.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import Alamofire

/*
 1.11.1    提交意见反馈
 */
struct SubmitFeedbackRequest: Request {
    
    typealias Response = BaseResponse
    
    let path = "saveFeedback.do"
    let method: HTTPMethod = .post
    
    var parameters: [String: Any] { return [:] }
}
