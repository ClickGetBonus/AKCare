//
//  ProInfoVC.swift
//  AKCare
//
//  Created by Aki on 2017/12/1.
//  Copyright © 2017年 Ian. All rights reserved.
//

import UIKit
import SCLAlertView

class ProInfoVC: UIViewController {
    
    @IBOutlet weak var proImgView: UIImageView!
    @IBOutlet weak var proIntroLabel: UILabel!
    @IBOutlet weak var joinButtonView: UIView!
    
    @IBOutlet weak var proImageTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var proImageWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var joinButtonHeightConstraint: NSLayoutConstraint!
    
    var response: GetPromResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.proImageWidthConstraint.constant = ScreenWidth
        self.setupBackItem()
    }
    
    func configure(banner: PromBanner) {
        
        self.title = "活动详情"
        
        SwiftLoader.show(animated: true)
        AKApi.send(request: PromInfoRequest(sid: AKUserManager.getSid(), actId: banner.id, actType: banner.actType)) { (response) in
            
            if let prom = response {
                self.response = prom
                self.joinButtonView.isHidden = !prom.actStarted
                let imgType = prom.picTexts.filter{return $0.imgType}.first
                
                if imgType != nil {
                    self.proImgView.ak_setImage(urlString: imgType!.content)
                }
                
                let intro = prom.picTexts.reduce("", { (result, element) -> String in
                    return element.imgType ? result : result + element.content + "\n"
                })
                self.proIntroLabel.text = intro
            }
            
            SwiftLoader.hide()
        }
    }
    
    @IBAction func onJoin(_ sender: UIButton) {
        
        guard let promResponse = self.response else {
            return
        }
        
        if promResponse.haveActSet {
            
            let vc = R.storyboard.promotion.promShopVC()!
            vc.actId = promResponse.actId
            self.navigationController?.show(vc, sender: nil)
        } else if promResponse.haveGiveGift {
            self.submitOrder()
        } else {
            self.submitOrder()
        }
    }
    
    func submitOrder() {
        
//        AKApi.send(request: GenOrderRequest(sid: AKUserManager.getSid(),
//                                            name: "",
//                                            tel: "",
//                                            ticketId: "",
//                                            actId: self.response?.actId ?? "",
//                                            toBuys: "",
//                                            do4Confirm: 1))
//        { (response) in
//
//            SCLAlertView().showSuccess("您已成功参加活动", subTitle: "感谢您的参与").setDismissBlock { [unowned self] in
//                self.navigationController?.popViewController(animated: true)
//            }
//        }
        
        SCLAlertView().showSuccess("您已成功参加活动", subTitle: "感谢您的参与").setDismissBlock { [unowned self] in
            self.navigationController?.popViewController(animated: true)
        }
    }
}

extension ProInfoVC: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
        self.proImageWidthConstraint.constant = ScreenWidth - min(0, scrollView.contentOffset.y)
        self.proImageTopConstraint.constant = min(0, scrollView.contentOffset.y)
    }
}
