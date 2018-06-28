//
//  ViewController.swift
//  SwiftNotes
//
//  Created by Datacvg on 2018/6/20.
//  Copyright © 2018年 Datacvg. All rights reserved.
//

import UIKit

class SLHomeViewController: SLBaseViewController {
 
    let cellTitleArray : [String] = ["TabBarContrlller使用"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Cell注册
        tableView?.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "NotesCell")

     }
 
    
 
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "NotesCell")
        if cell == nil {
            cell = tableView.dequeueReusableCell(withIdentifier: "NotesCell", for: indexPath)
        }
        
        // Configure the cell...
        cell?.textLabel?.text = cellTitleArray[0]
        
        return cell!
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          navigationController?.pushViewController(SLDetailViewController(), animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
}

