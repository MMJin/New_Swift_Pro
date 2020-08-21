//
//  HomePageVC.swift
//  guide_swift
//
//  Created by FCNC05 on 2020/8/11.
//  Copyright © 2020 FCNC05. All rights reserved.
//

import UIKit

class HomePageVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        ///下面这些应该是放在ViewModel中处理
        DispatchQueue.global(qos: .utility).async { [weak self] in
            //这边做网络请求
            DispatchQueue.main.async {
                //做UI刷新
                self?.title = "🧚‍♀️的尾巴"
            }

        }
        let threadQ = OperationQueue()
        threadQ.addOperation {
           self.createThreadOne()
        }

    }
   ///创建swift的长驻线程
    func createThreadOne(){
        let newThread = Thread.init(target: self, selector: #selector(thread1), object: nil)
        newThread.name = "哈比线程"
        newThread.start()
    }
    @objc func thread1(){
        print("线程1")
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { (timer) in
            print(Thread.current)
        }
        RunLoop.current.add(Port(), forMode: .common)
        RunLoop.current.run()
    }
}
