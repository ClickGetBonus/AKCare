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
        
        var currentSeperator: UIView
        var topContraint: ConstraintItem = self.orderProdsView.snp.top
        
        for prod in prods {
            
            currentSeperator = self.generalSeperatorView()
            currentSeperator.snp.makeConstraints({ (make) in
                make.top.equalTo(topContraint).offset(5)
                make.left.equalToSuperview()
                make.right.equalToSuperview()
                make.height.equalTo(1)
            })
            
            if prod.dataType == 0 && prod.actSetType == 0 { //主套餐
                topContraint = configureMainAct(by: prod, topConstraint: currentSeperator).snp.bottom
            } else if prod.actSetType == 1 { //子套餐
                topContraint = configureChildAct(by: prod, topConstraint: currentSeperator).snp.bottom
            } else { //其他商品 如: 订单中使用的卡券
                topContraint = configureOther(by: prod, topConstraint: currentSeperator).snp.bottom
            }
        }
        
        currentSeperator = self.generalSeperatorView()
        currentSeperator.snp.makeConstraints({ (make) in
            make.top.equalTo(topContraint).offset(5)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(1)
            let bottom = make.bottom.equalToSuperview().offset(-5).constraint
            bottom.layoutConstraints.first?.priority = .defaultLow
        })
    }
    
    //配置主套餐Cell
    func configureMainAct(by prod: OrderProduct, topConstraint topView: UIView) -> UIView {
        
        let prodImageView = UIImageView()
        prodImageView.ak_setImage(urlString: prod.pic)
        self.orderProdsView.addSubview(prodImageView)
        
        prodImageView.snp.makeConstraints { (make) in
            make.top.equalTo(topView.snp.bottom).offset(5)
            make.left.equalTo(topView)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.text = prod.name
        titleLabel.numberOfLines = 2
        self.orderProdsView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            
            make.left.equalTo(prodImageView.snp.right).offset(10)
            make.top.equalTo(prodImageView).offset(5)
            make.right.equalToSuperview()
        }
        
        if !self.isHidePrice {
            
            let priceLabel = UILabel()
            priceLabel.textColor = UIColor(0xFF9E46)
            priceLabel.text = "小计: \(prod.price)元"
            priceLabel.font = UIFont.systemFont(ofSize: 14)
            self.orderProdsView.addSubview(priceLabel)
            
            priceLabel.snp.makeConstraints({ (make) in
                make.left.equalTo(titleLabel)
                make.top.equalTo(titleLabel.snp.bottom).offset(5)
            })
        }
        
        
        let numLabel = UILabel()
        numLabel.text = "数量: \(prod.quantity)"
        numLabel.font = UIFont.systemFont(ofSize: 14)
        self.orderProdsView.addSubview(numLabel)
        
        numLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
        }
        
        return prodImageView
    }
    
    //配置子套餐Cell
    func configureChildAct(by prod: OrderProduct, topConstraint topView: UIView) -> UIView {
        
        
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 12)
        titleLabel.text = prod.name
        titleLabel.numberOfLines = 2
        self.orderProdsView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(topView.snp.bottom).offset(5)
            make.left.equalTo(topView).offset(110)
            make.right.equalToSuperview()
        }
        
        if !self.isHidePrice {
            
            let priceLabel = UILabel()
            priceLabel.textColor = UIColor(0xFF9E46)
            priceLabel.text = "小计: \(prod.price)元"
            priceLabel.font = UIFont.systemFont(ofSize: 14)
            self.orderProdsView.addSubview(priceLabel)
            
            priceLabel.snp.makeConstraints({ (make) in
                make.left.equalTo(titleLabel)
                make.top.equalTo(titleLabel.snp.bottom).offset(5)
            })
            
        }
        
        let numLabel = UILabel()
        numLabel.text = "数量: \(prod.quantity)"
        numLabel.font = UIFont.systemFont(ofSize: 14)
        self.orderProdsView.addSubview(numLabel)
        
        numLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
        }
        
        
        return numLabel
    }
    
    //配置其他商品Cell
    func configureOther(by prod: OrderProduct, topConstraint topView: UIView) -> UIView {
        
        
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 12)
        titleLabel.textColor = UIColor.gray
        titleLabel.text = prod.name
        titleLabel.numberOfLines = 2
        self.orderProdsView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            
            make.left.equalTo(topView).offset(110)
            make.top.equalTo(topView.snp.bottom).offset(5)
            make.right.equalToSuperview()
        }
        
        
        
        let numLabel = UILabel()
        numLabel.text = "数量: \(prod.quantity)"
        numLabel.font = UIFont.systemFont(ofSize: 14)
        self.orderProdsView.addSubview(numLabel)
        
        numLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
        }
        
        return numLabel
    }
    
    func generalSeperatorView() -> UIView {
        
        let seperator = UIView()
        seperator.backgroundColor = UIColor.groupTableViewBackground
        self.orderProdsView.addSubview(seperator)
        return seperator
    }
}
