//
//  ViewController.swift
//  swift 体验(七)
//
//  Created by LiJie on 2017/6/21.
//  Copyright © 2017年 LiJie. All rights reserved.
//

import UIKit

protocol SomeProtocol {
    associatedtype Element
    func elementMethod1(element: Element)
    func elementMethod2(element: Element)
}

protocol CanCompare {
    func isBigger(other: Self) -> Bool
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        show3(pera: "xiaoming")
        show3(pera: 3)
        show3(pera: 2.0)
        show4(pera1: "小刘", pera2: "小张", pera3: "小曹") // 此处如果参数类型不一致会报错
        let test = TestStruct()
        test.elementMethod1(element: "12123")
        print(BoxInt(intValue: 5).isBigger(other: BoxInt(intValue: 7)))
        
        let test1 = TestStruct2<Int>()
        test1.elementMethod1(element: 4546)
        
        let test2 = TestStruct3()
        test2.elementMethod1(element: "XIAOMING")
        test2.elementMethod1(element: 3)
    
        
        
    }
    
    //MARK: -  <节点泛型>
    /*<
     1. 泛型可以写出灵活的, 可重用的代码
     2. 泛型的好处是可以把参数类型不同, 实现功能相似的函数携程一个函数, 使用泛型做参数
     3. 泛型函数就是使用泛型做参数的函数
     4. 节点类型函数点代表在定义函数时不代表任何的具体类型,在函数调用时会根据传入的实际类型来指定自身的类型
     5. 如果函数列表中只有一个 P 但每个节点的参数的类型必须是相同的
     6. 需要定义多个不同类型的泛型, 需要在见括号中加入多个节点:<T,U,V...>在函数名后面参入节点的声明
     >*/
    
    //TODO: 定义几个函数, 参数类型不同的函数 ,实现的功能相似
    func show(pera: Int) {
        print("hello \(pera)")
        
    }
    func show1(pera: String) {
        print("hello \(pera)")
    }
    func show2(pera: Double) {
        print("hello \(pera)")
    }
    
    //上面三个函数可以使用一个函数顶替
    func show3<P>(pera:P) {
        print("hello \(pera)")
    }

    //TODO: 同意函数有多个参数只有一个泛型参数的时候 每个节点的参数的类型必须是相同的
    func show4<P>(pera1: P, pera2: P, pera3: P) {
        print(pera1,pera2,pera3)
    }

//MARK: -  <泛型协议>
    /*<
     1. 除了节点泛型, 还可以用 associcatedtype 关键字进行声明泛型, 在协议中声明,  关联类型
     2. Self 关键字代表协议遵守着本身
     >*/
    
    struct TestStruct: SomeProtocol {
        func elementMethod1(element: String) {
                print("elementMethod1 :\(element)")
        }
        func elementMethod2(element: String) {
            print("elementMethod1 :\(element)")
        }
    }
 
    struct BoxInt: CanCompare {
        var intValue: Int
        func isBigger(other: BoxInt) -> Bool {
            return self.intValue > other.intValue
        }
    }
    
//MARK: -  <泛型对象>
    struct TestStruct2<T> {
        func elementMethod1(element: T) {
            print("elementMethod1 :\(element)")
        }
        func elementMethod2(element: T) {
            print("elementMethod1 :\(element)")
        }
    }

//MARK: -  <泛型方法>
/*<
     1. 方法中的泛型使用节点表示法, 作用于只在本方法内,这样就可以在同一实例方法中使用不同的参数了
     >*/
    
    struct TestStruct3 {
        func elementMethod1<T>(element: T) {
            print("elementMethod1 :\(element)")
        }
        func elementMethod2<T>(element: T) {
            print("elementMethod2 :\(element)")
        }
    }
    
//MARK: -  <协议中的 Where 关键字>
    
//MARK: -  <断言<asset>>
    
}

