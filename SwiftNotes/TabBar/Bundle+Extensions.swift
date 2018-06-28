//
//  Bundle+Extensions.swift
//  SwiftTest-反射机制
//
//  Created by Datacvg on 2017/9/20.
//  Copyright © 2017年 Belinda. All rights reserved.
//

import Foundation

extension Bundle{
    //返回命名空间字符串

    var namespace:String{
        return  infoDictionary?["CFBundleName"] as? String ?? ""

    }
}
