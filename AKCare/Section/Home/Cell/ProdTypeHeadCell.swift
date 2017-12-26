//
//  ProdTypeHeadCell.swift
//  AKCare
//
//  Created by Aki on 2017/12/26.
//  Copyright © 2017年 Ian. All rights reserved.
//

import UIKit

class ProdTypeHeadCell: UITableViewCell {
    
    static let CellHeight: CGFloat = 80.0
    
    @IBOutlet weak var arrow: UIImageView!
    @IBOutlet weak var typeLabel: UILabel!
    
    func select() {
        self.arrow.rotation(by: Double.pi)
    }
    
    func deselect() {
        self.arrow.rotation(by: Double.pi)
    }
}
