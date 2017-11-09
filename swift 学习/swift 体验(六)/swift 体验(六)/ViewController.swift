//
//  ViewController.swift
//  swift 体验(六)
//
//  Created by LiJie on 2017/6/15.
//  Copyright © 2017年 LiJie. All rights reserved.
//

import UIKit

/*<*******************************我是华丽的分割线************************************>*/
//协议扩展
protocol Coder {
    var haveFun: Bool {get }
    var ownMoney: Bool {get }
}

protocol Swifter {
    var codeLevel: Int {get set}
}

//扩展协议
extension Coder where Self:Swifter { //这段代码的意思是在遵守 coder 协议的同时如果遵守 swifter 则默认 haveFun 和 ownMoney 属性默认是 TRUE
    var haveFun: Bool {return true}
    var ownMoney: Bool {return true}
}

/*<*******************************我是华丽的分割线************************************>*/

//协议扩展的补充: 
protocol SharedString {
    func methodForOverride()
    func methodWithoutOverride()
}

extension SharedString {
    func methodForOverride() {
        print("^_^_^")
    }
    func methodWithoutOverride() {
        print("@__@")
        methodForOverride()
        print("@__@")
    }
}

extension String : SharedString { //给 String 类扩展一个协议 
    func methodForOverride() {  //在这里重写了 methodForOverride 方法, 所以上面的笑脸不会再打印
        print(self)
    }
}

/*<*******************************我是华丽的分割线************************************>*/

//声明协议
protocol someProtocol {
    var num : Int {get} //协议中的属性为可读
}

/*<*******************************我是华丽的分割线************************************>*/

//重载操作符
struct IntBox {
    var intValue: Int
}

func ==(lhs: IntBox, rhs: IntBox) -> Bool {
    return lhs.intValue == rhs.intValue //重载运算符必须放在文件的所有函数外, 跟 protrol 的作用域是一样的
}

extension IntBox: Equatable {} //扩展的作用域是空的

/*<*******************************我是华丽的分割线************************************>*/

protocol SeachIntArrayMax {
    
}

/*<*******************************我是华丽的分割线************************************>*/


class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        protocolFunc()
        protocolExtension()
        protocolExtend()
    }
    
//MARK: -  <声明协议>
    /*<
     
     1. 协议的声明关键字是 " protocol " 
     2. 协议的一般格式为 :  protocal 协议: 继承的协议1, 继承的协议2 {
                                var 某个属性: 类型{set, get}
                                func 某个方法(参数列表) -> 返回值类型
                                init 构造器(参数列表)
                              }
     3. 协议也有继承的关系, 如果想要遵守这个协议, 就必须把他继承的协议也全部实现. Swift 中遵守协议的格式和继承父类一样,把需要遵守的协议写在冒号后面, 用逗号隔开
     4. 在协议中加入的属性可以不用实现, 也不限制于是计算属性还是储存属性, 但是必须实现属性的读写权限, 比如 {get,set} 表示可读可写,
     5. 类和结构体, 枚举都可以遵守协议
     6. 如果结构体和枚举遵守的协议方法中有对属性的改动, 就必须在协议中的这个方法前面加 "mutating" 指定为变异方法.
     7. 如果是了遵守了协议中的变异方法和普通的方法无异, 可以在协议的定义中指定某个成员为类型成员, 在成员定义前加上 "static"
     8. 限制协议只和类一起工作也是可行的, 格式如下 :
            protocol 协议: class,继承的协议1, 继承的协议2 {
                var 某个属性: 类型{set, get}
                func 某个方法(参数列表) -> 返回值类型
                init 构造器(参数列表)
            }
     >*/
    
    func protocolFunc() {
        class show: someProtocol { //遵守协议
            var so = 4
            var num: Int {
                get{
                    return so
                }
                set{
                    so = newValue + 3
                }
            }
        }
        let show1 = show()
        show1.num = 12
        print(show1.num,show1.so)  //返回15
    }

//MARK: -  <遵守协议>
    /*<
     1. 一个类只能继承一个父类却可以遵守多个协议
     2. 如果多个协议总是一起出现,我们可以使用 typealias 关键字给多个协议起别名, 并不会生成新的协议, 格式如下 :
     typealias 协议组合别名 = protocol<协议1, 协议2,...>
     class 某个类: 父类, 协议组合别名 { }
     struct 某个结构体: 协议组合别名  { }
     swift 3.0 之后 协议组合的写法 :     typealias 协议组合别名 = 协议1&协议2

     >*/
    
    
//MARK: -  <实现协议>
    /*<
     1. 如果遵守了这个协议, 就必须实现它里面的所有成员, 不然无法通过编译, 枚举也是一样的, 如果类遵守的协议中声明了构造器, 那么遵守协议的类在实现这个构造器的时候必须把构造器声明为 required
     2. 为了代码的整洁,在 UIViewController 中实现代理的协议方式时, 最好做 UIViewController 的扩展方法, 然后再扩展方法中实现协议方法
     >*/
    
//MARK: -  <协议扩展>
    /*<
     1. 协议的扩展可以保持遵守者某些属性的一致性,  当协议中的属性在多个遵守者中的赋值都一样时, 可以在协议的扩展中给该属性赋值, 在其他遵守该协议的类中不需再去实现.
     2. 在where 的作用是限定协议扩展的有效的条件, 在 where 语句中,你可以使用 Self 关键字来代表协议的遵守者.
     3. 在扩展协议中不能定义储存属性
     4. Swift 中的一些特殊的协议, 例如: 重载符: '=='
     5. 在 Swift 中用扩展的方式让类或者结构体遵守 Equatable 协议变可以实现 '==' '!=' 操作
     >*/
    // 判断两个实例的值

    func protocolExtension() {
        //公司三个程序员用 struct 表示
        struct CoderA: Coder { //不是 swift 开发者,所以不用遵守 swifter 协议
            var name: String
            var haveFun: Bool
            var ownMoney: Bool
        }
        
        struct CoderB: Coder,Swifter {
            var name: String
//            var haveFun = true
//            var ownMoney = true
            var codeLevel = 3
        }
        
        struct CoderC: Coder,Swifter {
            var name: String
//            var haveFun = true   //TODO:此处应该不用是实现的, 但有问题, 所以此处问题后续解决,  问题原因: 因为在 Coder 协议扩展中只用到了 haveFun 的 get 方法,而在 Coder 协议中却实现了 get set ,所以删除 set 方法就解决问题了.
//            var ownMoney = true
            var codeLevel = 5
        }
        
        let box1 = IntBox(intValue: 10)
        let box2 = IntBox(intValue: 13)
        print(box1 == box2)   //此操作在没有重载 '==' 操作符的时候是不允许的,但重载后 '==' 是一个函数
        print(box1 != box2)
    }
    
//MARK: -  <协议扩展的补充>
    func protocolExtend() {
        let string : String = "hello"
        string.methodWithoutOverride()
//        string.methodForOverride()
        
        let hello: SharedString = "hello"
        hello.methodForOverride()
        hello.methodWithoutOverride()
    }
    
//MARK: -  <协议继承>

    /*<
     1. 协议继承的目的还是为了优化代码, 去除冗余代码
     2. Swift 也不支持多继承
     >*/
    
}

