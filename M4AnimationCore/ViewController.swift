//
//  ViewController.swift
//  M4AnimationCore
//
//  Created by hellochenms on 2018/6/30.
//  Copyright © 2018年 xyz.chenms. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor.blue
        
        tableView = UITableView(frame: CGRect.zero, style: .plain)
        view.addSubview(tableView)
        tableView?.dataSource = self
        tableView?.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView?.frame = view.bounds
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cellIdentifier")
        if indexPath.row == 0 {
            cell.textLabel?.text = "OC"
        } else {
            cell.textLabel?.text = "Swift"
        }
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let vc = OCViewController()
            navigationController?.pushViewController(vc, animated: true)
        } else {
        }
    }
    
}

