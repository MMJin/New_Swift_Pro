//
//  LoginVM.swift
//  guide_swift
//
//  Created by FCNC05 on 2020/8/11.
//  Copyright © 2020 FCNC05. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
typealias caseBlock1 = ((_ str:String,_ timeValue:Float) ->Bool)?

public typealias caseBlock4 = (_ loginStatus:String) ->String


public let caseBlock2 = {(phoneNumber:String,paswordNumber:String,_ escaBlock : @escaping caseBlock4) ->Bool in
    let url = "https://newlifemulti-test-it.fujisoft-china.com/app/nlclogin"
    var status:Bool
    let pushId = "iOS:ds_air_jqfsgysqdxrzutuggctr1599718869"

    var dataDic :[String:String] = ["authid":phoneNumber,"password":paswordNumber,"pushid":pushId]
    let headers: HTTPHeaders = [
                "Accept" : "application/json",
                "Authorization" : "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ=="
            ]
    Alamofire.request(url, method: .post, parameters: dataDic, encoding: URLEncoding.httpBody, headers: headers).responseJSON { (response) in
        switch response.result {
                case .success(_):
//取出网络请求的返回值
                  if let value = response.result.value {
                    let json = JSON.init(value)
                    print("百度请求成功\(json)")
                    if json["errreason"].string == "系统异常" {
                        print("百度请求成功\(String(describing: json["errreason"].string))")
                        escaBlock("百度请求成功\(String(describing: json["errreason"].string))")
                     }
                    }
                    break
                case .failure(_):
                    print("百度请求失败")
                    escaBlock("百度请求失败")
                    break
                }
    }
//    Alamofire.request(url).responseJSON { (response) in
//        switch response.result {
//        case .success(_):
//            print("百度请求成功")
//            break
//        case .failure(_):
//            print("百度请求失败")
//            break
//        }
//    }
    return true
}

//创建一个尾随闭包
//public func callBackBloack(phoneNumber:String,paswordNumber:String,@escaping(_ result:caseBlock)->()) -> Void{
//
//}


public let caseBlock = {(str:String,timeValue:Float) ->Bool in
       return true
   }
class LoginVM: NSObject {
    var myBlock : caseBlock4!
    public func login(phone:String,pasword:String) -> Bool{
        print("登录请求")
        self.perform(#selector(update), with: "", afterDelay: 2)

        return caseBlock2 (phone,pasword,myBlock!)
    }
    @objc func update(){
        print("请求成功--刷UI啦")
       ///跳转页面了啊
        //self.myBlock!!("成功")
    }
}
