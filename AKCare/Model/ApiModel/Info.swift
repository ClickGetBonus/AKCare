//
//  Info.swift
//  AKCare
//
//  Created by Lan on 2018/1/20.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation
import HandyJSON

/*
 资讯
 */
struct Info: HandyJSON {
    var id: String = ""
    var unReadContent: Int = 0  //未读消息数
    var name: String = ""  //名称
    var pic: String = ""   //图片url
    var trainFlag: Bool = false //是否培训资料
}


