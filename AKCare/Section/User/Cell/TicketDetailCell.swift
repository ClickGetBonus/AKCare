//
//  TicketDetailCell.swift
//  AKCare
//
//  Created by Lan on 2018/2/10.
//  Copyright © 2018年 Ian. All rights reserved.
//

import UIKit

class TicketDetailCell: UITableViewCell {

    static let cellHeight: CGFloat = 120.0
    
    @IBOutlet weak var ticketPriceLabel: UILabel!
    @IBOutlet weak var ticketDescriptionLabel: UILabel!
    @IBOutlet weak var bottomView: UIView!
    
    func configure(ticket: TicketInfo) {
        
//        self.bottomView.corner(byRoundingCorners: [.bottomLeft, .bottomRight,.topLeft, .topRight],
//                               radii: 8.0)
        self.bottomView.setCornerRadius(8.0)
        self.ticketPriceLabel.text = "礼品价格: \(ticket.giftPrice)"
        self.ticketDescriptionLabel.text = "\(ticket.descri)"
    }
}
