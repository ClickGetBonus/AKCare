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
                               options: SegmentioOptions(backgroundColor: .white,
                                                         horizontalSeparatorOptions:SegmentioHorizontalSeparatorOptions(type: .topAndBottom,height: 1, color: .gray),
                                                         verticalSeparatorOptions: SegmentioVerticalSeparatorOptions(ratio: 0.6,color: .gray),
                                                         segmentStates: SegmentioStates(
                                                            defaultState: SegmentioState(
                                                                backgroundColor: .clear,
                                                                titleFont: UIFont.systemFont(ofSize: UIFont.smallSystemFontSize),
                                                                titleTextColor: .black
                                                            ),
                                                            selectedState: SegmentioState(
                                                                backgroundColor: .clear,
                                                                titleFont: UIFont.systemFont(ofSize: UIFont.smallSystemFontSize),
                                                                titleTextColor: .orange
                                                            ),
                                                            highlightedState: SegmentioState(
                                                                backgroundColor: .clear,
                                                                titleFont: UIFont.boldSystemFont(ofSize: UIFont.systemFontSize),
                                                                titleTextColor: UIColor(0xFF9E46)
                                                         ))
            ))
            self.segment.valueDidChange = { [unowned self] segment, index in
                var state: OrderState
                switch index {
                case 0:
                    state = .waitSend
                case 1:
                    state = .waitReceive
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
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(MyOrderCell.nib, forCellReuseIdentifier: MyOrderCell.className)
        }
    }
    
    var orders: [Order] = []
    var orderState: OrderState = .waitSend
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupBackItem()
        
        self.segment.selectedSegmentioIndex = 0
        self.updateData()
    }
    
    func updateData() {
        
        self.getOrders(self.orderState) { [unowned self] response in
            
            if let response = response {
                self.orders = response.orders
                self.tableView.delegate = self
                self.tableView.dataSource = self
                self.tableView.reloadData()
                if self.orders.count > 0 {
                    self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
                }
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
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MyOrderCell = tableView.dequeueReusableCell(withIdentifier: MyOrderCell.className) as! MyOrderCell
        cell.configure(by: self.orders[indexPath.section])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
