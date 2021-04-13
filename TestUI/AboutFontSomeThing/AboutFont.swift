//
//  AboutFont.swift
//  guide_swift
//
//  Created by FCNC05 on 2021/3/25.
//  Copyright © 2021 FCNC05. All rights reserved.
//

import UIKit

class AboutFont: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "关于字体"

        //设置UI
        self.setUI()
    }
    func setUI() {
        var fontV = AboutFontView(showTittle: "关于字体修改")
        self.view.addSubview(fontV)


    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
