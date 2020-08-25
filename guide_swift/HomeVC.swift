//
//  HomeVC.swift
//  guide_swifit
//
//  Created by FCNC05 on 2020/8/10.
//  Copyright © 2020 FCNC05. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.yellow
        self.title = "用户登录"
        let loginV = MJ_LoginView()
        loginV.frame = CGRect.init(x: 0, y: 10, width: MJScreenWidth, height: MJScreenHeight)

        loginV.myBlock = {(name:String)->String in
            print("返回"+name)
            if name == "登录成功" {
                self.navigationController?.pushViewController(HomePageVC(), animated: true)
            }
            return name;
        }

        self.view .addSubview(loginV)
    }

}
