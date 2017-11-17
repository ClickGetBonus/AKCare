//
//  ProBannerCell.swift
//  AKCare
//
//  Created by Aki on 2017/11/17.
//  Copyright © 2017年 Ian. All rights reserved.
//

import UIKit

class ProBannerCell: UITableViewCell {

    @IBOutlet weak var bannerImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bannerImageView.setCornerRadius(10.0)
    }
    
}
