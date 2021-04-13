//
//  AboutFontView.swift
//  guide_swift
//
//  Created by FCNC05 on 2021/3/25.
//  Copyright © 2021 FCNC05. All rights reserved.
//

import UIKit
import SnapKit
class AboutFontView: UIView {
    var showFrame = CGRect()
    let fontLable = UILabel()

    init(showTittle:String) {
        super.init(frame: CGRect(x: 0, y: 64, width: MJScreenWidth, height: MJScreenHeight-64))
        self.backgroundColor = UIColor.white
        self .setSubView(showStr: showTittle)
    }

    func setSubView(showStr:String)  {
        fontLable.text = showStr
        fontLable.textAlignment = NSTextAlignment.center
        self.addSubview(fontLable)
        fontLable.snp_makeConstraints { (make) in
            make.top.equalTo(100)
            make.centerX.equalTo(self)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        fontLable.font = UIFont.systemFont(ofSize: 20)


        let changeBtn = UIButton(type: .custom)
        changeBtn.setTitle("changeSomeThing", for: .normal)
        changeBtn.setTitleColor(UIColor.black, for: .normal)
        changeBtn.addTarget(self, action: #selector(change), for: .touchUpInside)
        self.addSubview(changeBtn)

        changeBtn.layer.borderWidth = 1
        changeBtn.layer.borderColor = UIColor.black.cgColor
        changeBtn.layer.cornerRadius = 15
        changeBtn.layer.masksToBounds = true

        changeBtn .snp_makeConstraints { (make) in
            make.top.equalTo(fontLable.snp_bottom).offset(100)
            make.centerX.equalTo(self)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }

    }
    @objc func change(){
     print("点击改变字体")
        fontLable.font = UIFont(name: "Savoye LET", size: 25)
    }
    //获取随机字体
    func printAllSupportedFontNames() -> String {
        let familyNames = UIFont.familyNames
        for familyName in familyNames {
            print("++++++ \(familyName)")
        }
        return ""
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
