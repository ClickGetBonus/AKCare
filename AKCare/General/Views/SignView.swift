//
//  SignView.swift
//  AKCare
//
//  Created by Aki on 2017/12/22.
//  Copyright © 2017年 Ian. All rights reserved.
//

import UIKit

class SignView: BaseXibView {
    
    let SignAnimationTimeInterval: TimeInterval = 0.4
    
    @IBOutlet weak var closeLabel: UILabel!
    var second: Int = 3
    var timer: Timer?
    var complete: () -> Void = {}
    
    
    static func show(in second: Int) {
        
        let signView = SignView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight))
        signView.second = second
        signView.timer = Timer.scheduledTimer(timeInterval: 1, target: signView, selector: #selector(doCountDown), userInfo: nil, repeats: true)
        signView.alpha = 0
        let currentView = UIApplication.shared.keyWindow!
        currentView.addSubview(signView)
        UIView.animate(withDuration: signView.SignAnimationTimeInterval) {
            signView.alpha = 1
        }
        signView.complete = {
            signView.removeFromSuperview()
        }
    }
    
    func hide() {
        self.timer?.invalidate()
        self.timer = nil
        UIView.animate(withDuration: SignAnimationTimeInterval, animations: {
            self.alpha = 0
        }) { (_) in
            self.complete()
        }
    }
    
    @IBAction func onClose(_ sender: UIButton) {
        self.hide()
    }
    
    @objc func doCountDown() {
        self.second -= 1
        if self.second <= 0 {
            self.hide()
        } else {
            self.closeLabel.text = "\(second)秒后自动关闭"
        }
    }
    
}
