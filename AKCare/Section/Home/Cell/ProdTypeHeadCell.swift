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
    
    func select(animated: Bool) {
        self.arrow.rotation(to: Double.pi, animated: animated)
    }
    
    func deselect(animated: Bool) {
        self.arrow.rotation(to: 0, animated: animated)
    }
}
