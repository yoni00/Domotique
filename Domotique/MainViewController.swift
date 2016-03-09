//
//  MainViewController.swift
//  Domotique
//
//  Created by CHRISTOPHE HAGUETTE on 12/01/2016.
//  Copyright © 2016 Christophe Haguette. All rights reserved.
//

import UIKit
import CocoaAsyncSocket
import DZNEmptyDataSet
import JGProgressHUD


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  MARK:   Define
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

let ACK = "*#*1##"
let ACK_DATA = "*#*1##".dataUsingEncoding(NSASCIIStringEncoding, allowLossyConversion: false)!
let TIMEOUT_NONE: NSTimeInterval = -1
let TAG_NONE = -1
let TAG_CONNEXION = 1
let TAG_DECOUVERTE = 100
let TAG_DECOUVERTE_LUMIERES = 101
let TAG_DECOUVERTE_VOLETS = 102
let TAG_LUMIERE_ETEINDRE = 1000
let TAG_LUMIERE_ALLUMER = 2000
let TAG_VOLET_FERMER = 3000
let TAG_VOLET_OUVRIR = 4000


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  MARK:   class
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class MainViewController: UIViewController, GCDAsyncSocketDelegate, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    
    
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  MARK:   variables
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var rightBarButtonItem: UIBarButtonItem!
    
    var GCDSocket: GCDAsyncSocket!
    var ipAddress: String = ""
    var tag: Int = -1
    var decouverteArray: [[String]] = []
    var decouverteLumieres: Bool = false
    var decouverteVolets: Bool = false
    var movingIndexPath: NSIndexPath?
    var isWiggling: Bool = false
    var cellImageView: UIView?
    var progressHUDSocket: JGProgressHUD!
    var progressHUDError: JGProgressHUD!
    var refreshControl: UIRefreshControl!
    var timers = [Int: NSTimer]()
    
    
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  MARK:   initialisation
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = editButtonItem()
        self.navigationItem.leftBarButtonItem!.title = "Modifier"
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor(red: 61.0/255.0, green: 150.0/255.0, blue: 225.0/255.0, alpha: 1.0)
        self.collectionView.emptyDataSetSource = self
        self.collectionView.emptyDataSetDelegate = self
        /*
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        self.collectionView.addSubview(refreshControl)
        */
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: "didLongPressCollectionView:")
        longPressGesture.minimumPressDuration = 0.3
        self.collectionView.addGestureRecognizer(longPressGesture)
        self.progressHUDSocket = JGProgressHUD(style: .ExtraLight)
        self.progressHUDSocket.backgroundColor = UIColor(white: 0.0, alpha: 0.4)
        self.progressHUDError = JGProgressHUD(style: .ExtraLight)
        self.progressHUDError.backgroundColor = UIColor(white: 0.0, alpha: 0.4)
        self.progressHUDError.indicatorView = JGProgressHUDErrorIndicatorView()
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if let decouverteArray = userDefaults.objectForKey("decouverte") {
            self.decouverteArray = decouverteArray as! [[String]]
        }
        self.connect(true, host: nil, withTimeout: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        if self.decouverteArray.count == 0 {
            self.navigationItem.leftBarButtonItem?.enabled = false
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if let ipAddress = userDefaults.stringForKey("ipAddress") {
            self.ipAddress = ipAddress
        }
        else {
            self.performSegueWithIdentifier("ShowAddress", sender: nil)
        }
    }
    
    override func viewDidDisappear(animated: Bool) {
        self.disconnect()
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func willRotateToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        self.collectionView.collectionViewLayout.invalidateLayout()
    }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        if !self.decouverteArray.isEmpty {
            self.collectionView.scrollToItemAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), atScrollPosition: UICollectionViewScrollPosition.Top, animated: false)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  MARK:   Navigation
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowAddress" {
            
        }
    }
    
    func unwindFromAddressViewController(segue: UIStoryboardSegue) {
        self.progressHUDSocket.textLabel.text = "Connexion"
        self.progressHUDSocket.showInView(self.navigationController?.view)
        let userDefaults = NSUserDefaults.standardUserDefaults()
        self.ipAddress = userDefaults.stringForKey("ipAddress")!
        self.connect(false, host: self.ipAddress, withTimeout: 5.0)
        self.readData(5.0, tag: TAG_CONNEXION)
    }
    
    
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  MARK:   func
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    func randomizeInterval(interval: NSTimeInterval, withVariance variance:Double) -> NSTimeInterval {
        let random = (Double(arc4random_uniform(1000)) - 500.0) / 500.0
        return interval + variance * random;
    }
    
    func refresh(refreshControl: UIRefreshControl) {
        self.refreshControl.endRefreshing()
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: true)
        if editing {
            self.navigationItem.rightBarButtonItem?.enabled = false
            self.navigationItem.leftBarButtonItem!.title = "Terminer"
            self.startWiggle(nil)
        }
        else {
            self.navigationItem.rightBarButtonItem?.enabled = true
            self.navigationItem.leftBarButtonItem!.title = "Modifier"
            self.stopWiggle(nil)
        }
        if self.decouverteArray.count == 0 {
            self.collectionView.reloadData()
        }
    }
    
    
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  MARK:   @IBAction
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    @IBAction func showActionSheet(sender: AnyObject) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        alertController.view.tintColor = UIColor(red: 61.0/255.0, green: 150.0/255.0, blue: 225.0/255.0, alpha: 1.0)
        let decouverteAction = UIAlertAction(title: "Découverte de l'installation", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.tag = TAG_DECOUVERTE
            self.progressHUDSocket.textLabel.text = "Découverte"
            self.progressHUDSocket.showInView(self.navigationController?.view)
            self.decouverteArray.removeAll()
            self.collectionView.reloadData()
            if self.GCDSocket.isDisconnected {
                self.connect(false, host: self.ipAddress, withTimeout: 5.0)
                self.readData(5.0, tag: TAG_NONE)
            }
            self.writeData("*#1*0##", withTimeout: 5.0, tag: TAG_DECOUVERTE_LUMIERES)
            self.readData(5.0, tag: TAG_DECOUVERTE_LUMIERES)
            self.writeData("*#2*0##", withTimeout: 5.0, tag: TAG_DECOUVERTE_VOLETS)
            self.readData(5.0, tag: TAG_DECOUVERTE_VOLETS)
        })
        let adresseAction = UIAlertAction(title: "Adresse du serveur domotique", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            if self.GCDSocket.isConnected {
                self.disconnect()
            }
            self.performSegueWithIdentifier("ShowAddress", sender: nil)
        })
        let annulerAction = UIAlertAction(title: "Annuler", style: .Cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            
        })
        alertController.addAction(decouverteAction)
        alertController.addAction(adresseAction)
        alertController.addAction(annulerAction)
        if let popoverController = alertController.popoverPresentationController {
            popoverController.barButtonItem = self.rightBarButtonItem
        }
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  MARK:   CocoaAsyncSocket
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    func connect(onlyGCDAsyncSocket: Bool, host: String?, withTimeout: NSTimeInterval?) {
        self.GCDSocket = GCDAsyncSocket(delegate: self, delegateQueue: dispatch_get_main_queue())
        if !onlyGCDAsyncSocket {
            do {
                UIApplication.sharedApplication().networkActivityIndicatorVisible = true
                try self.GCDSocket.connectToHost(host!, onPort: 20000, withTimeout: withTimeout!)
            }
            catch {
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                // print("ERROR connectToHost")
                print("Connexion avec le serveur domotique impossible")
                self.progressHUDSocket.dismiss()
            }
        }
    }
    
    func disconnect() {
        self.GCDSocket.setDelegate(nil, delegateQueue: nil)
        self.GCDSocket.disconnect()
    }
    
    func readData(withTimeout: NSTimeInterval, tag: Int) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        self.GCDSocket.readDataToData(ACK_DATA, withTimeout: withTimeout, tag: tag)
    }
    
    func writeData(dataString: String, withTimeout: NSTimeInterval, tag: Int) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        let data: NSData = dataString.dataUsingEncoding(NSASCIIStringEncoding, allowLossyConversion: false)!
        self.GCDSocket.writeData(data, withTimeout: withTimeout, tag: tag)
    }
    
    ///////////////////////////////////////////////////////
    //  MARK:   Delegate
    ///////////////////////////////////////////////////////
    
    func socket(sock: GCDAsyncSocket!, didConnectToHost host: String!, port: UInt16) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
    func socketDidDisconnect(sock: GCDAsyncSocket!, withError err: NSError!) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        // print("ERROR \(err.code) \(err.localizedDescription)")
        print("Connexion avec le serveur domotique impossible")
        self.progressHUDSocket.dismiss()
        /*
        switch(self.tag) {
        case TAG_CONNEXION:
            self.progressHUDSocket.dismiss()
        case TAG_DECOUVERTE:
            self.progressHUDSocket.dismiss()
        default: ()
        }
        */
        if err.code != 7 {
            self.progressHUDError.textLabel.text = err.localizedDescription
            // self.progressHUDError.textLabel.text = "Connexion avec le serveur domotique impossible"
            self.progressHUDError.showInView(self.navigationController?.view)
            self.progressHUDError.dismissAfterDelay(NSTimeInterval(3.0))
        }
        self.tag = TAG_NONE
    }
    
    func socket(sock: GCDAsyncSocket!, didReadData data: NSData!, withTag tag: Int) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        let message = String(data: data, encoding: NSASCIIStringEncoding)!
        print("TAG \(tag) READ \(message)")
        
        switch(tag) {
        case TAG_CONNEXION:
            if message == ACK {
                self.progressHUDSocket.dismiss()
            }
            else {
                
            }
            
        case TAG_DECOUVERTE_LUMIERES:
            if message.hasSuffix(ACK) {
                var messageList = message.componentsSeparatedByString("##")
                messageList.removeLast()
                messageList.removeLast()
                for var i = 0; i < messageList.count; i++ {
                    let temporaryArray = messageList[i].componentsSeparatedByString("*")
                    self.decouverteArray.append([temporaryArray[1], "Index \(temporaryArray.last!)", temporaryArray.last!])
                }
                self.decouverteLumieres = true
            }
            
        case TAG_DECOUVERTE_VOLETS:
            if message.hasSuffix(ACK) {
                var messageList = message.componentsSeparatedByString("##")
                messageList.removeLast()
                messageList.removeLast()
                for var i: Int = 0; i < messageList.count; i++ {
                    let temporaryArray = messageList[i].componentsSeparatedByString("*")
                    self.decouverteArray.append([temporaryArray[1], "Index \(temporaryArray.last!)", temporaryArray.last!])
                    // self.etatVolets.append(["\(temporaryArray.last!)", "1"])
                }
                self.decouverteVolets = true
            }
            
        case TAG_LUMIERE_ETEINDRE..<2000:
            if message.hasSuffix(ACK) {
                /*
                let cell = self.collectionView.cellForItemAtIndexPath(NSIndexPath(forRow: tag - 1000, inSection: 0))
                let cellLightOff = cell!.viewWithTag(10) as! UIImageView
                cellLightOff.image = UIImage(named: "CellLightOff")
                */
            }
            
        case TAG_LUMIERE_ALLUMER..<3000:
            if message.hasSuffix(ACK) {
                /*
                let cell = self.collectionView.cellForItemAtIndexPath(NSIndexPath(forRow: tag - 2000, inSection: 0))
                let cellLightOn = cell!.viewWithTag(10) as! UIImageView
                cellLightOn.image = UIImage(named: "CellLightOn")
                */
            }
            
        case TAG_VOLET_FERMER..<4000:
            if message.hasSuffix(ACK) {
                let cell = self.collectionView.cellForItemAtIndexPath(NSIndexPath(forRow: tag - 3000, inSection: 0))
                let cellShutterButton = cell!.viewWithTag(22) as! UIButton
                switch(cellShutterButton.titleLabel!.text!) {
                case "Fermer":
                    cellShutterButton.setTitle("Stop", forState: .Normal)
                case "Stop":
                    cellShutterButton.setTitle("Fermer", forState: .Normal)
                default: ()
                }
            }
            
        case TAG_VOLET_OUVRIR..<5000:
            if message.hasSuffix(ACK) {
                let cell = self.collectionView.cellForItemAtIndexPath(NSIndexPath(forRow: tag - 4000, inSection: 0))
                let cellShutterButton = cell!.viewWithTag(23) as! UIButton
                switch(cellShutterButton.titleLabel!.text!) {
                case "Ouvrir":
                    cellShutterButton.setTitle("Stop", forState: .Normal)
                case "Stop":
                    cellShutterButton.setTitle("Ouvrir", forState: .Normal)
                default: ()
                }
            }
            
        default: ()
        }
        if self.decouverteLumieres && self.decouverteVolets {
            self.decouverteArray.insert(["1", "Toutes", "100"], atIndex: 0)
            self.decouverteArray.insert(["2", "Tous", "200"], atIndex: 1)
            let userDefaults = NSUserDefaults.standardUserDefaults()
            userDefaults.setObject(self.decouverteArray, forKey: "decouverte")
            self.collectionView.reloadData()
            if self.decouverteArray.count != 0 {
                self.navigationItem.leftBarButtonItem?.enabled = true
            }
            self.decouverteLumieres = false
            self.decouverteVolets = false
            self.progressHUDSocket.dismiss()
        }
        self.tag = -1
    }
    
    func socket(sock: GCDAsyncSocket!, shouldTimeoutReadWithTag tag: Int, elapsed: NSTimeInterval, bytesDone length: UInt) -> NSTimeInterval {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        self.progressHUDError.textLabel.text = "Timeout! Read with tag: \(tag)"
        self.progressHUDError.showInView(self.navigationController?.view)
        self.progressHUDError.dismissAfterDelay(NSTimeInterval(3.0))
        return TIMEOUT_NONE
    }
    
    func socket(sock: GCDAsyncSocket!, didWriteDataWithTag tag: Int) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        print("TAG \(tag) WRITE")
    }
    
    func socket(sock: GCDAsyncSocket!, shouldTimeoutWriteWithTag tag: Int, elapsed: NSTimeInterval, bytesDone length: UInt) -> NSTimeInterval {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        self.progressHUDError.textLabel.text = "Timeout! Write with tag: \(tag)"
        self.progressHUDError.showInView(self.navigationController?.view)
        self.progressHUDError.dismissAfterDelay(NSTimeInterval(3.0))
        return TIMEOUT_NONE
    }
    
    
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  MARK:   DZNEmptyDataSet
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    func imageForEmptyDataSet(scrollView: UIScrollView!) -> UIImage! {
        return UIImage(named: "LogoDZNE")
    }
    
    func descriptionForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let attributes = [NSFontAttributeName: UIFont.boldSystemFontOfSize(18.0), NSForegroundColorAttributeName: UIColor(red: 189.0/255.0, green: 195.0/255.0, blue: 199.0/255.0, alpha: 1.0)]
        let attributedString = NSAttributedString(string: "Effectuez une découverte de votre installation pour recenser vos lumières et volets.", attributes: attributes)
        return attributedString
    }
    
    
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  MARK:   UICollectionView
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    ///////////////////////////////////////////////////////
    //  MARK:   @IBAction
    ///////////////////////////////////////////////////////
    
    @IBAction func lightOff(sender: UIButton) {
        if !editing {
            let cell: UICollectionViewCell = sender.superview!.superview as! UICollectionViewCell
            let indexPath: NSIndexPath = self.collectionView.indexPathForCell(cell)!
            let index = self.decouverteArray[indexPath.row][2]
            if Int(index) == 100 {
                for index in 0...9 {
                    if self.GCDSocket.isDisconnected {
                        self.connect(false, host: self.ipAddress, withTimeout: 5.0)
                        self.readData(5.0, tag: TAG_NONE)
                    }
                    self.writeData("*1*0*\(index)##", withTimeout: 5.0, tag: TAG_NONE)
                    self.readData(5.0, tag: TAG_NONE)
                }
            }
            else {
                if self.GCDSocket.isDisconnected {
                    self.connect(false, host: self.ipAddress, withTimeout: 5.0)
                    self.readData(5.0, tag: TAG_NONE)
                }
                self.writeData("*1*0*\(index)##", withTimeout: 5.0, tag: TAG_LUMIERE_ETEINDRE + indexPath.row)
                self.readData(5.0, tag: TAG_LUMIERE_ETEINDRE + indexPath.row)
            }
        }
    }
    
    @IBAction func lightOn(sender: UIButton) {
        if !editing {
            let cell: UICollectionViewCell = sender.superview!.superview as! UICollectionViewCell
            let indexPath: NSIndexPath = self.collectionView.indexPathForCell(cell)!
            let index = self.decouverteArray[indexPath.row][2]
            if Int(index) == 100 {
                for index in 0...9 {
                    if self.GCDSocket.isDisconnected {
                        self.connect(false, host: self.ipAddress, withTimeout: 5.0)
                        self.readData(5.0, tag: TAG_NONE)
                    }
                    self.writeData("*1*1*\(index)##", withTimeout: 5.0, tag: TAG_NONE)
                    self.readData(5.0, tag: TAG_NONE)
                }
            }
            else {
                if self.GCDSocket.isDisconnected {
                    self.connect(false, host: self.ipAddress, withTimeout: 5.0)
                    self.readData(5.0, tag: TAG_NONE)
                }
                self.writeData("*1*1*\(index)##", withTimeout: 5.0, tag: TAG_LUMIERE_ALLUMER + indexPath.row)
                self.readData(5.0, tag: TAG_LUMIERE_ALLUMER + indexPath.row)
            }
        }
    }
    
    @IBAction func shutterDown(sender: UIButton) {
        if !editing {
            let cell: UICollectionViewCell = sender.superview!.superview as! UICollectionViewCell
            let indexPath: NSIndexPath = self.collectionView.indexPathForCell(cell)!
            let index = self.decouverteArray[indexPath.row][2]
            var cellShutterButton = cell.viewWithTag(22) as! UIButton
            switch(cellShutterButton.titleLabel!.text!) {
            case "Fermer":
                if Int(index) == 200 {
                    for index in 0...9 {
                        if self.GCDSocket.isDisconnected {
                            self.connect(false, host: self.ipAddress, withTimeout: 5.0)
                            self.readData(5.0, tag: TAG_NONE)
                        }
                        if index == 0 {
                            self.writeData("*2*2*\(index)##", withTimeout: 5.0, tag: TAG_VOLET_FERMER + indexPath.row)
                            self.readData(5.0, tag: TAG_VOLET_FERMER + indexPath.row)
                        }
                        else {
                            self.writeData("*2*2*\(index)##", withTimeout: 5.0, tag: TAG_NONE)
                            self.readData(5.0, tag: TAG_NONE)
                        }
                    }
                }
                else {
                    if self.GCDSocket.isDisconnected {
                        self.connect(false, host: self.ipAddress, withTimeout: 5.0)
                        self.readData(5.0, tag: TAG_NONE)
                    }
                    self.writeData("*2*2*\(index)##", withTimeout: 5.0, tag: TAG_VOLET_FERMER + indexPath.row)
                    self.readData(5.0, tag: TAG_VOLET_FERMER + indexPath.row)
                }
                cellShutterButton = cell.viewWithTag(23) as! UIButton
                cellShutterButton.setTitle("Ouvrir", forState: .Normal)
                for (anIndexPathRow, aTimer) in self.timers {
                    if anIndexPathRow == indexPath.row {
                        aTimer.invalidate()
                        self.timers.removeValueForKey(anIndexPathRow)
                    }
                }
                self.timers[indexPath.row] = NSTimer.scheduledTimerWithTimeInterval(45.0, target: self, selector: "timerAction:", userInfo: [indexPath.row, cell, "Fermer"], repeats: false)
            case "Stop":
                if Int(index) == 200 {
                    for index in 0...9 {
                        if self.GCDSocket.isDisconnected {
                            self.connect(false, host: self.ipAddress, withTimeout: 5.0)
                            self.readData(5.0, tag: TAG_NONE)
                        }
                        if index == 0 {
                            self.writeData("*2*0*\(index)##", withTimeout: 5.0, tag: TAG_VOLET_FERMER + indexPath.row)
                            self.readData(5.0, tag: TAG_VOLET_FERMER + indexPath.row)
                        }
                        else {
                            self.writeData("*2*0*\(index)##", withTimeout: 5.0, tag: TAG_NONE)
                            self.readData(5.0, tag: TAG_NONE)
                        }
                    }
                }
                else {
                    self.writeData("*2*0*\(index)##", withTimeout: 5.0, tag: TAG_VOLET_FERMER + indexPath.row)
                    self.readData(5.0, tag: TAG_VOLET_FERMER + indexPath.row)
                }
            default: ()
            }
        }
    }
    
    @IBAction func shutterUp(sender: UIButton) {
        if !editing {
            let cell: UICollectionViewCell = sender.superview!.superview as! UICollectionViewCell
            let indexPath: NSIndexPath = self.collectionView.indexPathForCell(cell)!
            let index = self.decouverteArray[indexPath.row][2]
            var cellShutterButton = cell.viewWithTag(23) as! UIButton
            switch(cellShutterButton.titleLabel!.text!) {
            case "Ouvrir":
                if Int(index) == 200 {
                    for index in 0...9 {
                        if self.GCDSocket.isDisconnected {
                            self.connect(false, host: self.ipAddress, withTimeout: 5.0)
                            self.readData(5.0, tag: TAG_NONE)
                        }
                        if index == 0 {
                            self.writeData("*2*1*\(index)##", withTimeout: 5.0, tag: TAG_VOLET_OUVRIR + indexPath.row)
                            self.readData(5.0, tag: TAG_VOLET_OUVRIR + indexPath.row)
                        }
                        else {
                            self.writeData("*2*1*\(index)##", withTimeout: 5.0, tag: TAG_NONE)
                            self.readData(5.0, tag: TAG_NONE)
                        }
                    }
                }
                else {
                    if self.GCDSocket.isDisconnected {
                        self.connect(false, host: self.ipAddress, withTimeout: 5.0)
                        self.readData(5.0, tag: TAG_NONE)
                    }
                    self.writeData("*2*1*\(index)##", withTimeout: 5.0, tag: TAG_VOLET_OUVRIR + indexPath.row)
                    self.readData(5.0, tag: TAG_VOLET_OUVRIR + indexPath.row)
                }
                cellShutterButton = cell.viewWithTag(22) as! UIButton
                cellShutterButton.setTitle("Fermer", forState: .Normal)
                for (anIndexPathRow, aTimer) in self.timers {
                    if anIndexPathRow == indexPath.row {
                        aTimer.invalidate()
                        self.timers.removeValueForKey(anIndexPathRow)
                    }
                }
                self.timers[indexPath.row] = NSTimer.scheduledTimerWithTimeInterval(45.0, target: self, selector: "timerAction:", userInfo: [indexPath.row, cell, "Ouvrir"], repeats: false)
            case "Stop":
                if Int(index) == 200 {
                    for index in 0...9 {
                        if self.GCDSocket.isDisconnected {
                            self.connect(false, host: self.ipAddress, withTimeout: 5.0)
                            self.readData(5.0, tag: TAG_NONE)
                        }
                        if index == 0 {
                            self.writeData("*2*0*\(index)##", withTimeout: 5.0, tag: TAG_VOLET_OUVRIR + indexPath.row)
                            self.readData(5.0, tag: TAG_VOLET_OUVRIR + indexPath.row)
                        }
                        else {
                            self.writeData("*2*0*\(index)##", withTimeout: 5.0, tag: TAG_NONE)
                            self.readData(5.0, tag: TAG_NONE)
                        }
                    }
                }
                else {
                    self.writeData("*2*0*\(index)##", withTimeout: 5.0, tag: TAG_VOLET_OUVRIR + indexPath.row)
                    self.readData(5.0, tag: TAG_VOLET_OUVRIR + indexPath.row)
                }
            default: ()
            }
        }
    }
    
    func timerAction(timer: NSTimer) {
        let cell = timer.userInfo![1] as! UICollectionViewCell
        switch(timer.userInfo![2] as! String) {
        case "Fermer":
            let cellShutterButton = cell.viewWithTag(22) as! UIButton
            cellShutterButton.setTitle("Fermer", forState: .Normal)
        case "Ouvrir":
            let cellShutterButton = cell.viewWithTag(23) as! UIButton
            cellShutterButton.setTitle("Ouvrir", forState: .Normal)
        default: ()
        }
        for (anIndexPathRow, _) in self.timers {
            if anIndexPathRow == timer.userInfo![0] as! Int {
                self.timers.removeValueForKey(anIndexPathRow)
            }
        }
    }
    
    ///////////////////////////////////////////////////////
    //  MARK:   Gesture
    ///////////////////////////////////////////////////////
    
    func didLongPressCollectionView(gesture: UILongPressGestureRecognizer) {
        if editing {
            let location = gesture.locationInView(self.collectionView)
            self.movingIndexPath = self.collectionView.indexPathForItemAtPoint(location)
            switch(gesture.state) {
            case .Began:
                guard let indexPath = self.movingIndexPath else { return }
                self.collectionView.beginInteractiveMovementForItemAtIndexPath(indexPath)
                self.animatePickingUpCell(self.pickedUpCell())
            case .Changed:
                self.collectionView.updateInteractiveMovementTargetPosition(location)
            case .Ended:
                self.collectionView.endInteractiveMovement()
                let userDefaults = NSUserDefaults.standardUserDefaults()
                userDefaults.setObject(self.decouverteArray, forKey: "decouverte")
                self.animatePuttingDownCell(self.pickedUpCell())
                self.movingIndexPath = nil
            default:
                self.collectionView.cancelInteractiveMovement()
                self.animatePuttingDownCell(self.pickedUpCell())
                self.movingIndexPath = nil
            }
        }
    }
    
    func didSingleTapErase(gesture : UITapGestureRecognizer) {
        if editing {
            let pointInCollectionView: CGPoint = gesture.locationInView(self.collectionView)
            let indexPath: NSIndexPath = self.collectionView.indexPathForItemAtPoint(pointInCollectionView)!
            self.decouverteArray.removeAtIndex(indexPath.row)
            self.collectionView.deleteItemsAtIndexPaths([indexPath])
            let userDefaults = NSUserDefaults.standardUserDefaults()
            userDefaults.setObject(self.decouverteArray, forKey: "decouverte")
            if self.decouverteArray.count == 0 {
                self.setEditing(false, animated: true)
                self.navigationItem.leftBarButtonItem?.enabled = false
            }
        }
    }
    
    func didSingleTapLabel(gesture: UITapGestureRecognizer) {
        if editing {
            let pointInCollectionView: CGPoint = gesture.locationInView(self.collectionView)
            let indexPath: NSIndexPath = self.collectionView.indexPathForItemAtPoint(pointInCollectionView)!
            var nomTextField: UITextField?
            let alertController = UIAlertController(title: "Nouveau nom", message: nil, preferredStyle: .Alert)
            alertController.view.tintColor = UIColor(red: 61.0/255.0, green: 150.0/255.0, blue: 225.0/255.0, alpha: 1.0)
            let enregistrer = UIAlertAction(title: "Enregistrer", style: .Default, handler: {
                (action) -> Void in
                if !nomTextField!.text!.isEmpty {
                    self.decouverteArray[indexPath.row][1] = nomTextField!.text!
                    let userDefaults = NSUserDefaults.standardUserDefaults()
                    userDefaults.setObject(self.decouverteArray, forKey: "decouverte")
                    self.collectionView.reloadItemsAtIndexPaths([indexPath])
                }
            })
            let annuler = UIAlertAction(title: "Annuler", style: .Cancel) {
                (action) -> Void in
                
            }
            alertController.addAction(enregistrer)
            alertController.addAction(annuler)
            alertController.addTextFieldWithConfigurationHandler {
                (textField) -> Void in
                nomTextField = textField
                nomTextField?.placeholder = self.decouverteArray[indexPath.row][1]
            }
            presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    
    ///////////////////////////////////////////////////////
    //  MARK:   Delegate
    ///////////////////////////////////////////////////////
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.decouverteArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var cellReuseIdentifier: String = ""
        var labelTag: Int = 0
        let type = self.decouverteArray[indexPath.row][0]
        switch(type) {
        case "1":
            cellReuseIdentifier = "CellLight"
            labelTag = 11
        case "2":
            cellReuseIdentifier = "CellShutter"
            labelTag = 21
        default: ()
        }
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellReuseIdentifier, forIndexPath: indexPath)
        
        let label = cell.viewWithTag(labelTag) as! UILabel
        label.text = self.decouverteArray[indexPath.row][1]
        let singleTapGestureLabel: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "didSingleTapLabel:")
        singleTapGestureLabel.numberOfTapsRequired = 1
        singleTapGestureLabel.numberOfTouchesRequired = 1
        label.addGestureRecognizer(singleTapGestureLabel)
        
        let eraseImageView = cell.viewWithTag(9) as! UIImageView
        if editing {
            eraseImageView.hidden = false
        }
        else {
            eraseImageView.hidden = true
        }
        let singleTapGestureEraseImage: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "didSingleTapErase:")
        singleTapGestureEraseImage.numberOfTapsRequired = 1
        singleTapGestureEraseImage.numberOfTouchesRequired = 1
        eraseImageView.addGestureRecognizer(singleTapGestureEraseImage)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let size: CGSize = CGSizeMake(collectionView.frame.width - flowLayout.sectionInset.left - flowLayout.sectionInset.right, 80.0)
        return size
    }
    
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        if editing {
            self.startWiggle(cell)
        }
    }
    
    func collectionView(collectionView: UICollectionView, didEndDisplayingCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        if editing {
            self.stopWiggle(cell)
        }
    }
    
    func collectionView(collectionView: UICollectionView, moveItemAtIndexPath source: NSIndexPath, toIndexPath destination: NSIndexPath) {
        let array = self.decouverteArray.removeAtIndex(source.item)
        self.decouverteArray.insert(array, atIndex: destination.item)
    }
    
    
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  MARK:   Cell animations
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    func pickedUpCell() -> UICollectionViewCell? {
        guard let indexPath = self.movingIndexPath else { return nil }
        return self.collectionView.cellForItemAtIndexPath(indexPath)
    }
    
    func rotateCell(cell: UICollectionViewCell) {
        self.cellImageView = cell.viewWithTag(11)
        CATransaction.begin()
        CATransaction.setDisableActions(false)
        self.cellImageView!.layer.addAnimation(rotationAnimation360(), forKey: "rotation")
        CATransaction.commit()
    }
    
    func animateTapCell(cell: UICollectionViewCell) {
        UIView.animateWithDuration(0.1, delay: 0.0, options: [.AllowUserInteraction, .BeginFromCurrentState], animations: { () -> Void in
            cell.alpha = 0.7
            cell.transform = CGAffineTransformMakeScale(1.3, 1.3)
            }, completion: { finished in
                UIView.animateWithDuration(0.1, delay: 0.0, options: [.AllowUserInteraction, .BeginFromCurrentState], animations: { () -> Void in
                    cell.alpha = 1.0
                    cell.transform = CGAffineTransformIdentity
                    }, completion: { finished in
                        
                })
        })
    }
    
    func animatePickingUpCell(cell: UICollectionViewCell?) {
        UIView.animateWithDuration(0.1, delay: 0.0, options: [.AllowUserInteraction, .BeginFromCurrentState], animations: { () -> Void in
            self.stopWiggle(self.pickedUpCell())
            cell?.alpha = 0.7
            cell?.transform = CGAffineTransformMakeScale(1.3, 1.3)
            }, completion: { finished in
                
        })
    }
    
    func animatePuttingDownCell(cell: UICollectionViewCell?) {
        UIView.animateWithDuration(0.1, delay: 0.0, options: [.AllowUserInteraction, .BeginFromCurrentState], animations: { () -> Void in
            cell?.alpha = 1.0
            cell?.transform = CGAffineTransformIdentity
            }, completion: { finished in
                self.startWiggle(self.pickedUpCell())
        })
    }
    
    func startWiggle(cell: UICollectionViewCell?) {
        if cell == nil {
            for visibleCell in self.collectionView.visibleCells() {
                self.hideErase(visibleCell, hidden: false)
                self.addWiggleAnimationToCell(visibleCell as UICollectionViewCell)
            }
            self.isWiggling = true
        }
        else {
            self.hideErase(cell!, hidden: false)
            self.addWiggleAnimationToCell(cell! as UICollectionViewCell)
        }
    }
    
    func stopWiggle(cell: UICollectionViewCell?) {
        if cell == nil {
            for visibleCell in self.collectionView.visibleCells() {
                self.hideErase(visibleCell, hidden: true)
                visibleCell.layer.removeAllAnimations()
            }
            self.isWiggling = false
        }
        else {
            self.hideErase(cell!, hidden: true)
            cell!.layer.removeAllAnimations()
        }
    }
    
    func hideErase(cell: UICollectionViewCell, hidden: Bool) {
        let eraseImageView = cell.viewWithTag(9) as! UIImageView
        eraseImageView.hidden = hidden
    }
    
    func addWiggleAnimationToCell(cell: UICollectionViewCell) {
        CATransaction.begin()
        CATransaction.setDisableActions(false)
        cell.layer.addAnimation(rotationAnimation(), forKey: "rotation")
        cell.layer.addAnimation(bounceAnimation(), forKey: "bounce")
        CATransaction.commit()
    }
    
    func rotationAnimation360() -> CAKeyframeAnimation {
        let animation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        animation.values = [0.0, 2 * M_PI]
        animation.autoreverses = false
        animation.duration = 0.7
        animation.repeatCount = Float.infinity
        animation.beginTime = CACurrentMediaTime() + 0.5
        return animation
    }
    
    func rotationAnimation() -> CAKeyframeAnimation {
        let animation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        let angle = CGFloat(0.04)
        let duration = NSTimeInterval(0.1)
        let variance = Double(0.025)
        animation.values = [angle, -angle]
        animation.autoreverses = true
        animation.duration = self.randomizeInterval(duration, withVariance: variance)
        animation.repeatCount = Float.infinity
        return animation
    }
    
    func bounceAnimation() -> CAKeyframeAnimation {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.y")
        let bounce = CGFloat(3.0)
        let duration = NSTimeInterval(0.12)
        let variance = Double(0.025)
        animation.values = [bounce, -bounce]
        animation.autoreverses = true
        animation.duration = self.randomizeInterval(duration, withVariance: variance)
        animation.repeatCount = Float.infinity
        return animation
    }
    
    
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  MARK:   Debug
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    func showMessage(erreur: String) {
        var messageTextField: UITextField?
        let alertController = UIAlertController(title: "Réponse du serveur", message: "Merci de copier ce message et de l'envoyer pour debug ;)", preferredStyle: .Alert)
        alertController.view.tintColor = UIColor(red: 61.0/255.0, green: 150.0/255.0, blue: 225.0/255.0, alpha: 1.0)
        let ok = UIAlertAction(title: "OK", style: .Default, handler: {
            (action) -> Void in
            
        })
        alertController.addAction(ok)
        alertController.addTextFieldWithConfigurationHandler {
            (textField) -> Void in
            messageTextField = textField
            messageTextField?.text = erreur
        }
        presentViewController(alertController, animated: true, completion: nil)
    }
    
}
