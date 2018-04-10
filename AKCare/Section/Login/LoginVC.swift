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
        
        URLSessionClient.share.send(LoginRequest(userName: "lzmd", passwd: "0cc175b9c0f1b6a831c399e269772661")) { (response) in
            
            if let response = response {
                
                let auth = Auth(sid: response.sid, userName: response.userName, userType: response.userType)
                LogInOut.login(auth: auth)
            }
        }
    }
        
    @IBAction func onRegist(_ sender: Any) {
        
    }
    
    @IBAction func onForgetPassword(_ sender: Any) {
        
    }
    
}
