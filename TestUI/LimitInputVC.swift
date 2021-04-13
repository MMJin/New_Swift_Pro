//
//  LimitInputVC.swift
//  guide_swift
//
//  Created by FCNC05 on 2021/3/25.
//  Copyright © 2021 FCNC05. All rights reserved.
//

import UIKit

class LimitInputVC: UIViewController,UITextViewDelegate {
    var limitTextView : UITextView!
    var allowInputNumberLable:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.initNavBar()
        self.initInputField()
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillChangeFram(note:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
//设置左右按钮
    func initNavBar() {
        let leftItem = UIBarButtonItem(title: "close", style: .plain, target: self, action: #selector(pop))
        self.navigationItem.leftBarButtonItem = leftItem

        let rightItem = UIBarButtonItem(title: "tweet", style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = rightItem
    }
    @objc func pop(){
        self.navigationController?.popViewController(animated: true)
    }
//设置输入框
    func initInputField() {
        //拿到导航栏的宽高
        let nav = self.navigationController?.navigationBar.frame
        //拿到状态栏的宽高4.0 可以拿到 5.0不能拿了
        let actorImageView = UIImageView(frame: CGRect(x: 0, y: (nav?.height)! + 10, width: 60, height: 60))
        actorImageView.image = UIImage.init(named: "AppIcon")
        self.view.addSubview(actorImageView)

        limitTextView = UITextView(frame: CGRect(x: 70, y: actorImageView.frame.height+10, width: MJScreenWidth-60-20, height: 200))
        self.view.addSubview(limitTextView)
        limitTextView.delegate = self
        limitTextView.layer.borderWidth = 1
        limitTextView.layer.borderColor = UIColor.red.cgColor
        limitTextView.font = UIFont.systemFont(ofSize: 15)

        allowInputNumberLable = UILabel(frame: CGRect(x: MJScreenWidth-50, y: self.view.frame.height - 40, width: 50, height: 40))
        self.view .addSubview(allowInputNumberLable)
        allowInputNumberLable.text = "140"
        allowInputNumberLable.textAlignment = .right
    }

    func textViewDidChange(_ textView: UITextView) {
        let currentCount = (textView.text.count)
        if currentCount >= 140 {
            limitTextView.resignFirstResponder()
        }
        allowInputNumberLable.text = "\(140 - currentCount)"
    }

    @objc func keyBoardWillChangeFram(note:Notification){
        guard let duration = note.userInfo?[UIResponder.keyboardDidChangeFrameNotification] as? NSValue else{return}
        let keyboardScreenEndFrame = duration.cgRectValue
        let y = keyboardScreenEndFrame.origin.y

        //计算工具栏距离底部的间距
        let margin = UIScreen.main.bounds.height - y
        UIView.animate(withDuration: 1) {
            if margin > 0 {
                self.allowInputNumberLable.frame.origin.y = self.allowInputNumberLable.frame.origin.y - margin
            }
            else {
                self.allowInputNumberLable.frame.origin.y = self.view.frame.height - 50
            }
        }


    }
}
