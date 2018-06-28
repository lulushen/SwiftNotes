//
//  SLDetailViewController.swift
//  SwiftNotes
//
//  Created by Datacvg on 2018/6/28.
//  Copyright © 2018年 Datacvg. All rights reserved.
//

import UIKit

class SLDetailViewController: SLBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "详情"
        super.setNavigationBarItem(leftImageName: "back",rightImageName:"",leftIsHidden: false, rightIsHidden: true)
        
        // Do any additional setup after loading the view.
    }

    override func leftClick() {
        super.leftClick()
        self.navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
