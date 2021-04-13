//
//  TestUIListVC.swift
//  guide_swift
//
//  Created by FCNC05 on 2021/3/25.
//  Copyright © 2021 FCNC05. All rights reserved.
//

import UIKit

class TestUIListVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var dataSource : [String] = ["第一天","第二天","第三天"]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView .dequeueReusableCell(withIdentifier: "cell")
        if (cell == nil){
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        cell?.detailTextLabel?.text = self.dataSource[indexPath.row]

        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let fontVc = AboutFont()
            self.navigationController?.pushViewController(fontVc, animated: true)
            break
        case 1:
            let limitVc = LimitInputVC()
            self.navigationController?.pushViewController(limitVc, animated: true)
            break
        case 2:
            let pullRefresh = PullToRefreshVC()
            self.navigationController?.pushViewController(pullRefresh, animated: true)
            break

        default:
            "异常"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //设置当前页面的背景颜色
        self.view.backgroundColor = UIColor.white
        self.title = "练习"

        let testListView = UITableView(frame: CGRect(x: 0, y: 0, width: MJScreenWidth, height: MJScreenHeight), style: .plain)
        testListView.delegate = self
        testListView.dataSource = self
        testListView.rowHeight = 60
        self.view .addSubview(testListView)

    }

}
