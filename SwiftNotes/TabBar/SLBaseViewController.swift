//
//  SLBaseViewController.swift
//  SEMP
//
//  Created by Datacvg on 2017/9/20.
//  Copyright © 2017年 Belinda. All rights reserved.
//

import UIKit
//OC不支持多继承，使用协议替代
//Swift 的写法更类似于多继承
// Swift 中， 利用extebsion 可以把“函数”按功能分类管理，便于阅读和维护
/**
 *  注意：
 *  1.extension 中不能有属性
 *  2.extension 中不能重新写父类方法！ 重写父类方法是眦裂的职责，扩展是对类的扩展
 */
///
//所有主控制器的基类控制器
class SLBaseViewController: UIViewController {
    //表格视图
    var tableView : UITableView?
    
    let statusBarH = UIApplication.shared.statusBarFrame.height
    
    //自定义导航条
    lazy var navigationBar : UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y:  statusBarH, width: UIScreen.main.bounds.width, height: self.navigationController!.navigationBar.frame.height))
    //自定义状态栏（iOS11，不自定义状态栏会被覆盖）
    lazy var statusBarView  = UIView.init(frame: CGRect(x: 0, y: -statusBarH, width:UIScreen.main.bounds.width , height: statusBarH))
    //自定义的导航条目
    lazy var navItem = UINavigationItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 11.0, *) {
            navigationBar.prefersLargeTitles = true
        }
        setupUI()
        
    }
    override var title: String? {
        didSet {
            navItem.title = title
        }
    }
    
}

//MARK: -设置界面
extension SLBaseViewController {

    func setupUI()  {
        
        view.backgroundColor = vcBackColor
        setupNavigationBar()
        setupTableView()
    }
    //设置表格试图
    private func setupTableView(){
        tableView = UITableView(frame: view.bounds, style: .plain)
        view.insertSubview(tableView!, belowSubview: navigationBar)
        tableView?.backgroundColor = vcBackColor
        //去除分割线
        tableView?.separatorStyle = UITableViewCellSeparatorStyle.none
        //设置数据源&代理->目的：子类直接实现数据源方法
        tableView?.delegate = self
        tableView?.dataSource = self
        //设置内容缩进
        tableView?.contentInset = UIEdgeInsets(top: navigationBar.bounds.height, left: 0, bottom: tabBarController?.tabBar.bounds.height ?? 49 , right: 0)
    }
    //设置导航条 
    private func setupNavigationBar() {
        //添加导航条及状态栏
        view.addSubview(navigationBar)
        navigationBar.addSubview(statusBarView)
        navigationBar.items = [navItem]
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = NavBarBackColor
        statusBarView.backgroundColor = NavBarBackColor

        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
 
    func setNavigationBarItem(leftImageName:String,rightImageName:String,leftIsHidden:Bool,rightIsHidden:Bool)  {
        /***
         设置自定义导航栏左右按钮
         ***/
        //文字
        //navItem.leftBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: self, action: #selector(self.leftClick))
        //navItem.leftBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: self, action: #selector(self.rightClick))
        // 图片
        if leftIsHidden == false {
            navItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: leftImageName), style: .plain, target: self, action: #selector(self.leftClick))
            // BarButtonItem颜色
            navItem.leftBarButtonItem?.tintColor = GlobalColor
        }
        if rightIsHidden == false {
            navItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: rightImageName), style: .plain, target: self, action: #selector(self.rightClick))
            // BarButtonItem颜色
            navItem.rightBarButtonItem?.tintColor = GlobalColor
        }
       

        /**
         自定义button
         let leftButton = buttonCommon(action: #selector(leftClick),isHidden: leftIsHidden)
         let rightButton = buttonCommon(action: #selector(rightClick),isHidden: rightIsHidden)
         
         navItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
         navItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
         */
        
    }
    private func buttonCommon(action : Selector,isHidden : Bool)->UIButton{
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        button.setTitleColor(UIColor.black, for: UIControlState.normal)
        button.setTitle(nil, for: UIControlState.normal)
        button.setImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: action, for: UIControlEvents.touchUpInside)
        button.isHidden = isHidden
        return button
    }
    /**
     @objc 作用
     
     1 fileprivate 或者 private  保证方法私有 能在同一个类 或者 同一个文件（extension）中访问这个方法 如果定义为private  那么只能在一个类中访问 不能在类扩展中访问
     
     2 允许这个函数在“运行时”通过oc的消息机制调用
     */
    @objc func leftClick(){
        print("点击左边")
    }
    @objc func rightClick(){
        print("点击右边")
    }

}

//MARK: -UITableViewDelegate,UITableViewDataSource
extension SLBaseViewController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    //基类只是准备方法，子类负责具体的实现方法
    //子类的数据方法不需要 super
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
