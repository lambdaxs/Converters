//
//  EightViewController.swift
//  进制转换器
//
//  Created by xiaos on 15/6/11.
//  Copyright (c) 2015年 xiaos. All rights reserved.
//

import UIKit

class EightViewController: UIViewController {

    @IBOutlet weak var inputNum: UITextField!
    @IBOutlet weak var two: UILabel!
    @IBOutlet weak var ten: UILabel!
    @IBOutlet weak var sexTeen: UILabel!
    @IBOutlet weak var showDetailBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //点击键盘以外任意区域，收回键盘
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        inputNum.resignFirstResponder()
    }
    
    //二进制详细显示
    @IBAction func showDetail(sender: AnyObject) {
        let shareManager = TurnNum.shareManager()
        let number = inputNum.text
        let tenNum = shareManager.getTenNum(number, system: 8)
        
        if (number == "") {
            let noDataAlert = UIAlertView(title: "没有输入数据", message: " ", delegate: nil, cancelButtonTitle: "OK")
            noDataAlert.show()
            showDetailBtn.hidden = true
        }else{
            let message = shareManager.getNumResult(tenNum, sys: 2)
            let message1 = message + "(\(count(message)))"
            let showDetailAlert = UIAlertView(title: "二进制", message: message1, delegate: nil, cancelButtonTitle: "OK")
            showDetailAlert.show()
        }
    }
    
    //转换按钮
    @IBAction func turnTapped(sender: AnyObject) {
        var number = inputNum.text
        let mySet:Set<String> = ["0","1","2","3","4","5","6","7"]
        
        //对各种可能的非法输入做出规避
        for i in number {
            if mySet.contains(String(i)) {
                continue
            }else {
                let ErrorAlert = UIAlertView(title: "输入异常", message: "请输入0~7", delegate: nil, cancelButtonTitle: "OK")
                ErrorAlert.show()
                number = ""
                break
            }
        }
        if (number == "" || number.toInt() == 0) {
            ten.text = " "
            two.text = " "
            sexTeen.text = " "
        }else {
            let shareManager = TurnNum.shareManager()
            let tenNum = shareManager.getTenNum(number, system: 8)
            if tenNum == Int.max - 1 {
                let ErrorAlert = UIAlertView(title: "输入数字太大", message: "本工具生气了！", delegate: nil, cancelButtonTitle: "OK")
                ErrorAlert.show()
            }else {
                ten.text = String(tenNum)
                two.text = shareManager.getNumResult(tenNum, sys: 2)
                sexTeen.text = shareManager.getNumResult(tenNum, sys: 16)
                showDetailBtn.hidden = false
            }
            
        }
        
    }

}


