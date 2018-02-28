//
//  ProdCell.swift
//  AKCare
//
//  Created by Aki on 2017/12/26.
//  Copyright © 2017年 Ian. All rights reserved.
//

import UIKit

class ProdCell: UITableViewCell {

    @IBOutlet weak var prodImgView: UIImageView!
    @IBOutlet weak var prodNameLabel: UILabel!
    @IBOutlet weak var prodSizeLabel: UILabel!
    @IBOutlet weak var prodLayerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func configure(by product: Product) {
        
        self.prodImgView.ak_setImage(urlString: product.pic)
        self.prodNameLabel.text = product.name
        self.prodSizeLabel.text = product.prodDims
        self.prodLayerLabel.text = product.plasterLayer
    }
    
}
