//
//  ViewController.swift
//  体验 Swift
//
//  Created by LiJie on 2017/5/22.
//  Copyright © 2017年 LiJie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.studyFuncSeven()
    }
    
    //MARK: -  <基本运算>
    
    func studyFuncTwo() {
        //1. 赋值 "="
        let a = 3
        let b = a
        print(b)
        //2. 元组赋值
        let(x,y) = (2,4)
        print(x,y)
        //3. 判断
        if a == b {
            print(a)
        }
        //4. 加减乘除(字符可以用+拼接)
        let string = "北京" + "欢迎你"
        print(string)
        
        //5. 自增自减运算
        var c = 4;
        c += 1 //自增
        c -= 1 //自减
        print(c)
        
        //6. 复合赋值
        var d = 2
        d += 3
        print(d)
        
        //7. 比较运算
        
        //8. 三目运算
        let width = 130
        let height = width > 120 ? 110 : 13333
        print(height)
        
        //9. 逻辑运算符
        let flag = true && false  //与
        let flag1 = true || false //或
        let flag2 = !true          //非
        print(flag, flag1,flag2)
        
        //10. 范围
        //        1...5 //表示闭区间[1,5],1到5
        //        1..<5 //表示半闭区间[1,5), 1到4
        
        for index in 1...5 {
            print(index)
        }
        
        for index1 in 1..<5 {
            print("----------\(index1)")
        }
        
        
        let index = 3
        switch index {  //switch 控制流
        case 1...2:
            print("12")
        case 2...4:
            print("24")
        default:
            print("0")
        }
        
        //11 .括号优先级
    }
    
    //MARK: -  <基本语法>
    
    func studyFuncOne() {
        //        let name:String = "小明"
        //        print("我爱你",name)
        //        print("2","34")
        //        print("我的同学叫\(name)")
        //        let max = Int8.max
        //        let mix = Int8.min
        //        print(max)
        //        print(mix,name)
        //
        
        //元组类型
        //        let message = (name:"小明",age:"10",class:"四年级三班")
        //        //忽略元组中的个元素 ,使用"_"忽略不想用的元素
        //        let (showName,_,_) = message
        //        print(showName)
        //
        //可选型
        //        var age:Int?
        //        age = Int("12")
        //        print(age!)
        //        var age : Int //声明为非可选类型
        //        age = Int("12") ?? 34  //把字符串类型的数字转化成 Int 类型 成功
        //        print("age is \(age)")  //转化成功后输出 ?? 之前的值
        //        age = Int("小明") ?? -1   //把字符类型的文字转化成 Int 类型不会成功
        //        print("age is \(age)")  //转化失败之后输出 ?? 之后的值
        
        /*<可选绑定>*/
        let age:Int? = Int("13")
        if let a = age {
            print(a)
        }
        //        guard let a = age else {
        //            return;
        //        }
        //        print(a)
    }
    
    
    //MARK: -  <字符串和字符>
    func studyFuncThree() {
        //        var variableString = "我可以被修改"   //可变的字符串
        //        let noVariabeString = "我不能被修改"  //不可变字符串
        
        let firstString = "swift很不错啊  "
        let secondString = "你觉得呢"
        let totalString = firstString + secondString   //拼接字符串
        print(totalString)
        
        if firstString == secondString {   //字符串的比较, 用'=='
            print("二者相同")
        } else {
            print("二者不同")
        }
        
        let str = "hello world"
        let string  =  str[str.index(str.startIndex, offsetBy:0)]  //取出字符串中相对索引的字符(下标取字符, 如果下标超出字符串末尾字符的下标程序会崩溃,并不安全)
        print(string)
        
        let limitString = str[str.index(str.startIndex, offsetBy: 5, limitedBy: str.endIndex)!]
        print(limitString)
        
        var stringTest = "hello"//截取子字符串
        let start = stringTest.index(stringTest.startIndex, offsetBy: 0)
        let end = stringTest.index(stringTest.startIndex, offsetBy: 2)
        print(stringTest[start...end])
        
        
        let s1 : NSString = "NSString" //string 类型的字符串赋值给 NSString 类型不需要转换格式
        let s2 : String =  String(s1)  //NSString 类型的字符串赋值给 string 类型的字符串需要转换格式
        print(s2)
        //        let s3 : String = s1 as String  //转化类型
        
        let rangeString = "12133434.232343433223"
        let range = rangeString.range(of: ".")  //以 " . " 为分割点的范围, range 是一个可选类型
        var range2String = rangeString[rangeString.startIndex ..< range!.lowerBound]  //从该字符串开始的下标到 range 范围内的下标对应的子字符串
        
        stringTest .removeSubrange(start...end)  //截取整段字符删除
        
        range2String .remove(at: range2String.index(range2String.startIndex, offsetBy: 2))  //删除单个字符
        
        print(range2String)
        
        print(stringTest)
        
        var replaceString = "中国的一只风筝随风飘啊"
        let replaceStart = replaceString.index(replaceString.startIndex, offsetBy: 0)
        let replaceEnd = replaceString.index(replaceString.startIndex, offsetBy: 6)
        replaceString.replaceSubrange(replaceStart...replaceEnd, with:"中国一面红色的国旗")  //替换字符串,替换的字数不一定要和替换前的字数相同
        print(replaceString)
    }
    
    
    //MARK: -  <集合类型>
    
    func studyFuncFour() {
        
        //1. 数组
        //创建一个字符串类型的空数组
        //        var array = Array<String>()
        //        var array1 = [String]()
        
        var array2 = ["小明","小黄","小鹏","小样"]  //官方推荐的方式创建数组
        let array3 = ["萝卜","鸡蛋","青椒","土豆"]
        
        print(array2)
        let count = array2.count  //数组中元素的个数
        print(count)
        
        array2 += ["小川"]  //使用 " += " 往数组中添加元素
        print(array2)
        
        var array4 = array3 + array2   //两个数组相加
        print(array4)
        
        array4.append("芹菜")   //想数组中添加单个元素
        print(array4)
        
        let string = array4[2]  //取出对应下标对应的元素
        print(string)
        
        var array5 = array4[1...4]  //取出数组中一段范围下标对应的元素
        print(array5)
        
        array5[1...3] = ["小刘"]   //替换数组中某个下标范围内的元素 替换的元素个数可以跟原有的元素的个数不同,  使用才方法返回的只是原数组的片段,不会占用额外的空间
        print(array5)
        
        array5.insert("小王", at: 2)  //插入一个元素
        print(array5)
        
        array5.removeLast()  //删除最后一个元素
        print(array5)
        
        array5.removeAll()   //删除所有的元素
        print(array5)  //此时打印出来的是空数组 " [] "
        
        array5.removeAll(keepingCapacity: true)   //删除所有的元素,是否保留原有的空间
        
        //        array5.remove(at: 1) //删除指定下标的元素
        //对数组进行操作的时候最好做异常判断, 防止越界
        
        
        //2. 集合
        let setArray = ["萝卜", "鸡蛋", "青椒", "土豆", "小明", "小黄", "小鹏", "小样", "小川", "芹菜","萝卜", "鸡蛋", "青椒", "土豆", "小明", "小黄", "小鹏", "小样", "小川", "芹菜"]
        let arraySet : Set = Set(setArray)
        print(arraySet)
        
        
        //3. 字典
        //创建字典
        //        var dictionary = Dictionary<String,Int>()
        //        var dictionary1 = [String : Int]()
        var dictionary2 = ["身高" : "178", "体重" : "76", "名字" : "小明"]  //创建字典
        print(dictionary2.count)   //字典中元素的个数
        
        let string1 = dictionary2["身高"]   //根据键取值
        print(string1 ?? 0)
        
        dictionary2["身高"] = "156"   //根据键修改对应的值
        dictionary2["名字"] = "流兴"
        print(dictionary2)
        
        let oldValue = dictionary2.updateValue("345", forKey: "number")   //修改字典中的键, 如果原来字典中没有这个键,会自动创建
        let oldValue1 = dictionary2.updateValue("88", forKey: "体重")  //修改原来的键值
        print(dictionary2)  //添加键值成功
        print(oldValue ?? "0")  //如果原来的字典中没有这个键, 会返回 nil
        print(oldValue1!)
        
        dictionary2["年龄"] = nil  //根据下标移除某个键对应的值
        print(dictionary2)
        
        let oldValue2 = dictionary2.removeValue(forKey: "体重")  //根据键移除值
        print(oldValue2 ?? "0") //返回原来的值
        print(dictionary2)
    }
    
    
    //MARK: -  <控制流>
    func studyFuncFive() {
        
        //1. for 循环
        for i in 0..<5 {
            print(i)
        }
        
        let array = ["花菜","芹菜","菠菜","黄花菜","油麦菜","贡菜"]   //遍历数组
        for arrayItem in array {
            print("菜名 = \(arrayItem)")
        }
        
        let dict = ["名字":"小刘","年龄":"30","居住地":"北京"]   //遍历字典
        for (key,vlaue) in dict {
            print("\(key) : \(vlaue)")
        }
        
        for key in dict.keys {   //遍历字典中的键
            print(key)
        }
        
        for value in dict.values {    //遍历字典中的值
            print(value)
        }
        
        
        // 2. while 循环
        // 2.1先判断条件的 repeat - while
        
        var index1 = 13
        repeat {
            index1 -= 1 //循环3次
            print("我是 repeat - while ")
        }while index1 > 10
        //2.2 while 判断
        var index2 = 15
        while index2 > 13 {
            index2 -= 1
            print("while 判断")
        }
        
        // 3. if 判断
        let bookPrice = 100
        if bookPrice > 70 {
            print("这本书好贵")
        } else {
            print("这本书合算啊")
        }
        
        // else if
        if bookPrice < 50 {
            print("这本书真便宜")
        } else if bookPrice > 50 && bookPrice < 80 {
            print("并不是很贵")
        } else {
            print("太贵了")
        }
        
        // 4. guard 判断句
        struct Peopele {   //结构体
            var sex : String
            var age : Int
        }
        
        let peo = Peopele(sex: "男", age: 20)  // 结构体实例
        if peo.sex == "男" {    // if的双层判断
            if peo.age == 20 {
                print("正确")
            } else{
                print("错了")
            }
        } else {
            print("假的")
        }
        
        guard peo.sex == "男" else {   // guard else 判断
            print("假的")
            return
        }
        guard peo.age == 20 else {
            print("错了")
            return;
        }
        print("正确")
        
        
        //5. switch 开关语句
        let dinners = ["花菜","芹菜","菠菜","黄花菜","油麦菜","贡菜"]  //switch 判断
        let dinner = dinners[1]
        switch dinner {
        case "花菜":
            print("花花绿绿就是我")
        case "芹菜":
            print("绿杆杆个就是我")
        case "菠菜":
            print("波波波波波波波波波")
        case "黄花菜":
            print("人比黄花瘦")
        case "油麦菜":
            print("油麦菜油麦菜油麦菜油麦菜")
        case "贡菜":
            print("贡菜不是一般人能吃到的哦")
        default:
            print("不就是一堆青菜吗?")
        }
        //------------华丽分割线------------//------------华丽分割线------------//
        switch dinner {    //fallthrough的使用,
        case "花菜":
            print("花花绿绿就是我")
        case "芹菜":
            print("绿杆杆个就是我")
            fallthrough
        case "菠菜":
            print("波波波波波波波波波")
            fallthrough
        case "黄花菜":
            print("人比黄花瘦")
            fallthrough
        case "油麦菜":
            print("油麦菜油麦菜油麦菜油麦菜")
            fallthrough
        case "贡菜":
            print("贡菜不是一般人能吃到的哦")
        default:
            print("不就是一堆青菜吗?")
        }
        
        let iponePrice = 5288   //switch 可以范围判断
        switch iponePrice {
        case 1000...4000:
            print("直接买,不犹豫")
        case 4000...5500:
            print("可以考虑一下")
        case 5500...8000:
            print("算了, 买国产机去")
        default:
            print("ipone")
        }
    }
    
    //------------华丽分割线------------//------------华丽分割线------------//
    //MARK: -  <函数>
    func studyFuncSeven()  {
        //函数调用
        let string = self.func1(parameter: "  写了多少遍了")
        print(string)
        
        //函数做参数
        self.someFunc(parameter: plus(a:b:), a: 3, b: 5)
        
        //可变参数
        print(self.arithmeticMean(numbers: 1,2,3))
        
        //修改参数
        print(self.exampleOfFunction1(parameter: "小王"))
        
        //保持参数变量在函数调用完毕后的值
        var name = "嘻嘻哈哈"
        print(self.exampleOfFunction2(parameter: &name))
        print(name)
        
        self.test(s: "")
        self.test1(s: "")
        
        
    }
    
    //1. 定义函数
    func func1(parameter:String) -> String { //定义一个返回值为 string类型, 参数为 string 类型的函数
        let string = "hello world" + parameter
        return string
    }
    
    //函数做参数
    func plus(a:Int,b:Int) ->Int {    //加法函数
        return a + b // a+b
    }
    
    func mult(a:Int,b:Int) ->Int {    //乘法函数
        return a * b // a*b
    }
    
    func someFunc(parameter:(Int,Int) -> Int,a:Int,b:Int) {   //一个函数做参数的函数, 把参数a,b 传到第一个参数中去
        print("结果: \(parameter(a,b))")
    }
    
    //当不确定参数的具体个数时, 应该使用可变的参数
    func arithmeticMean (numbers: Double...) -> Double {  //numbers 是参数, 可以是多个, 利用 for 循环遍历数组中的元素进行运算
        var total: Double = 0
        for number in numbers {
            total += number
        }
        return total / Double(numbers.count)
    }
    
    //不能在函数体中直接修改参数, 直接修改会引起变异错误
    func exampleOfFunction(parameter: String) -> String {
        //        parameter = "hello \(parameter)" //直接报错
        return parameter
    }
    
    //想要修改参数必须新建成员
    func exampleOfFunction1(parameter: String) -> String {
        let string = "hello \(parameter)"
        return string
    }
    
    func exampleOfFunction2( parameter: inout String) -> String {  //在函数的参数中添加 inout 关键字后再函数体中直接修改参数不会报错的 , 要想对变量的参数保持修改后的值,必须直接修改参数, 而不能创建新的参数.
        parameter = "hello \(parameter)"
        return parameter
    }
    
    //    "=="在函数中的使用
    //    struct BoxInt {
    //        var intValue : Int
    //    }
    //
    //    //重新操作符
    //    func == (lhs: BoxInt, rhs: BoxInt) -> Bool {
    //        return lhs.intValue = rhs.intValue
    //    }
    
    //重载函数
    func test(s: String) -> Int {
        print("Int")
        return 34
    }
    
    func test1(s :String) -> String {
        print("String")
        return s
    }
}


