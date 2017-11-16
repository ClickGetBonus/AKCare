//
//  ColorExt.swift
//  AKCare
//
//  Created by Aki on 2017/11/15.
//  Copyright © 2017年 Ian. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(_ rgbValue: Int) {
        self.init(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0,
                  green: ((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0,
                  blue: ((CGFloat)(rgbValue & 0xFF)) / 255.0,
                  alpha: 1.0)
    }
    
}
