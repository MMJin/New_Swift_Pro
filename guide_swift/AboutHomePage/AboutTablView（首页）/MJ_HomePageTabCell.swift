//
//  MJ_HomePageTabCell.swift
//  guide_swift
//
//  Created by FCNC05 on 2020/8/25.
//  Copyright © 2020 FCNC05. All rights reserved.
//

import UIKit

class MJ_HomePageTabCell: UITableViewCell {
    ///显示图片
    var headerShowImage : UIImageView!
    ///标题
    var titleLable : UILabel!
    ///类型
    var isClassLable : UILabel!
    ///作者
    var outhlable : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self .setUI()
    }
    func setUI(){
        print("进来了")
        headerShowImage = UIImageView()
        headerShowImage!.frame = CGRect(x: 20, y: 10, width: 50, height: 50)
        headerShowImage!.backgroundColor = .green
        self .addSubview(headerShowImage!)

        titleLable = UILabel()
        titleLable.backgroundColor = .cyan
        self .addSubview(titleLable!)
        titleLable.snp_makeConstraints { (make) in
            make.top.equalTo(headerShowImage.snp_top).offset(0)
            make.left.equalTo(headerShowImage.snp_right).offset(10)
            make.width.equalTo(200)
            make.height.equalTo(20)
        }

        isClassLable = UILabel()
        isClassLable.textAlignment = .center
        self .addSubview(isClassLable!)
        isClassLable.snp_makeConstraints({ (make) in
            make.top.equalTo(titleLable.snp_bottom).offset(5)
            make.left.equalTo(titleLable.snp_left).offset(0)
            make.width.equalTo(40)
            make.height.equalTo(15)
        })

        let line = UILabel()
        line.backgroundColor = .white
        self .addSubview(line)
        line.snp_makeConstraints({ (make) in
            make.top.equalTo(titleLable.snp_bottom).offset(5)
            make.left.equalTo(isClassLable.snp_right).offset(1)
            make.width.equalTo(1)
            make.height.equalTo(15)
        })

        outhlable = UILabel()
        outhlable.textAlignment = .center
        self .addSubview(outhlable!)
        outhlable.snp_makeConstraints({ (make) in
            make.top.equalTo(titleLable.snp_bottom).offset(5)
            make.left.equalTo(isClassLable.snp_right).offset(3)
            make.width.equalTo(40)
            make.height.equalTo(15)
        })

    }
     func showSomeData(title : String){

        titleLable.text = title

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
