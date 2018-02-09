//
//  DateUtil.swift
//  AKCare
//
//  Created by Aki on 2018/2/9.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation

extension Date {
    
    static let formatter = DateFormatter()
    
    var stringNormalFormatValue: String? {
        Date.formatter.dateFormat = "YYYY-MM-DD HH:mm"
        return String.formatter.string(from: self)
    }
    
    
    var StringShortFormatValue: String? {
        Date.formatter.dateFormat = "YYYY-MM-DD"
        return String.formatter.string(from: self)
    }
}
