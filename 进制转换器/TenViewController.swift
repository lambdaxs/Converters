//
//  FirstViewController.swift
//  进制转换器
//
//  Created by xiaos on 15/6/9.
//  Copyright (c) 2015年 xiaos. All rights reserved.
//

import UIKit

class TenViewController: UIViewController ,UITextFieldDelegate{

    
    @IBOutlet weak var detailBtn: UIButton!
    @IBOutlet weak var inputNum: UITextField!
    @IBOutlet weak var two: UILabel!
    @IBOutlet weak var eight: UILabel!
    @IBOutlet weak var sexTeen: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //点击键盘以外任意区域，收回键盘
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        inputNum.resignFirstResponder()
    }
    
    //转换按钮
    @IBAction func turnTapped(sender: AnyObject) {
        let mySet:Set<String> = ["1","2","3","4","5","6","7","8","9","0"]
        var number = inputNum.text
        //对各种可能的非法输入做出规避
        for i in number {
            if mySet.contains(String(i)) {
                continue
            }else {
                let ErrorAlert = UIAlertView(title: "输入异常", message: "请输入0~9", delegate: nil, cancelButtonTitle: "OK")
                ErrorAlert.show()
                number = ""
                break
            }
        }
        
        //若输入框为空或为0时，置空label
        if (number == "" || number.toInt() == 0) {
            eight.text = " "
            two.text = " "
            sexTeen.text = " "
        }else {
            if let tenNum = number.toInt() {
                //创建一个单例对象调用转换方法
                let shareManager = TurnNum.shareManager()
                two.text = shareManager.getNumResult(tenNum, sys: 2)
                eight.text = shareManager.getNumResult(tenNum, sys: 8)
                sexTeen.text = shareManager.getNumResult(tenNum, sys: 16)
                detailBtn.hidden = false
            }else {
                let ErrorAlert = UIAlertView(title: "输入数字太大", message: "本工具生气了！", delegate: nil, cancelButtonTitle: "OK")
                ErrorAlert.show()
            }
        }
    }

    //当二进制位数过长，用alert框显示
    @IBAction func showDetail(sender: AnyObject) {
        let shareManager = TurnNum.shareManager()
        let number = inputNum.text.toInt()
        if let myNum = number {
            let message = shareManager.getNumResult(myNum, sys: 2)
            let message1 = message + "(\(count(message)))"
            let showDetailAlert = UIAlertView(title: "二进制", message: message1, delegate: nil, cancelButtonTitle: "OK")
            showDetailAlert.show()
        }else {
            let noDataAlert = UIAlertView(title: "没有输入数据", message: " ", delegate: nil, cancelButtonTitle: "OK")
            noDataAlert.show()
            detailBtn.hidden = true
        }
        
        
    }
    
}


