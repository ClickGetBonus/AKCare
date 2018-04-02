//
//  MyOrderVC.swift
//  AKCare
//
//  Created by Aki on 2018/2/8.
//  Copyright © 2018年 Ian. All rights reserved.
//

import UIKit
import Segmentio

class MyOrderVC: UIViewController {
    
    @IBOutlet weak var segment: Segmentio! {
        didSet {
            self.segment.setup(content: [SegmentioItem(title: "待收货", image: nil),
                                         SegmentioItem(title: "待发货", image: nil),
                                         SegmentioItem(title: "已完成", image: nil)],
                               style: .onlyLabel,
                               options: nil)
            self.segment.valueDidChange = { [unowned self] segment, index in
                var state: OrderState
                switch index {
                case 0:
                    state = .waitSend
                case 1:
                    state = .sending
                case 2:
                    state = .complete
                default:
                    state = .waitSend
                }
                
                if state != self.orderState {
                    self.orderState = state
                    self.updateData()
                }
            }
        }
    }
    @IBOutlet weak var tableView: UITableView!
    
    var orders: [Order] = []
    var orderState: OrderState = .waitSend
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupBackItem()
        
        self.updateData()
    }
    
    func updateData() {
        
        self.getOrders(self.orderState) { [unowned self] response in
            
            if let response = response {
                
                self.orders = response.orders
                self.tableView.delegate = self
                self.tableView.dataSource = self
                self.tableView.reloadData()
            }
        }
    }
    
}

// MARK: - Network
extension MyOrderVC {
    
    func getOrders(_ state: OrderState, _ handler: @escaping (GetOrderResponse?) -> Void) {
        AKApi.send(request: GetOrderRequest(sid: AKUserManager.getSid(),
                                            type: state,
                                            startDataId: ""),
                   handler)
    }
}

// MARK: - UITableView Delegate & DataSource
extension MyOrderVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
