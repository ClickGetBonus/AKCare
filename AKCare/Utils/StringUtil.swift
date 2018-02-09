//
//  StringUtil.swift
//  AKCare
//
//  Created by Aki on 2018/2/9.
//  Copyright © 2018年 Ian. All rights reserved.
//

import Foundation


extension String {
    
    static let formatter = DateFormatter()
    
    var dateNormalFormatValue: Date? {
        String.formatter.dateFormat = "YYYY-MM-DD HH:mm"
        return String.formatter.date(from: self)
    }
    
    var dateShortFormatValue: Date? {
        String.formatter.dateFormat = "YYYY-MM-DD"
        return String.formatter.date(from: self)
    }
}
