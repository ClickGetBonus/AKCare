//
//  InfoType.swift
//  AKCare
//
//  Created by Aki on 2017/11/28.
//  Copyright © 2017年 Ian. All rights reserved.
//

import Foundation
import HandyJSON

/*
 资讯分类
 */
struct InfoType: HandyJSON {
    var id: String = ""
    var unReadContent: Int = 0  //未读消息数
    var name: String = ""  //名称
    var pic: String = ""   //图片url
    var trainFlag: Bool = false //是否培训资料
}



