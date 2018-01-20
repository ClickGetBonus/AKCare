//
//  PromElement.swift
//  AKCare
//
//  Created by Aki on 2017/12/21.
//  Copyright © 2017年 Ian. All rights reserved.
//

import Foundation
import HandyJSON

/*
 活动图文介绍
 
 content 内容。为文字或图片地址
 imgType 是否图片类型
 */
struct PromElement: HandyJSON {
    var content: String = ""
    var imgType: Bool = false
}
