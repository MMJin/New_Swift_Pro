//
//  LoginVM.swift
//  guide_swift
//
//  Created by FCNC05 on 2020/8/11.
//  Copyright © 2020 FCNC05. All rights reserved.
//

import UIKit
import Alamofire
typealias caseBlock1 = ((_ str:String,_ timeValue:Float) ->Bool)?

public let caseBlock2 = {(str:String,timeValue:Float) ->Bool in
    let url = "https://www.baidu.com"
    var status:Bool
//    Alamofire.request(url as! URLConvertible, method: .get, parameters: <#T##Parameters?#>, encoding: <#T##ParameterEncoding#>, headers: <#T##HTTPHeaders?#>)

    Alamofire.request(url).responseJSON { (response) in
        switch response.result {
        case .success(_):
            print("百度请求成功")
            break
        case .failure(_):
            print("百度请求失败")
            break
        }
    }
    return true
}

public let caseBlock = {(str:String,timeValue:Float) ->Bool in
       return true
   }
class LoginVM: NSObject {

    public func login() -> Bool{
        print("登录请求")
        self.perform(#selector(update), with: "", afterDelay: 2)

        return caseBlock2 ("",1.1)
    }
    @objc func update(){
        print("请求成功--刷UI啦")
//        MJ_LoginView().updateUI()
    }
}
