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
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var actId: String?
    
    var prom: Prom?
    var actSets: [PromSet] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupBackItem()
        self.getPromSets()
    }
    
    
}



// MARK: - Network
extension PromShopVC {
    
    func getPromSets() {
        guard let actId = actId else {
            return
        }
        
        AKApi.send(request: GetPromSetRequest(sid: AKUserManager.getSid(), actId: actId)) { (response) in
            
            if let res = response {
                
                self.prom = res.act
                self.actSets = res.actSets
            }
        }
    }
}
