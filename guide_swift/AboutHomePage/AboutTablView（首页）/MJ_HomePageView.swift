//
//  MJ_HomePageView.swift
//  guide_swift
//
//  Created by FCNC05 on 2020/8/11.
//  Copyright © 2020 FCNC05. All rights reserved.
//

import UIKit

class MJ_HomePageView: UIView,UITableViewDelegate,UITableViewDataSource{

    let loginV_frame = CGRect.init(x: 0, y: 0, width: MJScreenWidth, height: MJScreenHeight)
    init(){
        super.init(frame: loginV_frame)
        self.backgroundColor = UIColor.red
        self .setUI()

    }
    func setUI() {
        // 轮播图 高80
        self .setBanner()
        // 表显示 MJScreenHeight-64-80
        self .settabbleView()
        //自定义cell

    }
    func setBanner(){

    }
    func settabbleView(){
        let showTableView = UITableView(frame: CGRect(x: 0, y: 64+160, width: MJScreenWidth, height: MJScreenHeight-64-160), style: .plain)
        showTableView.register(MJ_HomePageTabCell.self, forCellReuseIdentifier: "cell")
        showTableView.delegate = self
        showTableView.dataSource = self
        self .addSubview(showTableView)

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//
//    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellStr = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellStr) as! MJ_HomePageTabCell
        //cell?.textLabel?.text = "我的第一个界面啥的"
        cell.headerShowImage.image = UIImage(named: "tab_home_S")
        cell.titleLable.text = "RE:从零开始的异世界生活"
        cell.isClassLable.text = "动漫"
        cell.outhlable.text = "上条"
        cell.backgroundColor = UIColor.gray
        cell.showSomeData(title: "RE:从零开始的异世界生活")
       //print(cell?.showSomeData(title: "动漫") ?? "")
        return cell

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("点击了什么啊" + "\(indexPath.row)")
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
       print("上一次点击了什么啊" + "\(indexPath.row)")
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    deinit {
        print("deinit")
    }
}
