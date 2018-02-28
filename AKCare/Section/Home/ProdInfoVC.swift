//
//  ProdInfoVC.swift
//  AKCare
//
//  Created by Aki on 2017/12/27.
//  Copyright © 2017年 Ian. All rights reserved.
//

import UIKit

class ProdInfoVC: UIViewController {
    
    var product: Product!
    var info: ProdInfoResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if #available(iOS 11.0, *) {
            self.navigationItem.largeTitleDisplayMode = .never
        }
        
        
        AKApi.send(request: ProdInfoRequest(sid: AKUserManager.getSid(), prodId: product.prodId)) { (response) in
            
            self.info = response
            
        }
    }
    
    func reloadData() {
        
        
    }
    
}
