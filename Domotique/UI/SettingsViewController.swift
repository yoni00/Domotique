//
//  SettingsViewController.swift
//  Domotique
//
//  Created by ysoleiman on 04/08/2016.
//  Copyright © 2016 Christophe Haguette. All rights reserved.
//

import UIKit

private let serverCellId = "serverCell"

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

    var currentTextField: UITextField?
    
    //MARK: - UI Components
    
    lazy var tableView: UITableView = {
        let _tableView = UITableView()
        _tableView.registerClass(ServerAddressCell.self, forCellReuseIdentifier: serverCellId)
        _tableView.delegate = self
        _tableView.dataSource = self
        _tableView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
        
        return _tableView
    }()
    
    lazy var headerView: UIView = {
        let _headerView = UIView()
        
        let bottomLine = UIView()
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        bottomLine.backgroundColor = .blackColor()
        _headerView.addSubview(bottomLine)
        
        let views = ["bottomLine" : bottomLine]
        
        _headerView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|[bottomLine]|",
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: nil,
            views: views))

        _headerView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|->=0-[bottomLine(1)]|",
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: nil,
            views: views))

        
        return _headerView
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
        edgesForExtendedLayout = .None
        view.backgroundColor = UIColor.backgroundGrey
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Terminé", style: .Plain, target: self, action: #selector(dismiss))

        headerView.frame = view.bounds
        headerView.height = 20.0
        tableView.tableHeaderView = headerView
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
                    serverCell.textField.delegate = self
                }
            }
        }
        
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50.0
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
    
    
    //MARK: - Action
    
    func dismiss(){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func dismissKeyboard(){
        if currentTextField != nil {
            currentTextField!.resignFirstResponder()
        }
    }

    
    //MARK: - Ui textField delegate
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        currentTextField = textField
        return true
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        currentTextField = nil
        return true
    }

    
    //MARK: - UI Scroll view delegate
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        dismissKeyboard()
    }


}
