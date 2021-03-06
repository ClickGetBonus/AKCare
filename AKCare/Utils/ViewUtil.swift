//
//  ViewUtil.swift
//  AKCare
//
//  Created by Aki on 2017/11/17.
//  Copyright © 2017年 Ian. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func addCornerBorder(_ color: UIColor, _ width: CGFloat) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
        self.layer.cornerRadius = self.frame.height/2
        self.layer.masksToBounds = true
    }
    
    func setCornerRadius(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    //部分圆角
    func corner(byRoundingCorners corners: UIRectCorner, radii: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radii, height: radii))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
    
    var xibName: String {
        let clzzName = NSStringFromClass(self.classForCoder)
        let nameArray = clzzName.components(separatedBy: ".")
        var xibName = nameArray[0]
        if nameArray.count == 2 {
            xibName = nameArray[1]
        }
        return xibName
    }
    
    static var className: String {
        let clzzName = NSStringFromClass(self.classForCoder())
        let nameArray = clzzName.components(separatedBy: ".")
        var xibName = nameArray[0]
        if nameArray.count == 2 {
            xibName = nameArray[1]
        }
        return xibName
    }
    
    func loadViewWithNibName(_ fileName: String, owner: AnyObject) -> UIView {
        let nibs = Bundle.main.loadNibNamed(fileName, owner: owner, options: nil)
        return nibs![0] as! UIView
    }
    
    func initFromXIB() -> UIView{
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: xibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.frame = bounds
        return view
    }
    
    static var nib: UINib {
        return UINib(nibName: self.className, bundle: nil)
    }
    
    func addShadow() {
        self.addShadow(color: UIColor(0x0b0b0b).cgColor, opacity: 0.3, radius: 8)
    }
    
    func addShadow(color: CGColor, opacity: Float, radius: CGFloat) {
        self.layer.shadowColor = color
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.clipsToBounds = false
    }
    
    func addVeilViewBelow(_ view: UIView, target: AnyObject, selector: Selector) {
        let veilView = UIView(frame: self.bounds)
        veilView.tag = 180333
        let tapRes = UITapGestureRecognizer(target: target, action: selector)
        veilView.addGestureRecognizer(tapRes)
        veilView.backgroundColor = UIColor.black
        veilView.alpha = 0
        self.insertSubview(veilView, belowSubview: view)
        
        UIView.animate(withDuration: 0.5) {
            veilView.alpha = 0.6
        }
    }
    
    func hideVeilView(_ timeInterval: TimeInterval) {
        if let veilView = self.viewWithTag(180333) {
            UIView.animate(withDuration: timeInterval, animations: {
                veilView.alpha = 0
            }, completion: { (_) in
                veilView.removeFromSuperview()
            })
        }
    }
    
}


// MARK: - Frame Util
extension UIView {
    var x: CGFloat { get { return self.frame.origin.x } set { self.frame.origin.x = newValue } }
    var y: CGFloat { get { return self.frame.origin.y } set { self.frame.origin.y = newValue } }
    var width: CGFloat { get { return self.frame.size.width } set { self.frame.size.width = newValue } }
    var height: CGFloat { get { return self.frame.size.height } set { self.frame.size.height = newValue } }
    var left: CGFloat { get { return x } set { x = newValue } }
    var right: CGFloat { get { return x + width } set { x = newValue - width } }
    var top: CGFloat { get { return y } set { y = newValue } }
    var bottom: CGFloat { get { return y + height } set { y = newValue - height } }
}


// MARK: - Animation
extension UIView {
    
    func transitionIn(_ offset: UIOffset, complete: (() -> Void)?) {
        
        let pointFrame = self.frame
        
        var beginFrame = self.frame
        beginFrame.origin.x += offset.horizontal
        beginFrame.origin.y += offset.vertical
        self.frame = beginFrame
        
        UIView.animate(withDuration: 0.5, animations: {
            self.frame = pointFrame
        }) { _ in
            if complete != nil {
                complete!()
            }
        }
    }
    
    
    func transitionOut(_ offset: UIOffset, complete: @escaping () -> Void) {
        
        let pointFrame = CGRect(x: self.left + offset.horizontal,
                                y: self.top + offset.vertical,
                                width: self.width,
                                height: self.height)
        
        UIView.animate(withDuration: 0.5, animations: {
            self.frame = pointFrame
        }) { _ in
            complete()
        }
    }
    
    func rotation(to value: Double, animated: Bool) {
        
        let key = "transform.rotation"
        let from = (self.layer.animation(forKey: key) as? CABasicAnimation)?.toValue as? Double ?? 0.0
        guard from != value else {
            return
        }
        
        let anim = CABasicAnimation(keyPath: key)
        anim.fromValue = from
        anim.toValue = value
        anim.duration = animated ? 0.2 : 0.0
        // 保持运动后的状态
        anim.isRemovedOnCompletion = false
        anim.fillMode = kCAFillModeForwards
        self.layer.add(anim, forKey: key)
    }
}











