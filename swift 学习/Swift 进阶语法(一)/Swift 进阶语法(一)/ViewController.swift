//
//  ViewController.swift
//  Swift 进阶语法(一)
//
//  Created by LiJie on 2017/6/23.
//  Copyright © 2017年 LiJie. All rights reserved.
//

import UIKit

enum errorCode : Error {
    case NoStudent
    case NoAge
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try track(code: "xm")
        } catch errorCode.NoStudent {
            print("没有此学生记录")
        } catch errorCode.NoAge {
            print("没有年龄记录")
        }

//
//        do {
//            try track(code: "xm")
//        } catch  {
//            print(error)
//        }
        // Do any additional setup after loading the view, typically from a nib.
        let resultString: String? = example(name: "老王") //可选的
        let list = "查找结果"
        
        //为了安全起见在这里在这里需要判断 resultString 不为 nil 再进行解包
        if (resultString != nil) {
            let message = list + resultString! //编译期出错,而不是在运行时, 需要强制解包
            print(message)
        } else {
            let message = list + "没有找到此人" //编译期出错,而不是在运行时, 需要强制解包
            print(message)
        }
        
        bindingOptionalFunc()
        
        
        //计算小王到18岁还有几年
        if let student = example(code: "xw") {
            if let age = student.age {
                let age1 = 18 - age
                print("\(student.name!)还有\(age1)就18岁了")
            }
        } else {
            print("此人身份查验错误")
        }
        
        //简化计算小王到18岁
        if let age = example(code: "xw")?.age {
            let years = 18 - age
            print(years)
        }
    }
    
    //MARK: -  <可选型>
    /*<
     1. 可选型在变量中, 可选型的默认值是 nil 如果给一个非可选型的变量赋值 nil 会报错.
     2. 当类中的属性没有全部初始化的时候会报错, 但如果在属性后面加"?"可以不初始化, 默认值是nil
     3. 在 Swift 中使用 "?" 来表示可选型的变量,
     4 .可选型表示 Swift 是安全的语言, 可以在编译时去检查某些错误
     >*/
    
    func OptionalFunc() {
        var message = "这不是可选型"
        //        message = nil  报错
        class Message {
            var message1 = "小刘" //属性被初始化
            //        var message2: String //属性没有初始化, 会报错
        }
        
        class Message2 {
            var message1 = "小邓" //属性被初始化
            var message2: String?//属性为可选型, 通过编译
        }
    }
    
    //MARK: -  <解包可选型>
    func example(name: String) -> String? { //必须在这里指定返回值为 可选型, 否则 String 类型不能指定为 nil
        if (name == "小明") {
            return "找到了小明"
        }else if(name == "小刚") {
            return "找到了小刚"
        } else{
            return nil
        }
    }
    
    //MARK: -  <可选绑定>
    /*<
     1. 可选绑定实现了两个步骤: 解包和拷贝
     >*/
    func bindingOptionalFunc() {
        let resultString: String? = example(name: "小张")
        let list = "查找结果: "
        if let tempResult = resultString { //在 resultString 不为 nil 时 才会赋值给 tempResult 执行 {} 里面的方法, tempResult 是一个新的常量, 所以不用强制解包
            let message = list + tempResult
            print(message)
        } else {
            let message = list + "没有找到此人"
            print(message)
        }
        
        //简化写法
        if let resultString = example(name: "hahah") {
            let message = list + resultString
            print(message)
        }else {
            let message = list + "没有找到此人"
            print(message)
        }
        
        //如果你需要一个解包后的变量拷贝的 话 ,可以使用 if - var 的语法
        let firstStr: String? = "hello"
        let secondStr: String? = " world"
        if var fs = firstStr, let ss = secondStr { //此语法只能用在可选型中
            print(fs + ss)
            fs = "hi"
            print(fs + ss)
        }
    }
    
    //MARK: -  <可选链>
    /*<
     1 .可选连中的某个部分是空值,则可选连就会断掉, 如果可选连的末尾是一个方法, 这个方法不会再调用
     2 .
     >*/
    class Student {
        var name: String? //属性不初始化必须是可选型
        var age: Int?
    }
    
    func example(code: String) -> Student? { //需求需要这里的返回值必须是可选型的
        if (code == "xm") {
            let xiaoming = Student()
            xiaoming.name = "小明"
            xiaoming.age = 20
            return xiaoming
        }else if(code == "xw") {
            let xiaowang = Student()
            xiaowang.name = "小王"
            xiaowang.age = 16
            return xiaowang
        }else {
            return nil
        }
    }
    
    //MARK: -  <可选型中的 map 和 flatMap>
    //TODO: 这里没搞懂________
    
    /*<
     1. 当确定需要返回一个可选型, 并且希望可选型不为空时, 对可选型的值做某些处理后再返回, 可以选用 map
     2. map的定义 : public func <U>(@noescape f: (Wrapped) throws ->U) rethows-> U?
     3.
     >*/
    func mapOptional() {
        let student = Student()
        student.age = 1029
        student.name = "妖"
    }
    
    //MARK: -  <Swift 中的错误处理>
    /*<
     1. 在返回类型前面加上 throws , 方法定义中使用 throws ,如果参数列列表中的参数会抛出错误, 则参数中使用 throws ,  方法定义中室友 rethrows 参数.
     
     2. throw 也是一种终止, 所以在 guard let else 结构的 {}中可以不使用 break 和 return语句
     >*/
    func track (code : String) throws {
        guard let student = example(code: code) else {
            throw errorCode.NoStudent
        }
        guard let age = student.age else {
            throw errorCode.NoAge
        }
        print("找到年龄了")
    }
    
}

