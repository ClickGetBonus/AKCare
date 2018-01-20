//
//  ProdType.swift
//  AKCare
//
//  Created by Aki on 2017/12/26.
//  Copyright © 2017年 Ian. All rights reserved.
//

import Foundation
import HandyJSON

/*
 商品分类
 */
struct ProdType: HandyJSON {
    var children: [ProdType] = []
    var id: String = ""
    var name: String = ""
}
