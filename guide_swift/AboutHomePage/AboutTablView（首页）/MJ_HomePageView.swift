//
//  MJ_HomePageView.swift
//  guide_swift
//
//  Created by FCNC05 on 2020/8/11.
//  Copyright © 2020 FCNC05. All rights reserved.
//

import UIKit

class MJ_HomePageView: UIView,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate{
    var imageArr : [String]!
    var bannerScro : UIScrollView!
    var pageV : UIPageControl!


    let loginV_frame = CGRect.init(x: 0, y: 0, width: MJScreenWidth, height: MJScreenHeight)
    init(){
        super.init(frame: loginV_frame)
        imageArr = ["banner_1","banner_2","banner_3","banner_4"]
        self.backgroundColor = UIColor.red
        self .setUI()

    }
    func setUI() {
        // 轮播图 高80
        self .setBanner()
        // 表显示 MJScreenHeight-64-160
        self .settabbleView()
        //自定义cell
    }
    func setBanner(){
        bannerScro = UIScrollView()
        bannerScro.frame = CGRect(x: 0, y: 64, width: MJScreenWidth, height: 160)
        bannerScro.contentSize = CGSize(width:  Int(MJScreenWidth)*imageArr.count, height: 160)
        bannerScro.showsVerticalScrollIndicator = false
        //分页拖拽
        bannerScro.isPagingEnabled = true
        bannerScro.delegate = self
        self .addSubview(bannerScro)
        //布局显示图片
        for  i in 0..<imageArr.count {
            let bannerIamge = UIImageView()
            bannerIamge.frame = CGRect(x: 0+CGFloat(i)*MJScreenWidth, y: 0, width: MJScreenWidth, height: 160)
            bannerIamge.image = UIImage(named: imageArr[i])
            bannerScro .addSubview(bannerIamge)
        }
        //分页控制器
        pageV = UIPageControl()
        pageV.frame = CGRect(x:0, y: 130 + 64, width: MJScreenWidth, height: 30)
        pageV .addTarget(self, action: #selector(clickPage(pageC:)), for: .touchUpInside)
        self .addSubview(pageV)
        pageV.numberOfPages = imageArr.count
        pageV.currentPage = 0

        //添加定时器
        var number = 0
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { (timer) in
            number += 1
            if number == 4{
                number = 0
            }
            self.bannerScro.contentOffset = CGPoint(x: CGFloat(number) * MJScreenWidth,y: self.bannerScro.contentOffset.y)
            self.pageV.currentPage = number
        }
//        RunLoop.current.add(Port(), forMode: .common)
//        RunLoop.current.run()
    }
    //scr 代理
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("拖拽结束")
        let index : Int!
        index = Int(scrollView.contentOffset.x/MJScreenWidth)
        pageV.currentPage = index
    }
    //MARK: - 中间表显示 start*********************************************************************//////////////
    func settabbleView(){
        let showTableView = UITableView(frame: CGRect(x: 0, y: 64+160, width: MJScreenWidth, height: MJScreenHeight - 64 - 160 - 44), style: .plain)
        showTableView.register(MJ_HomePageTabCell.self, forCellReuseIdentifier: "cell")
        showTableView.separatorStyle = .none
        showTableView.delegate = self
        showTableView.dataSource = self
        self .addSubview(showTableView)

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellStr = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellStr) as! MJ_HomePageTabCell
        cell.headerShowImage.image = UIImage(named: "header")
        cell.titleLable.text = "RE:从零开始的异世界生活"
        cell.isClassLable.text = "动漫"
        cell.outhlable.text = "上条"
        cell.showSomeData(title: "RE:从零开始的异世界生活")
        cell.contentlable.text = "《Re：从零开始的异世界生活》是轻小说家长月达平著作，插画家大冢真一郎负责插画，MF文库J所属的轻小说。"
        cell.levImage.image = UIImage(named: "Vip")
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("点击了什么啊" + "\(indexPath.row)")
        //这边点击要发送请求了 等结果处理UI的刷新
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("上一次点击了什么啊" + "\(indexPath.row)")
    }
    ///需要一个开放的方法 更新UI 需要模型 无返回值
    open func updataUI(){

    }
    //MARK: - 中间表显示 end*********************************************************************\\\\\\\\\\\\\\\\\

    //MARK: - objc的点击方法等 start*********************************************************************//////////////
    @objc func clickPage(pageC:UIPageControl){
        print("page点击有效" + "\(pageC.currentPage)")
        bannerScro.contentOffset = CGPoint(x: CGFloat(pageC.currentPage) * MJScreenWidth, y: bannerScro.contentOffset.y)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    deinit {
        print("deinit")
    }
}
