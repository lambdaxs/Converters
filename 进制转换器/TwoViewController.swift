//
//  SecondViewController.swift
//  进制转换器
//
//  Created by xiaos on 15/6/9.
//  Copyright (c) 2015年 xiaos. All rights reserved.
//

import UIKit

class TwoViewController: UIViewController {

    
    @IBOutlet weak var inputNum: UITextField!
    @IBOutlet weak var eight: UILabel!
    @IBOutlet weak var ten: UILabel!
    @IBOutlet weak var sexTeen: UILabel!
    
    
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

    
    //转换按钮
    @IBAction func turnTapped(sender: AnyObject) {
        var number = inputNum.text
        
        //对各种可能的非法输入做出规避
        for i in number {
            if (i == "0" || i == "1"){continue}
            else{
                let ErrorAlert = UIAlertView(title: "输入异常", message: "请输入0或1", delegate: nil, cancelButtonTitle: "OK")
                ErrorAlert.show()
                number = ""
                break
            }
        }
        if (number == "" || number.toInt() == 0) {
            ten.text = " "
            eight.text = " "
            sexTeen.text = " "
        }else {
            let shareManager = TurnNum.shareManager()
            let tenNum = shareManager.getTenNum(number, system: 2)
            if tenNum == Int.max - 1 {
                let ErrorAlert = UIAlertView(title: "输入数字太大", message: "本工具生气了！", delegate: nil, cancelButtonTitle: "OK")
                ErrorAlert.show()
            }else {
                ten.text = String(tenNum)
                eight.text = shareManager.getNumResult(tenNum, sys: 8)
                sexTeen.text = shareManager.getNumResult(tenNum, sys: 16)
            }
            
            
        }
        
    }

}



