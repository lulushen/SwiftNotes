//
//  SLNavigationController.swift
//  SEMP
//
//  Created by Datacvg on 2017/9/20.
//  Copyright © 2017年 Belinda. All rights reserved.
//

import UIKit

class SLNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isHidden = true
    }
    
    /// 重写Push方法
    /// 所有的push动作都会调用此方法
    /// - Parameters:  
    ///   - viewController: 需要push的VC
    ///   - animated: 是否动画
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        //如果不是栈底的控制器才需要隐藏，跟控制器不需要处理
        if childViewControllers.count > 0{
            //隐藏tabBar
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: true)
    }

}
