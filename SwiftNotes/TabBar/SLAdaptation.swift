//
//  SLAdaptation.swift
//  SEMP
//
//  Created by Datacvg on 2017/9/15.
//  Copyright © 2017年 Belinda. All rights reserved.
//

import UIKit



//MARK: -适配机型
let IPhoneX = (UIScreen.main.bounds.size.height == 812) ? true : false

//MARK: -当前屏幕 Height&Width
let  Main_Screen_Height = UIScreen.main.bounds.size.height
let  Main_Screen_Width  = UIScreen.main.bounds.size.width
let  Main_StatusBarFrameMaxY = UIApplication.shared.statusBarFrame.maxY;

//iphone6屏幕，设计原型
let iphone6Width:CGFloat = 375.0
let iphone6Height:CGFloat = 667.0

//高亮字体颜色 #41D1D2 #5D7F7E  (93.0,127.0,126.0)
let textHeightColor =  #colorLiteral(red: 0.2549019608, green: 0.8196078431, blue: 0.8235294118, alpha: 1)
let textBarKColor = #colorLiteral(red: 0.3647058824, green: 0.4980392157, blue: 0.4941176471, alpha: 1)

//viewController背景色
let vcBackColor = UIColor.white
let tabbarBackColor = #colorLiteral(red: 0.3647058824, green: 0.4980392157, blue: 0.4941176471, alpha: 1)
let NavBarBackColor = #colorLiteral(red: 0.3647058824, green: 0.4980392157, blue: 0.4941176471, alpha: 1)
let GlobalColor = #colorLiteral(red: 0.2549019608, green: 0.8196078431, blue: 0.8235294118, alpha: 1)


//MARK: -系统控件高度
func BottomBarHeight()->CGFloat { return IPhoneX ? 83.0 : 49.0  }

//MARK: -适配宽高
func FitWidth(_ width:CGFloat) -> (CGFloat) {  return width*(Main_Screen_Width/iphone6Width) }
func FitHeight(_ height:CGFloat) -> (CGFloat) { return height*(Main_Screen_Height/iphone6Height) }

//MARK: -系统版本
func IOS7() ->Bool { return (UIDevice.current.systemVersion as NSString).doubleValue >= 7.0 }
func IOS8() ->Bool { return (UIDevice.current.systemVersion as NSString).doubleValue >= 8.0 }
func IOS11() ->Bool { return (UIDevice.current.systemVersion as NSString).doubleValue >= 11.0 }

