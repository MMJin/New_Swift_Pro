//
//  PullToRefreshVC.swift
//  guide_swift
//
//  Created by FCNC05 on 2021/3/30.
//  Copyright © 2021 FCNC05. All rights reserved.
//

import UIKit

class PullToRefreshVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var tableView = UITableView()
    var dataSource = Array<Date>()
    let refresh =  UIRefreshControl()



    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell") as UITableViewCell
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy年MM月dd日/HH时mm分ss秒"
        let dateStr = dateFormatter.string(from: dataSource[indexPath.row])

        cell.textLabel?.text = dateStr
            return cell


    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerV = UIView(frame: CGRect(x: 0, y: 0, width: MJScreenWidth, height: 40))
        headerV.backgroundColor = UIColor.red
        headerV.addSubview(refresh)
        return headerV
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: self.view.bounds)
        tableView.frame.origin.y = 44
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        dataSource.insert(NSDate() as Date, at: 0)
        refresh.attributedTitle = NSAttributedString(string: "拉什么啦，再拉朕就要碎了！")
        refresh.addTarget(self, action: #selector(pullRefresh), for: .valueChanged)
        tableView.addSubview(refresh)
        //tableView.tableHeaderView?.addSubview(refresh)
        tableView.reloadData()

    }
    @objc func pullRefresh() {
        dataSource.insert(NSDate() as Date, at: 0)
        refresh.endRefreshing()
        tableView.reloadData()
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
