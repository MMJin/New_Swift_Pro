//
//  MJ_HomePageView.swift
//  guide_swift
//
//  Created by FCNC05 on 2020/8/11.
//  Copyright © 2020 FCNC05. All rights reserved.
//

import UIKit

class MJ_HomePageView: UIView {
    let loginV_frame = CGRect.init(x: 0, y: 0, width: MJScreenWidth, height: MJScreenHeight)
    init(){
        super.init(frame: loginV_frame)
        self.backgroundColor = UIColor.red
    }




    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       deinit {
           print("deinit")
       }
}
