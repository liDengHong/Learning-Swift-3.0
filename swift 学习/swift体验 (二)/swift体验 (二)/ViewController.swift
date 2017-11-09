//
//  ViewController.swift
//  swift体验 (二)
//
//  Created by LiJie on 2017/5/31.
//  Copyright © 2017年 LiJie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let showPlus:(Int, Int) -> Int = someFunction(op: "*")
        print(showPlus(3,4))
        
        let showMult:(Int,Int) -> Int = someFunction1(op: "*")
        print(showMult(12,5))
    }
    
    //MARK: -  <闭包>
    //运算函数
    func someFunction(op: String) -> (Int, Int) ->Int {  //此函数的返回值也是一个函数
        
        func plus(a: Int,b: Int) -> Int {           //加法函数
            return a + b
        }
        func mult(a: Int,b: Int) -> Int {           //乘法函数
            return a * b
        }
        var result : (Int,Int) -> Int    // 匹配返回值函数
        
        switch (op) {      //根据传入的参数来确定返回值
        case "+":
            result = plus(a:b:)
        default:
            result = mult(a:b:)
        }
        return result
    }
    
    //闭包替代函数嵌套
    func someFunction1(op: String) -> (Int,Int) -> Int {
        var result :(Int,Int) -> Int
        switch (op) {
        case "+":
//            result = { (a: Int,b: Int) -> Int in
//                return a + b
//            }
            result = {(a,b) in return a+b}  //由于 swift 的类型推断特性, 所以在闭包中的参数类型和返回值类型可以省略
        default:
//            result = { (a: Int,b: Int) -> Int in
//                return a * b
//            }
//            result = {(a,b) in a+b}   //如果在闭包中只有一条语句, return 也可以省略
            result  = {$0 + $1}
        }
        return result
    }
    
    /*
     
     闭包的基本类型 : 
     { (参数列表) -> 返回值类型 in
     执行语句
     }
     
     */
    
    //如果函数中的最后一个参数是闭包, 可以写在参数括号的外边,称为尾随闭包
//    example(parameter1 : String,parameter2 : String) {$0 + $1}

}

