//
//  MyOrderCell.swift
//  AKCare
//
//  Created by Lan on 2018/3/31.
//  Copyright © 2018年 Ian. All rights reserved.
//

import UIKit
import SnapKit


class MyOrderCell: UITableViewCell {
    
    @IBOutlet weak var orderNumLabel: UILabel!
    @IBOutlet weak var orderDateLabel: UILabel!
    @IBOutlet weak var orderProdNumLabel: UILabel!
    @IBOutlet weak var accountLabel: UILabel!
    
    @IBOutlet weak var orderProdsView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(by order: Order) {
        
        
        let prods = order.prods;
        self.setupProdsView(by: prods, isHidePrice: order.isHidePrice == 1)
        
        self.orderNumLabel.text = order.orderNo
        self.orderDateLabel.text = order.createTime
        self.orderProdNumLabel.text = "共\(order.totalQuantity)件商品"
        
        self.accountLabel.text = order.isHidePrice == 1 ? "" : "合计: \(order.totalPrice)元"
        
    }
    
    
    func setupProdsView(by prods: [OrderProduct], isHidePrice: Bool) {
        
        var currentSeperator = self.generalSeperatorView()
        self.contentView.addSubview(currentSeperator)
        currentSeperator.snp.updateConstraints { (make) in
            
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(1)
        }
        
        for prod in prods {
            
            
        }
    }
    
    func generalSeperatorView() -> UIView {
        
        let seperator = UIView()
        seperator.backgroundColor = UIColor.lightGray
        return seperator
    }
}
