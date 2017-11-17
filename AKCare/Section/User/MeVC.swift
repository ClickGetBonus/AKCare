//
//  MeVC.swift
//  AKCare
//
//  Created by Aki on 2017/10/31.
//  Copyright © 2017年 Ian. All rights reserved.
//

import UIKit

public enum MeOption: Int {
    case message
    case card
    case order
    case save
    case info
    case password
    case feedback
    case controlGuide
    case aboutUs
}

class MeVC: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var meOptionView: UIView!
    
    let optionViewHeight: CGFloat = 120
    
    let options: [MeOption] = [.message, .card, .order, .save, .info, .password, .feedback, .controlGuide, .aboutUs]
    let optionTitles: [String] = ["消息中心", "我的卡券", "我的订单", "我的收藏", "个人资料", "设置密码", "意见反馈", "操作指引", "关于我们"]
    let optionImgs: [UIImage] = [#imageLiteral(resourceName: "my_op01"), #imageLiteral(resourceName: "my_op02"), #imageLiteral(resourceName: "my_op03"), #imageLiteral(resourceName: "my_op04"), #imageLiteral(resourceName: "my_op05"), #imageLiteral(resourceName: "my_op06"), #imageLiteral(resourceName: "my_op07"), #imageLiteral(resourceName: "my_op08"), #imageLiteral(resourceName: "my_op09")]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navBarBgAlpha = 0
        
        for option in options {
            
            if let view = getOptionView(with: option) {
                self.meOptionView.addSubview(view)
            }
        }
    }
    
    func getOptionView(with option: MeOption) -> UIView? {
        
        let index = option.rawValue
        guard index < options.count else {
            return nil
        }
        
        let optionViewWidth: CGFloat = view.bounds.width/3
        let optionView = UIView(frame: CGRect(x: CGFloat(index % 3) * optionViewWidth,
                                              y: CGFloat(Int(index/3) * Int(optionViewHeight)),
                                              width: optionViewWidth,
                                              height: optionViewHeight))
        
        let img = UIImageView(image: optionImgs[index])
        img.center = CGPoint(x: optionViewWidth/2, y: optionViewHeight/2-10)
        optionView.addSubview(img)
        
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 20))
        title.text = optionTitles[index]
        title.textAlignment = .center
        title.font = UIFont.systemFont(ofSize: 15.0)
        title.center = CGPoint(x: optionViewWidth/2, y: optionViewHeight/2+30)
        optionView.addSubview(title)
        
        let button = UIButton(type: .system)
        button.setTitle(nil, for: .normal)
        button.frame = optionView.bounds
        button.tag = index
        button.addTarget(self, action: #selector(onClickOption(sender:)), for: .touchUpInside)
        optionView.addSubview(button)
        
        return optionView
    }
    
    @objc func onClickOption(sender: UIButton) {
        
        print(optionTitles[sender.tag])
    }
    
    
    @IBAction func goExpRule(_ sender: Any) {
        let vc = H5ViewController(url: AKExpRuleUrl)
        self.show(vc, sender: nil)
    }
    
}
