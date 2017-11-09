//
//  ViewController.swift
//  Swift 体验(三)
//
//  Created by LiJie on 2017/6/1.
//  Copyright © 2017年 LiJie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    //MARK: -  <Swift 三杰简介>
    /***
     Swift 三杰:  类, 结构体, 枚举
     三者都可以拥有属性和方法, 枚举本身不能储存数据, 但是可以将数据存储在关联信息中
     类和结构体可以自定义构造方法
     类是三者中唯一具有继承属性的
     结构体和枚举是值引用而类是类型引用
     
     */
    
    
    //MARK: -  <值引用和类型引用>
    
    /***
     值引用:  比如结构体, 他表示将它传递给一个方法的时候,使用的复制,将它赋值给另一个变量的时候也是如此,修改得到复制的值时, 修改的也仅仅是复制的值,而不是原来的. 值引用并不是完全的复制,而是在底层也是某种指针, 只在绝对必要的时候才会真正的复制, 不必担心性能问题
     */
}

