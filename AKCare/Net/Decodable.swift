//
//  Decodable.swift
//  AKCare
//
//  Created by Aki on 2017/11/2.
//  Copyright © 2017年 Ian. All rights reserved.
//

import Foundation

protocol Decodable {
    static func parse(_ json: String) -> Self?
}
