//
//  LoginViewModel.swift
//  guide_swift
//
//  Created by FCNC05 on 2020/8/11.
//  Copyright © 2020 FCNC05. All rights reserved.
//

import UIKit
class subLoginView: MJ_LoginView {

    @objc override func login(_ btn:UIButton){
     print("点击了登录" + "\(btn.tag)" + phoneText.text!)
    }
}
