//
//  ProdInfoResponse.swift
//  AKCare
//
//  Created by Aki on 2018/1/24.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation

class ProdInfoResponse: BaseResponse {
    
    var prodId: String = "" //产品id
    var name: String = "" //产品名称
    var prodDims: String = "" //产品规格
    var plasterLayer: String = "" //粉刷涂层
    var selColor: String = "" //可供选择颜色
    var promBaseProd: String = "" //推荐配套底漆
    var constructTool: String = "" //施工工具
    var paintSize: String = "" //理论涂刷面积
    var prodCode: String = "" //产品编码
    var favorite: Bool = false //是否为用户收藏的商品
    var pics: [String] = [] //商品图片。其中元素为字符串Url
    var picTexts: [IntroElement] = [] //商品图文。其中元素参见数据类型：图文。
}


