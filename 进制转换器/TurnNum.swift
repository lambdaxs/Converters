//
//  TurnNum.swift
//  进制转换器
//
//  Created by xiaos on 15/6/14.
//  Copyright (c) 2015年 xiaos. All rights reserved.
//

import UIKit

class TurnNum: NSObject {
   
    
    //创建单例模式，在多处调用时保持性能
    struct Params {
        //static是关键所在，保持这块类存中的值一直是第一次创建时对象的状态
        static var p1:TurnNum? = nil
    }
    class func shareManager() -> TurnNum{
        if (Params.p1 == nil){
            Params.p1 = TurnNum()
        }
        return Params.p1!
    }
    
    //将任意 数字字符串 转换成指定进制的十进制数
    func getTenNum(brinay:String,system:Int) -> Int {
        var sum = 0
        var list = [Character]()
        for i in brinay {
            list.append(i)
        }
        for (var i=0;i<list.count;i++) {
            if (sum >= (Int.max/system)) {
                sum = Int.max - 1
                return sum
            }
            sum = sum*system + String(list[i]).toInt()!
        }
        return sum
        
    }
    
    //可转换二、八、十六进制，传入十进制数和进制参数，返回转换后的字符串
    func getNumResult(var num:Int,sys system:Int) -> String {
        var result = ""
        if (system == 16){
            var yu = ""
            while num != 0 {
                yu = String(num % system)
                switch yu{
                case "10":
                    yu = "A"
                case "11":
                    yu = "B"
                case "12":
                    yu = "C"
                case "13":
                    yu = "D"
                case "14":
                    yu = "E"
                case "15":
                    yu = "F"
                default:
                    break
                }
                result = yu + result
                num /= system
            }
            
        }else {
            while num != 0 {
                result = String(num % system) + result
                num /= system
            }
            
        }
        return result
    }

}
