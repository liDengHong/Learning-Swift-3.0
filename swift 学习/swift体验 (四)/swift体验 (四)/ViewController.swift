//
//  ViewController.swift
//  swift体验 (四)
//
//  Created by LiJie on 2017/6/13.
//  Copyright © 2017年 LiJie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.classStudy()
        self.structStudy()
    }
    
    //MARK: -  <类的定义>
    func classStudy() {
        //定义一个类
        class StudentClass {
            var name : String = "小明"
            var age : Int = 0
        }
        let student = StudentClass()
        student.name = "小刘"
        print(student.name,student.age)
    }
    
    //MARK: -  <结构体>
    func structStudy() {
        //创建结构体
        struct StudentStruct {
            var name = "结构体"
            var age = 100
        }
        let student = StudentStruct()
        print(student.name,student.age)
    }
    
    //MARK: -  <属性>
    func propertyStudy() {
        //创建类 ,
        class preopertyClass {
            var name :String? //swift 中属性必须初始化, 如果没有初始值, 可注明为可选类型.
            lazy var age :Int = 30   //懒加载, 只有用 var 定义的属性才能够用 lazy 进行懒加载
            var allInfo : String {  //allInfo 是一个计算属性
                get { //allInfo 属性的 get 方法
                    return name!//在这里要对 name 进行强制解包
                }
            }
            
        }
        
        //创建类的实例
        let studentClass = preopertyClass()
        //使用点语法访问属性
        studentClass.name = "小明"
        studentClass.age = 100
        //        studentClass.allInfo = "xsxsxs" //此时会报错, 因为 allInfo 属性只实现了 get 方法
    }
    
    //MARK: -  <sizeof的用法>
    func sizeStudy() {
        struct structTest {
            var name:String = ""
            var age:Int = 20
        }
    }
    
    //MARK: -  <类型属性>
    func kindPropertyStudy() {
        class kindProperty {
         static var name = "车" // 类型属性 用关键字 static 修饰, 类型属性可以包括储存属性和计算属性
        }
    }
}



