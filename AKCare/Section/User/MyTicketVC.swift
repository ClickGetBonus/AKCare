//
//  MyTicketVC.swift
//  AKCare
//
//  Created by Aki on 2018/2/8.
//  Copyright © 2018年 Ian. All rights reserved.
//

import UIKit

class MyTicketVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier = "MyTicketCell"
    let detailCellIdentifier = "TicketDetailCell"
    var tickets: [Ticket] = []
    var oldTickets: [Ticket] = []
    var ticketInfo: TicketInfo?
    
    var selection: IndexPath?
    var detailCellIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupBackItem()
        self.setupViews()
    }
    
    func setupViews() {
        
        self.tableView.register(MyTicketCell.nib, forCellReuseIdentifier: cellIdentifier)
        self.tableView.register(TicketDetailCell.nib, forCellReuseIdentifier: detailCellIdentifier)
        self.tableView.backgroundColor = UIColor.groupTableViewBackground
        self.tableView.setupRefreshable(color: NavBGTranslucentColor) { [weak self] () -> Void in
            
            self?.requestTickets() {
                self?.tableView.reloadData()
                self?.tableView.finishRefresh()
            }
        }
        
        SwiftLoader.show(animated: true)
        self.requestTickets {
            SwiftLoader.hide()
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.reloadData()
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
    
    
    func selectCell(by indexPath: IndexPath) {
        let indexPath = ignoreSelectionIndexPath(indexPath)
        guard let ticket = self.getTicket(by: indexPath) else {
            self.showInfo("卡券不存在")
            return
        }
        
        guard indexPath != self.selection else {
            return
        }
        
        SwiftLoader.show(animated: true)
        AKApi.send(request: TicketInfoRequest(sid: AKUserManager.getSid(), ticketId: ticket.ticketId)) { (response) in
            
            if let info = response?.detail {
                
                self.ticketInfo = info
                SwiftLoader.hide()
                
                self.tableView.beginUpdates()
                if let selection = self.selection {
                    self.tableView.deleteRows(at: [IndexPath(row: selection.row+1,
                                                             section: selection.section)],
                                              with: .top)
                    self.selection = nil
                }
                
                self.tableView.insertRows(at: [indexPath.rowPlus()], with: .top)
                self.selection = indexPath
                self.tableView.endUpdates()
//                self.selection = indexPath
                
//                UIView.transition(with: self.tableView, duration: 0.35, options: .transitionFlipFromBottom, animations: {
//                    self.tableView.reloadData()
//                }, completion: nil)
                
//                self.tableView.reloadSections(IndexSet(integer: indexPath.section), with: .automatic)
            }
        }
    }
    
    func deselectCell(by indexPath: IndexPath) {
        
        
        self.ticketInfo = nil
        self.selection = nil
        self.tableView.beginUpdates()
        self.tableView.deleteRows(at: [IndexPath(row: indexPath.row+1, section: indexPath.section)],
                                  with: .top)
        self.tableView.endUpdates()
        
//        UIView.transition(with: self.tableView, duration: 0.35, options: .transitionFlipFr, animations: {
//            self.tableView.reloadData()
//        }, completion: nil)
        
//        self.tableView.reloadSections(IndexSet(integer: indexPath.section), with: .automatic)
    }
    
}


// MARK - Network
extension MyTicketVC: UITableViewDelegate, UITableViewDataSource {
    
    func requestTickets(complete: @escaping () -> Void) {
        
        AKApi.send(request: GetTicketListRequest(sid: AKUserManager.getSid(), startDataId: "")) { (response) in
            
            if let response = response {
                self.tickets = response.tickets
                self.oldTickets = response.oldTickets
            }
            
            complete()
        }
    }
    
    func requestTicketInfo(ticketId: String, complete: @escaping (TicketInfo?) -> Void) {
        
        AKApi.send(request: TicketInfoRequest(sid: AKUserManager.getSid(), ticketId: ticketId)) { (response) in
            
            complete(response?.detail)
        }
    }
}


// MARK - UITableView Delegate & DataSource
extension MyTicketVC {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return oldTickets.count > 0 ? 2 : 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 1 ? 30 : 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        guard let selection = self.selection else {
            return MyTicketCell.cellHeight
        }
        
        if indexPath == IndexPath(row: selection.row+1, section: selection.section) {
            return UITableViewAutomaticDimension
//            return TicketDetailCell.cellHeight
        } else {
            return MyTicketCell.cellHeight
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let count = section == 0 ? tickets.count : oldTickets.count
        return section == selection?.section ? count+1 : count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if selection != nil &&
            indexPath == IndexPath(row: selection!.row+1, section: selection!.section) {
            
            guard let ticketInfo = self.ticketInfo else {
                self.showInfo("查看卡券详情失败")
                return UITableViewCell()
            }
            
            let cell = tableView.dequeueReusableCell(withIdentifier: detailCellIdentifier) as! TicketDetailCell
            cell.configure(ticket: ticketInfo)
            return cell
        } else {
            
            
            var indexPath = indexPath
            if selection != nil && indexPath.row > selection!.row+1 {
                indexPath = IndexPath(row: indexPath.row-1, section: indexPath.section)
            }
            
            guard let ticket = self.getTicket(by: indexPath) else {
                self.showInfo("卡券不存在")
                return UITableViewCell()
            }
            
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! MyTicketCell
            cell.configure(ticket: ticket)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard selection?.rowPlus() != indexPath else {
            return
        }
        
        if selection == indexPath {
            self.deselectCell(by: indexPath)
        } else {
            self.selectCell(by: indexPath)
        }
    }
    
    func ignoreSelectionIndexPath(_ indexPath: IndexPath) -> IndexPath {
        
        guard let selection = selection else {
            return indexPath
        }
        
        if selection.section == indexPath.section && selection.row+1 < indexPath.row {
            return IndexPath(row: indexPath.row-1, section: indexPath.section)
        } else {
            return indexPath
        }
    }
}

extension IndexPath {
    func rowPlus() -> IndexPath  {
        return IndexPath(row: self.row+1, section: self.section)
    }
    
    func rowPlus(_ a: Int) -> IndexPath  {
        return IndexPath(row: self.row+a, section: self.section)
    }
    
    func sectionPlus() -> IndexPath  {
        return IndexPath(row: self.row, section: self.section+1)
    }
    
    func sectionPlus(_ a: Int) -> IndexPath  {
        return IndexPath(row: self.row, section: self.section+a)
    }
}
