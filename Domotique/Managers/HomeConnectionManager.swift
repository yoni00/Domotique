//
//  HomeConnectionManager.swift
//  Domotique
//
//  Created by ysoleiman on 02/08/2016.
//  Copyright © 2016 Christophe Haguette. All rights reserved.
//

import Foundation
import CocoaAsyncSocket

private let kLocalIpAddressKey = "kLocalIpAddress"

class HomeConnectionManager: GCDAsyncSocketDelegate{
    static let sharedInstance = HomeConnectionManager()
    var host: String? {
        didSet{
            NSUserDefaults.standardUserDefaults().setObject(host, forKey: kLocalIpAddressKey)
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    
    var timeout = 5.0
    
    private var asyncSocket: GCDAsyncSocket?
    
    
    private init(){
       host = NSUserDefaults.standardUserDefaults().objectForKey(kLocalIpAddressKey) as? String
    }
    
    func connect() {
        asyncSocket = GCDAsyncSocket(delegate: self, delegateQueue: dispatch_get_main_queue())
        do {
            UIApplication.sharedApplication().networkActivityIndicatorVisible = true
            try asyncSocket!.connectToHost(host!, onPort: 20000, withTimeout: timeout)
        }
        catch {
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            // print("ERROR connectToHost")
            print("Connexion avec le serveur domotique impossible")
        }
    }
    
    
    func disconnect() {
        if let _asyncSocket = asyncSocket {
            _asyncSocket.setDelegate(nil, delegateQueue: nil)
            _asyncSocket.disconnect()
        }
    }
    
    func readData(withTimeout: NSTimeInterval, tag: Int) {
        if let _asyncSocket = asyncSocket {
            UIApplication.sharedApplication().networkActivityIndicatorVisible = true
            _asyncSocket.readDataToData(ACK_DATA, withTimeout: withTimeout, tag: tag)
        }
    }
    
    func writeData(dataString: String, tag: Int) {
        if let _asyncSocket = asyncSocket {
            UIApplication.sharedApplication().networkActivityIndicatorVisible = true
            let data: NSData = dataString.dataUsingEncoding(NSASCIIStringEncoding, allowLossyConversion: false)!
            _asyncSocket.writeData(data, withTimeout: timeout, tag: tag)
        }
    }


}
