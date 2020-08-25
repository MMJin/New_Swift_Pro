//
//  HomepageTab_VC.swift
//  guide_swift
//
//  Created by FCNC05 on 2020/8/24.
//  Copyright © 2020 FCNC05. All rights reserved.
//

import UIKit

class HomepageTab_VC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.barTintColor = .red
        self.tabBar.isTranslucent = false//解决tableview edge。0 时多了一个tabbar高度的bug，

        self .setChildViewController()

    }
    func setChildViewController(){
        let bookPageVc = HomePageVC()
        self.addChildVC(childVc: bookPageVc, childTitle:  "首页", image_n: "tab_home", image_s: "tab_home_S")

        let bookPageVc2 = HomePageVC()
        self.addChildVC(childVc: bookPageVc2, childTitle:  "分类", image_n: "tab_class", image_s: "tab_class_S")

        let bookPageVc3 = HomePageVC()
        self.addChildVC(childVc: bookPageVc3, childTitle:  "书架", image_n: "tab_book", image_s: "tab_book_S")

        let bookPageVc4 = HomePageVC()
        self.addChildVC(childVc: bookPageVc4, childTitle:  "我的", image_n: "tab_mine", image_s: "tab_mine_S")

    }
    func addChildVC(childVc:UIViewController,childTitle:String,image_n:String,image_s:String){
        childVc.title = childTitle
        childVc.view.backgroundColor = UIColor.white
        childVc.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: image_n)?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: image_s)?.withRenderingMode(.alwaysOriginal))

        if UIDevice.current.userInterfaceIdiom == .phone {
            childVc.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }
        addChild(UINavigationController(rootViewController: childVc))
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
