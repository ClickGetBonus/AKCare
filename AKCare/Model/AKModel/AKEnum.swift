//
//  AKEnum.swift
//  AKCare
//
//  Created by Aki on 2017/12/25.
//  Copyright © 2017年 Ian. All rights reserved.
//

import Foundation

enum HotClickType: Int {
    case promotion = 0
    case product = 1
    case infomation = 2
}

enum UserType {
    case store
    case construct
}

enum RegType: String {
    case store = "md"
    case construct = "sg"
}

enum ProdFavState: Int {
    case none = 0
    case have = 1
}

//卡券使用场景。0为线上活动，1为线下门店活动，2为线下商品卡券
enum TicketUseScene: Int {
    case online = 0
    case offlineStore = 1
    case offlineProd = 2
    
    func name() -> String {
        switch self {
        case .online:
            return "线上活动"
        case .offlineStore:
            return "线下门店活动"
        case .offlineProd:
            return "线下商品卡券"
        }
    }
}

