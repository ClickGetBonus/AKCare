//
//  PlayTigerResponse.swift
//  AKCare
//
//  Created by Aki on 2018/1/22.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation

class PlayTigerResponse: BaseResponse {
    
    var win: Bool = false //是否中奖
    var playTimeLeft: Int = 0 //剩余可玩次数
    var winSetting: Prize? = nil //中奖的奖品设置。参见数据类型：奖品设置
    var fruitAtPosi1: Int = 0 //第1个位置的水果。用1至5分别表示5种水果。
    var fruitAtPosi2: Int = 0 //第2个位置的水果。用1至5分别表示5种水果。
    var fruitAtPosi3: Int = 0 //第3个位置的水果。用1至5分别表示5种水果。
}
