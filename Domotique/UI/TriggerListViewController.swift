//
//  TriggerListViewController.swift
//  Domotique
//
//  Created by Yoni on 26/07/2016.
//  Copyright © 2016 Christophe Haguette. All rights reserved.
//

import UIKit


class TriggerListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    //MARK: - UI Components

    lazy var tableView: UITableView = {
        let _tableView = UITableView()
        _tableView.registerClass(TriggerCell.self, forCellReuseIdentifier: TriggerConstants.triggerCellIdentifier)
        _tableView.delegate = self
        _tableView.dataSource = self

        return _tableView
    }()
    
    var triggerList = [TriggerElement]()

    
    //MARK: - View Lifecycle
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(){
        super.init(nibName: nil, bundle: nil)
        edgesForExtendedLayout = .None
        title = "Lampes et volets"
        
        for i in 0..<10 {
            
            var triggerElement = TriggerElement()
            triggerElement.type = i%2 == 0 ? TriggerType.Light : TriggerType.Shutter
            triggerList.append(triggerElement)
        }
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
        return triggerList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(TriggerConstants.triggerCellIdentifier) as! TriggerCell
        cell.type = triggerList[indexPath.row].type
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70.0
    }

    
}
