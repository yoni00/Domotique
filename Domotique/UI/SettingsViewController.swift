//
//  SettingsViewController.swift
//  Domotique
//
//  Created by ysoleiman on 04/08/2016.
//  Copyright © 2016 Christophe Haguette. All rights reserved.
//

import UIKit

private let serverCellId = "serverCell"

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //MARK: - UI Components
    
    lazy var tableView: UITableView = {
        let _tableView = UITableView()
        _tableView.registerClass(ServerAddressCell.self, forCellReuseIdentifier: serverCellId)
        _tableView.delegate = self
        _tableView.dataSource = self
        
        return _tableView
    }()

    
    //MARK: - View Lifecycle

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(){
        super.init(nibName: nil, bundle: nil)
        edgesForExtendedLayout = .None
        title = "Paramètres"
    }
    
    override func viewDidLoad(){
        tableView.frame = view.bounds
        view.addSubview(tableView)
    }
    
    
    //MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell =  UITableViewCell()
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                if let serverCell = serverCell() {
                    cell = serverCell
                }
            }
        }
        
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70.0
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Serveur"
        }
        
        return nil
    }

    
    //MARK: - Cell generators
    
    func serverCell() -> ServerAddressCell? {
        let serverCell = tableView.dequeueReusableCellWithIdentifier(serverCellId) as? ServerAddressCell
        if serverCell != nil {
            if (HomeConnectionManager.sharedInstance.host != nil) {
                serverCell!.textField.text = HomeConnectionManager.sharedInstance.host
            } else {
                serverCell!.textField.placeholder = "192.168.1.1"
            }
        }
        return serverCell
    }
    

}
