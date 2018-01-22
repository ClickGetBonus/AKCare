//
//  GetTigerResponse.swift
//  AKCare
//
//  Created by Aki on 2018/1/22.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation

class GetTigerResponse: BaseResponse {
    var haveGameSetting: Bool = false //有游戏配置
    var maxPlayTime: Int = 0 //最多可玩次数
    var playedTime: Int = 0 //用户已玩次数
    var bgPic: String = "" //背景图片地址
    var winSettings: [Prize] = []  //各种中奖的奖品设置。其中元素参见数据类型：奖品设置。
}

