//
//  MJ_MineView.swift
//  guide_swift
//
//  Created by FCNC05 on 2020/8/24.
//  Copyright © 2020 FCNC05. All rights reserved.
//

import UIKit

class MJ_MineView: UIView {

let loginV_frame = CGRect.init(x: 0, y: 0, width: MJScreenWidth, height: MJScreenHeight)
init(){
    super.init(frame: loginV_frame)
    self.backgroundColor = UIColor.yellow
}

required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
   deinit {
       print("deinit")
   }
}
