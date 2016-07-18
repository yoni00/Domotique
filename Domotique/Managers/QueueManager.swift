//
//  QueueManager.swift
//  Domotique
//
//  Created by ysoleiman on 18/07/2016.
//  Copyright © 2016 Christophe Haguette. All rights reserved.
//

import Foundation

enum QueueManagerQueueName {
    case PictureManagement
}


class QueueManager{
    static var globalQueues = [QueueManagerQueueName: NSOperationQueue]()
    
    class func queueForPictureManagement() -> NSOperationQueue{
        return queueForName(.PictureManagement, maxConcurrency: 1)
    }
    
    
    class func queueForName(name: QueueManagerQueueName, maxConcurrency: Int) -> NSOperationQueue{
        var queue = globalQueues[name]
        
        if queue == nil{
            queue = NSOperationQueue()
            queue?.maxConcurrentOperationCount = maxConcurrency
            globalQueues[name] = queue
        }
        
        return queue!
    }

}
