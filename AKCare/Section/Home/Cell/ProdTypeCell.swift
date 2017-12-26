//
//  ProdTypeCell.swift
//  AKCare
//
//  Created by Aki on 2017/12/25.
//  Copyright © 2017年 Ian. All rights reserved.
//

import UIKit

class ProdTypeCell: UITableViewCell {
    
    static let CellHeight: CGFloat = 60
    @IBOutlet weak var contentBackgroundView: UIView!
    
    @IBOutlet weak var productLabel: UILabel!
    
    override func awakeFromNib() {
        contentBackgroundView.setCornerRadius(5.0)
    }
}
