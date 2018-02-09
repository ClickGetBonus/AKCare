//
//  MyTicketCell.swift
//  AKCare
//
//  Created by Aki on 2018/2/8.
//  Copyright © 2018年 Ian. All rights reserved.
//

import UIKit
import ElongationPreview

class MyTicketCell: ElongationCell {
    
    static let cellHeight: CGFloat = CGFloat(180/400*ScreenWidth)

    
    @IBOutlet weak var ticketImageView: UIImageView!
    
    @IBOutlet weak var ticketNumLabel: UILabel!
    @IBOutlet weak var ticketExpiryDateLabel: UILabel!
    @IBOutlet weak var ticketTypeLabel: UILabel!
    @IBOutlet weak var ticketUseSceneLabel: UILabel!
    @IBOutlet weak var ticketUseDateLabel: UILabel!
    
    
    func configure(ticket: Ticket) {
        self.ticketNumLabel.text = "卡券号: \(ticket.ticketCode)"
        self.ticketExpiryDateLabel.text = "有效期: \(ticket.startUseDate)至\(ticket.expiredDate) 余\(max(0,ticket.leftDays))"
        self.ticketTypeLabel.text = ticket.name
        self.ticketUseSceneLabel.text = "使用类型: \(TicketUseScene(rawValue: ticket.useScene)?.name() ?? "不知名卡券")"
        self.ticketUseDateLabel.text = "用券时间: \(ticket.usedTime)"
        
        let expiredDate = ticket.expiredDate.dateShortFormatValue
        if ticket.leftDays > 0 && expiredDate != nil && expiredDate! > Date() {
            ticketImageView.image = #imageLiteral(resourceName: "gift_ticket_bg")
            self.ticketNumLabel.textColor = UIColor.orange
            self.ticketExpiryDateLabel.textColor = UIColor.orange
            self.ticketUseDateLabel.isHidden = true
        } else {
            ticketImageView.image = #imageLiteral(resourceName: "gift_ticket_old_bg")
            self.ticketNumLabel.textColor = UIColor.lightGray
            self.ticketExpiryDateLabel.textColor = UIColor.lightGray
            self.ticketUseDateLabel.isHidden = false
        }
        
        
        
    }
}
