//
//  AddressViewController.swift
//  Domotique
//
//  Created by CHRISTOPHE HAGUETTE on 09/03/2016.
//  Copyright © 2016 Christophe Haguette. All rights reserved.
//

import UIKit

class AddressViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  MARK:   variables
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    var pickerViewData: [String] = []
    var ipAddress: String = ""
    
    
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  MARK:   initialisation
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for var i = 0; i < 256; i++ {
            self.pickerViewData.append("\(i)")
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if let ipAddress = userDefaults.stringForKey("ipAddress") {
            self.ipAddress = ipAddress
            self.pickerViewShowIp(self.ipAddress)
        }
        else {
            self.pickerViewShowIp("192.168.1.1")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  MARK:   @IBAction
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    @IBAction func touchUpInsideContinuerButton(sender: AnyObject) {
        self.ipAddress = ""
        for var i = 0; i < 4; i++ {
            self.ipAddress += self.pickerViewData[self.pickerView.selectedRowInComponent(i)] + "."
        }
        self.ipAddress = String(self.ipAddress.characters.dropLast())
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(self.ipAddress, forKey: "ipAddress")
        self.performSegueWithIdentifier("HideAddress", sender: nil)
    }
    
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  MARK:   UIPickerView
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleForRow = self.pickerViewData[row]
        let attributedString = NSAttributedString(string: titleForRow, attributes: [NSFontAttributeName:UIFont.systemFontOfSize(17.0),NSForegroundColorAttributeName:UIColor.whiteColor()])
        return attributedString
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 4
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerViewData.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.pickerViewData[row]
    }
    
    func pickerViewShowIp(ipAddress: String) {
        let array = ipAddress.componentsSeparatedByString(".")
        for var i = 0; i < 4; i++ {
            self.pickerView.selectRow(Int(array[i])!, inComponent: i, animated: true)
        }
    }

}
