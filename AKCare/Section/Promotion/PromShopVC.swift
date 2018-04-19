//
//  PromShopVC.swift
//  AKCare
//
//  Created by Aki on 2018/4/19.
//  Copyright © 2018年 Ian. All rights reserved.
//

/*
 活动 选购套餐页面
 */
import Foundation
import UIKit

class PromShopVC: UIViewController {
    
    var promResponse: GetPromResponse!
    
    var prom: Prom?
    var actSets: [PromSet] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getPromSets()
    }
    
}



// MARK: - Network
extension PromShopVC {
    
    func getPromSets() {
        guard let prom = promResponse else {
            return
        }
        
        AKApi.send(request: GetPromSetRequest(sid: AKUserManager.getSid(), actId: prom.actId)) { (response) in
            
            if let res = response {
                
                self.prom = res.act
                self.actSets = res.actSets
                
            }
        }
    }
}
