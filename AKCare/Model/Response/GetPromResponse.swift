//
//  GetPromResponse.swift
//  AKCare
//
//  Created by Aki on 2017/12/21.
//  Copyright © 2017年 Ian. All rights reserved.
//

import Foundation

class GetPromResponse: Response {
    var actId: String = ""
    var actStarted: Bool = false
    var haveActSet: Bool = false
    var haveGiveGift: Bool = false
    var maxInputUnit: String = ""
    var name: String = ""
    var needQuantity: Bool = false
    var picTexts: [PromElement] = []
}
