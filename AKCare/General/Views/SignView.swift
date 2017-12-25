//
//  SignView.swift
//  AKCare
//
//  Created by Aki on 2017/12/22.
//  Copyright © 2017年 Ian. All rights reserved.
//

import UIKit

class SignView: BaseXibView {
    
    @IBOutlet weak var closeLabel: UILabel!
    var second: Int = 3
    var timer: Timer?
    
    
    
    func show(in second: Int) {
        self.second = second
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(doCountDown), userInfo: nil, repeats: true)
    }
    
    func hide() {
        UIView.animate(withDuration: 0.8) {
            self.alpha = 0
        }
    }
    
    @objc func doCountDown() {
        self.second -= 1
        if self.second <= 0 {
            self.timer?.invalidate()
            self.timer = nil
            self.hide()
        } else {
            self.closeLabel.text = "\(second)秒后自动关闭"
        }
    }
    
}
