//
//  HomePageResponse.swift
//  AKCare
//
//  Created by Aki on 2017/11/20.
//  Copyright © 2017年 Ian. All rights reserved.
//

import Foundation

class HomePageResponse: BaseResponse {
    
    var haveTigerGame: Bool = false
    var dynLeft: HotBanner?
    var dynRightBtm: HotBanner?
    var dynRightTop: HotBanner?
    var proms: [PromBanner] = []
}
