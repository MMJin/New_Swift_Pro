//
//  MJ_LoginView.swift
//  guide_swift
//
//  Created by FCNC05 on 2020/8/10.
//  Copyright © 2020 FCNC05. All rights reserved.
//

import UIKit
import SnapKit
typealias firstBlock = ((_ name:String)->String)?
let MJScreenWidth = UIScreen.main.bounds.size.width
let MJScreenHeight = UIScreen.main.bounds.size.height


class MJ_LoginView: UIView,UITextFieldDelegate {
    var myBlock : firstBlock?
    let loginV_frame = CGRect.init(x: 0, y: 0, width: MJScreenWidth, height: MJScreenHeight)
    let intArr = [3,4,2,1,9,7,6,8,5,6,4]
    let strArr = ["1","6","2","1","2"]
    let blockB = {(name:String) -> String in
         return name + "某人的名字"
    }
    let phoneText = UITextField()

    init(){
        super.init(frame: loginV_frame)
        let arr = intArr.sorted()
        let arrS = strArr.sorted(by:blockA(a:b:))
        print(arr,arrS)
        print(blockB("金"))
        self .setUI()
    }
  public  func makeq(forinc:uint)->firstBlock {
        _ = "是不是傻的"
        func intC(_ name:String)->String{
           return "ye" + name
        }
        return intC
    }
    func setUI()  {
        phoneText.placeholder = "请输入手机号"
        phoneText.backgroundColor = .green
        phoneText.delegate = self
        phoneText.borderStyle = .roundedRect;
        self .addSubview(phoneText)
        phoneText.snp_makeConstraints { (make) in
            make.edges.equalTo(self).inset(UIEdgeInsets(top: 84, left: 0, bottom: MJScreenHeight-124, right: 0))
        }

        let loginBtn = UIButton()
        loginBtn.setTitle("登录", for:.normal)
        loginBtn.setTitleColor(.white, for: .normal)
        loginBtn.backgroundColor = .red
        loginBtn .addTarget(self, action:#selector(login(_ :)), for: .touchUpInside)
        self .addSubview(loginBtn)
        loginBtn.snp_makeConstraints { (make) in
            make.top.equalTo(phoneText.snp_bottom).offset(5)
            make.left.equalTo(self).offset(0)
            make.right.equalTo(self).offset(0)
            make.height.equalTo(40)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        phoneText.resignFirstResponder()
    }

    @objc func login(_ btn:UIButton){
        //print("点击了登录" + "\(btn.tag)" + phoneText.text!)
        let loginResult = LoginVM().login()
        if loginResult {
            if myBlock != nil {
               myBlock!!("登录成功")
            }
             print("点击了登录" + "\(btn.tag)" + phoneText.text!)
        }
       }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("开始编辑了" + textField.text!)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("结束输出" + textField.text!)
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("改变输出--总是少一个" + textField.text!)
        return true
    }
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print("改变输出--及时的" + textField.text!)
    }
    func blockA(a:String,b:String) ->Bool {
        return a>b
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    deinit {
        print("deinit")
    }
}
