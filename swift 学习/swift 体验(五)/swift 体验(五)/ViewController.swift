//
//  ViewController.swift
//  swift 体验(五)
//
//  Created by LiJie on 2017/6/13.
//  Copyright © 2017年 LiJie. All rights reserved.
//

import UIKit

//给 People 类添加扩展属性
extension People {
    //计算属性扩展
    var extenPropetty: String {
        get { return name }
    }
}

//给 People 类扩展构造器
extension People {
    convenience init(age: Int) { //扩展的构造器是便捷构造器 (convenience Initializers)
        self.init(name: "小凳子")  //在扩展构造器时必须实现指定的构造器(Designated Initializers)
        self.age = age
    }
}

// 给Int 扩展方法
extension Int {
    func calculate() -> Int {
        return self * 10
    }
}

// 给 Int 扩展下标
extension Int {
    subscript (num: Int)->Int {
        return self * num
    }
}


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //        funcStudy()
        //        print(sayHello(externalName: "刘总"))
        //        print(sayHello("刘总"))
        //        let timeof = TimeOfNum(num : 5)  //结构体中的整数
        //        print(timeof[3])  //下标是3
        //        print(timeof[4,3]) //小标为 4, 3
        //        classFunction()
        nestedTypesFunc()
        extensionFunc()
    }
    
    /*\**********************我是华丽的分割线**********************\*/
    //MARK: -  <方法>
    /*<方法有两种:
     1. 类方法
     2. 实例方法
     >*/
    
    func funcStudy() {
        var b = -124.34
        if b.isLess(than: 0) {
            b = Double.abs(b)
            print(b)
            let num = arc4random()%10
            print(num)
        }
    }
    
    //    func sayHello(externalName internalName:String) -> String { //externalName是外部调用时的参数名称,internalName是方法内部逻辑处理时的参数名称
    func sayHello(_ internalName:String) -> String { //可以使用 '_' 来替代方法外部的参数名称'
        return internalName;
    }
    
    func holloSwift(paramet3 outName:String, paramet2 outName2: String) -> String {
        return outName + outName2 //在 swift3.0 之后必须要有外部参数名称和内部参数名称, 只在 swift2.2 的时候可以省略第一个参数的外部参数名称
    }
    
    //结构体中定义方法
    struct Example {
        var string = "hello 小明"
        mutating func sayHello(name: String) {
            string = "hello\(name)"  //结构体和枚举是值类型, 一般情况下值类型的属性是不可变的,不能在他的实例方法中修改属性, 若要修改属性, 需要在方法前加 mutating 关键字,此时这个方法就便是一个变异方法
        }
    }
    
    /*\**********************我是华丽的分割线**********************\*/
    //MARK: -  <下标>
    //在类和结构体, 枚举中都可以定义下标, 定义下标的关键字是 subScript
    //定义下标的格式:
    subscript(index:Int) -> Int {
        get {
            //返回声明中返回类型的值, 在此例子中应该返回 Int
            return 0
        }
        set(newValue){
            //执行赋值操作
        }
    }
    struct TimeOfNum {  //此结构体的作用是算出某个整数的倍数是多少,
        let num : Int
        //        let otherNum : Int
        subscript (index:Int) -> Int {
            return num * index  //返回结果
        }
        
        subscript(index1:Int,index2:Int) -> Int { //在下标中可以隐藏外部参数名称也可以注明外部参数名称
            return  num * index1 + index2
        }
    }
    /*\**********************我是华丽的分割线**********************\*/
    //MARK: -  <继承>
    /*<
     在 swift 中,三大数据结构只有类才能够继承, 枚举和机构体不具备继承特性
     子类可以访问父类中的方法,属性和下标。
     swift 中继承的使用格式： class 子类名：父类名
     swift 中重写父类方法时需要使用 “override” 关键字
     >*/
    
    func classFunction() {
        //创建父类
        class SuperClass {
            var name = ""
            //            final var age = 20  //在属性前加 final 关键字， 类的属性就不能被重写 ，  在 整个类的前面加 final 整个类都不能被继承
            var age = 20
            func superClassFunc() {
                name = "小刘";
                print(name)
            }
            
            func testFunc()  {
                print("我是父类的方法")
            }
        }
        let superClass = SuperClass()
        superClass .superClassFunc()
        
        class ChildClass : SuperClass{
            //重写父类的方法
            override func superClassFunc() { //重写父类的方法
                name = "小赵" //修改父类的 name 属性
                age = 90 //修改父类的 age 属性
                print("\(name)的年龄是：\(age)")
            }
            
            override var age: Int {  //override不仅可以重写父类的方法还可以重写父类的属性，实现 get set 方法可以修改属相的权限
                //                get {
                //                    return 3
                //                }
                //                set {
                //                }
                
                willSet {
                    print("age -------没变")
                }
                didSet {
                    print("age -------变了")
                }
            }
            
            func testFuncChild() {
                super.testFunc()  //调用父类的方法
            }
        }
        let childClass = ChildClass()
        childClass.name = "小明"  //重写父类中的 name 属性， 父类中的属性不变
        childClass.age =  100  //走 didSet 方法
        print(childClass.name)
        print(superClass.name)   //父类不变
        childClass.superClassFunc()
        childClass.testFuncChild()
    }
    
    /*\**********************我是华丽的分割线**********************\*/
    //MARK: -  <构造器>
    /*<
     1. 当类的所有属性都有初始值并且类中没构造器时， 会自动得到一个没有参数的构造器 init() 。
     2. 在结构体所有属性都有默认值并且结构体中没有构造器时，就会得到一个默认的将所有属性做为参数的构造器。
     3. 声明构造器方法不需要使用 func 关键字， 在一个类或者一个结构体中可以有多个构造器， 所有的构造器都叫 init
     4. 在类中有两种构造器：便捷构造器（Convenience Initializers）& 指定构造器（Designated Initializers）,指定构造器只能调用其父类中的指定的构造器， 指定构造器是类的默认构造器，一个构造器必须调用其父类的 init 而不能调用其自身的 init
     5. 一旦在类中创建了自己的指定构造器后，将不能在使用父类中的构造器， 并且子类的指定构造器中需要调用父类中的某个指定构造器
     6. 析构器： 在类中有一些资源正在使用的时候需要使用析构器， 析构器用 deinit {}
     >*/
    
    struct ExampleStruct {
        var name = "小明"
        init(name:String) {
        }// 默认生成的构造器
    }
    
    class ExampleFunction {
        var name = "小明"
        init() {} //无参数的指定构造器, 如果在父类中构造器前加 'required' 关键词， 则子类中必须实现此构造器
        init(name:String) { // 一个参数的指定构造器
            self.name = name
        }
        
    }
    
    class ExampleFunctionChild: ExampleFunction {
        
    }
    
    let exampleFunctionChild = ExampleFunctionChild() //使用父类指定的无参数的构造器
    let exampleFunctionChild1 = ExampleFunctionChild(name:"小明") //使用父类的另一个指定的构造器
    
    class ExampleFunctionChild1: ExampleFunction {
        var age = 10
        init(name: String, age:Int) {
            super.init()   //调用父类指定的构造器
            self.name = name
            self.age = age
        }
    }
    var exampleFunctionChild2 = ExampleFunctionChild1(name: "xiangzhang", age: 90)
    
    //创建 button
    func setupButton() {
        let button:UIButton = {
        let button = UIButton(frame: CGRect.init(x: 0, y: 0, width: 200, height: 300))
        button.backgroundColor = UIColor.red
        return button
        }()
        self.view .addSubview(button);
}
  
    /*\**********************我是华丽的分割线**********************\*/
