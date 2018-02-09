//
//  MyTicketVC.swift
//  AKCare
//
//  Created by Aki on 2018/2/8.
//  Copyright © 2018年 Ian. All rights reserved.
//

import UIKit
import ElongationPreview

class MyTicketVC: ElongationViewController {
    
    let cellIdentifier = "MyTicketCell"
    var tickets: [Ticket] = []
    var oldTickets: [Ticket] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupBackItem()
        self.setupViews()
        
    }
    
    func setupViews() {
        self.tableView.register(MyTicketCell.nib, forCellReuseIdentifier: cellIdentifier)
        self.tableView.backgroundColor = UIColor.groupTableViewBackground
        self.tableView.setupRefreshable(color: NavBGTranslucentColor) { [weak self] () -> Void in
            
            self?.requestTickets() {
                self?.tableView.reloadData()
                self?.tableView.finishRefresh()
            }
        }
        
        SwiftLoader.show(animated: true)
        self.requestTickets {
            self.tableView.reloadData()
            SwiftLoader.hide()
        }
    }
    
    func getTicket(by indexPath: IndexPath) -> Ticket? {
        if indexPath.section == 0 {
            guard indexPath.row < self.tickets.count else {
                return nil
            }
            return self.tickets[indexPath.row]
        } else if indexPath.section == 1 {
            guard indexPath.row < self.oldTickets.count else {
                return nil
            }
            return self.oldTickets[indexPath.row]
        } else {
            return nil
        }
        
    }
}


// MARK - Network
extension MyTicketVC {
    
    func requestTickets(complete: @escaping () -> Void) {
        
        AKApi.send(request: GetTicketListRequest(sid: AKUserManager.getSid(), startDataId: "")) { (response) in
            
            if let response = response {
                self.tickets = response.tickets
                self.oldTickets = response.oldTickets
            }
            
            complete()
        }
    }
}


// MARK - UITableView Delegate & DataSource
extension MyTicketVC {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 1 ? 30 : 0.01
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 30))
            view.backgroundColor = UIColor.groupTableViewBackground
            
            let label = UILabel(frame: CGRect(x: 16, y: 0, width: ScreenWidth-16, height: 30))
            label.text = "已用/过期卡券 (半年内)"
            label.textColor = UIColor.lightGray
            label.backgroundColor = UIColor.clear
            
            view.addSubview(label)
            return view
        }
        
        return nil
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return MyTicketCell.cellHeight
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? tickets.count : oldTickets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! MyTicketCell
        if let ticket = self.getTicket(by: indexPath) {
            cell.configure(ticket: ticket)
        }
        return cell
    }
}
