//
//  TriggerHelper.swift
//  Domotique
//
//  Created by Yoni on 31/07/2016.
//  Copyright © 2016 Christophe Haguette. All rights reserved.
//

import Foundation

enum TriggerType {
    case Shutter
    case Light
}

struct TriggerElement{
    var type: TriggerType?
}

struct TriggerConstants{
    static let triggerCellIdentifier = "triggerCell"
    static let lightIcon = NSMutableAttributedString.YOlightbulbO()
    static let shutterIcon = NSMutableAttributedString.YOlistAlt()
}


class TriggerHelper {
    class func iconForType(type: TriggerType) -> NSMutableAttributedString {
        return (type == .Light) ? TriggerConstants.lightIcon : TriggerConstants.shutterIcon
    }
}