//MARK: -  <类型检查与类型转换>
    /*<
     1 .在 swift 中一般使用 “is” 关键字实现类型检查。
     2. 在 swift 中一般使用 “as” 关键字实现类型转换。
     3. 除关键字还可以通过构造器和方法来实现类型转换，类型检查。
     >*/
    func kindCheck()  {
//        let num = 10
//        if num is Int {   //类型转换
//            print(num)
//            let num1 = num as? Double  //类型转化
//            print(nu m1?.description)
//        }
    }
//MARK: -  <类型嵌套>
    func nestedTypesFunc() {
        //定义一个结构体，在结构体中嵌套枚举
        struct SchoolUniform {
            enum Style:String {
                case Sport = "运动服", Suit = "中山服"  //服装的不同的样式
            }
            
            enum Grade : String {
                case One = "初一", Two = "初二", Three = "初三"  //年级的不同
            }
            
            let myStyle : Style
            let myGrade : Grade
            func custonSize(){  //机构体中的方法
                print("我的年级是 \(myGrade.rawValue), 我的校服款式是: \(myStyle.rawValue)")
            }
        }
        let myInformation = SchoolUniform(myStyle: .Sport, myGrade: .Three) //类型嵌套中的枚举相当于结构体的参数
        myInformation.custonSize()
    }

    /*\**********************我是华丽的分割线**********************\*/
//MARK: -  <扩展>
   /*<
     1. 扩展是对一个现存的类, 结构体, 枚举或者协议添加新的属性或者方法的语法, 无需修改目标的源代码, 就可以吧自己的想要的代码加到目标上
     2. 扩展不能添加一个已经存在的方法或者属性
     3. 添加的属性不能是储存属性, 只能是计算属性
     4. 扩展使用关键字 "extension" 格式是: extension 某个现有的类型 { 添加新的方法或者属性 }
     5 . 扩展可以扩展现有类的计算属性,  构造器, 方法和下标
     6 .扩展方法的做法非常灵活, 既可以给自定义的类扩展方法还可以给基本数据理性扩展方法
     >*/
    func extensionFunc() {
        //People 类减 People.swift
        let people = People(name: "小明")
        //扩展属性
        print(people.extenPropetty,people.age)
        
        //扩展构造器
        let people1 = People(age:30)
        print(people1.age, people1.name)
        
        //给 Int 扩招方法
        let index = 5
        print(index.calculate())  //log 为 50
        
        //给 Int 扩展下标
        print(index[3])
        
    }
}

