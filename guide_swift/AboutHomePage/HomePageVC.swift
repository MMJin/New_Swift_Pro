//
//  HomePageVC.swift
//  guide_swift
//
//  Created by FCNC05 on 2020/8/11.
//  Copyright © 2020 FCNC05. All rights reserved.
//

import UIKit

class HomePageVC: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //navigationController?.navigationBar.barStyle =
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self .setUIWithTittle(tittle: self.title ?? "")
        ///下面这些应该是放在ViewModel中处理
//        DispatchQueue.global(qos: .utility).async { [weak self] in
//            //这边做网络请求
//            DispatchQueue.main.async {
//                //做UI刷新
//                self?.title = "🧚‍♀️的尾巴"
//            }
//
//        }
//        let threadQ = OperationQueue()
//        threadQ.maxConcurrentOperationCount = 2
//        threadQ.addOperation {
//             print(Thread.current)
//             self.sum()
//        }
   }
   ///创建swift的长驻线程
//    func createThreadOne(){
//        let newThread = Thread.init(target: self, selector: #selector(thread1), object: nil)
//        newThread.name = "哈比线程"
//        newThread.start()
//    }
//    @objc func thread1(){
//        print("线程1")
//        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { (timer) in
//            print(Thread.current)
//        }
//        RunLoop.current.add(Port(), forMode: .common)
//        RunLoop.current.run()
//    }
//    func sum(){
//        var i = 0
//        while i != 10 {
//            print("hahhahaha" + "\(i)")
//            i+=1
//        }
//        do{
//            i = 0
//            print("heheheh" + "\(i)")
//        }
//        let con = NSCondition()
//        con.lock()
//        con.wait()
//        con.signal()
//        con.unlock()
//
//    }

    func setUIWithTittle(tittle:String) {
        if tittle == "首页"{
            self .setItem()
            self.view .addSubview(MJ_HomePageView())
        }
        else if tittle == "分类"{
            self.view .addSubview(MJ_ClassView())
        }
        else if tittle == "书架"{
            self.view .addSubview(MJ_BookRackView())
        }
        else if tittle == "我的"{
            self.view .addSubview(MJ_MineView())
        }
    }

    //MARK: - 首页相关
    func setItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchSomething))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.white

    }
    @objc func searchSomething(){
         print("跳转到搜索控制器")
    }

}
