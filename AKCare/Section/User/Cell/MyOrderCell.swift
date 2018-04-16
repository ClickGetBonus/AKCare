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
    
    var isHidePrice: Bool = false
    var configured: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(by order: Order) {
        
        
        let prods = order.prods;
        
        _ = self.orderProdsView.subviews.map { $0.removeFromSuperview() }
        self.setupProdsView(by: prods, isHidePrice: order.isHidePrice == 1)
        
        self.orderNumLabel.text = order.orderNo
        self.orderDateLabel.text = order.createTime
        self.orderProdNumLabel.text = "共\(order.totalQuantity)件商品"
        
        self.accountLabel.text = order.isHidePrice == 1 ? "" : "合计: \(order.totalPrice)元"
        
    }
    
    
    func setupProdsView(by prods: [OrderProduct], isHidePrice: Bool) {
        
        
        self.isHidePrice = isHidePrice
        
        var currentSeperator = self.generalSeperatorView()
        currentSeperator.snp.remakeConstraints { (make) in
            
            make.top.equalTo(self.orderProdNumLabel.bottom).offset(5)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(1)
        }
        
        for prod in prods {
            
            var bottomView: UIView
            if prod.dataType == 0 && prod.actSetType == 0 { //主套餐
                bottomView = configureMainAct(by: prod, topConstraint: currentSeperator)
            } else if prod.actSetType == 1 { //子套餐
                bottomView = configureChildAct(by: prod, topConstraint: currentSeperator)
            } else { //其他商品
                bottomView = configureOther(by: prod, topConstraint: currentSeperator)
            }
            
            currentSeperator = self.generalSeperatorView()
            currentSeperator.snp.makeConstraints({ (make) in
                make.top.equalTo(bottomView).offset(5)
                make.left.equalToSuperview()
                make.right.equalToSuperview()
                make.height.equalTo(1)
            })
            
            
        }
    }
    
    //配置主套餐Cell
    func configureMainAct(by prod: OrderProduct, topConstraint topView: UIView) -> UIView {
        
        let prodImageView = UIImageView()
        prodImageView.ak_setImage(urlString: prod.pic)
        self.orderProdsView.addSubview(prodImageView)
        
        prodImageView.snp.remakeConstraints { (make) in
            make.top.equalTo(topView).offset(5)
            make.left.equalTo(topView)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.text = prod.name
        self.orderProdsView.addSubview(titleLabel)
        
        titleLabel.snp.remakeConstraints { (make) in
            
            make.left.equalTo(prodImageView).offset(10)
            make.top.equalTo(prodImageView.bottom).offset(5)
        }
        
        if !self.isHidePrice {
            
            let priceLabel = UILabel()
            priceLabel.textColor = UIColor(0xFF9E46)
            priceLabel.text = "小计: \(prod.price)元"
            priceLabel.font = UIFont.systemFont(ofSize: 14)
            self.orderProdsView.addSubview(priceLabel)
            
            priceLabel.snp.remakeConstraints({ (make) in
                make.left.equalTo(titleLabel)
                make.top.equalTo(titleLabel.bottom).offset(5)
            })
        }
        
        
        let numLabel = UILabel()
        numLabel.text = "数量: \(prod.quantity)"
        numLabel.font = UIFont.systemFont(ofSize: 14)
        self.orderProdsView.addSubview(numLabel)
        
        
        
        
        
        
        return prodImageView
    }
    
    //配置子套餐Cell
    func configureChildAct(by prod: OrderProduct, topConstraint topView: UIView) -> UIView {
        
        
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 12)
        titleLabel.text = prod.name
        self.orderProdsView.addSubview(titleLabel)
        
        titleLabel.snp.remakeConstraints { (make) in
            
            make.left.equalTo(topView.left).offset(110)
            make.top.equalTo(topView).offset(5)
        }
        
        if !self.isHidePrice {
            
            let priceLabel = UILabel()
            priceLabel.textColor = UIColor(0xFF9E46)
            priceLabel.text = "小计: \(prod.price)元"
            priceLabel.font = UIFont.systemFont(ofSize: 14)
            self.orderProdsView.addSubview(priceLabel)
            
            priceLabel.snp.remakeConstraints({ (make) in
                make.left.equalTo(titleLabel)
                make.top.equalTo(titleLabel.bottom).offset(5)
            })
        }
        
        
        return titleLabel
    }
    
    //配置其他商品Cell
    func configureOther(by prod: OrderProduct, topConstraint topView: UIView) -> UIView {
        
        
    }
    
    func generalSeperatorView() -> UIView {
        
        let seperator = UIView()
        seperator.backgroundColor = UIColor.lightGray
        self.orderProdsView.addSubview(seperator)
        return seperator
    }
}
