//
//  AKUtil.swift
//  AKCare
//
//  Created by Aki on 2017/12/22.
//  Copyright © 2017年 Ian. All rights reserved.
//

import Foundation


extension String {
    
    func ak_picUrlString() -> String {
        return AKServicePicPath + self
    }
    
    //根据开始位置和长度截取字符串
    func subString(start:Int, length:Int = -1) -> String {
        var len = length
        if len == -1 {
            len = self.count - start
        }
        let st = self.index(startIndex, offsetBy:start)
        let en = self.index(st, offsetBy:len)
        return String(self[st ..< en])
    }
}
