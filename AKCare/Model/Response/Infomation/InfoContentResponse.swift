//
//  InfoContentResponse.swift
//  AKCare
//
//  Created by Aki on 2018/1/22.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation

class InfoContentResponse: BaseResponse {
    var id: String = ""
    var title: String = ""
    var createTime: String = ""
    var picTexts: [IntroElement] = []
}
