//
//  LoginVC.swift
//  AKCare
//
//  Created by Aki on 2017/10/25.
//  Copyright © 2017年 Ian. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class LoginVC: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onLogin(_ sender: Any) {
        
        URLSessionClient.share.send(LoginRequest(userName: "门店文", passwd: "202cb962ac59075b964b07152d234b70")) { (response) in
            
            if let response = response {
                
                AKUserManager.userAuth = Auth(sid: response.sid, userName: response.userName, userType: response.userType)
                UIApplication.shared.keyWindow?.rootViewController = R.storyboard.main.instantiateInitialViewController()
            }
            
        }
        
    }
        
    @IBAction func onRegist(_ sender: Any) {
        
    }
    
    @IBAction func onForgetPassword(_ sender: Any) {
        
    }
    
}
