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
    static let clickableColor = UIColor(colorLiteralRed: 3.0/255, green: 169.0/255, blue: 244.0/255, alpha: 1.0)
}


class TriggerHelper {
    class func iconForType(type: TriggerType) -> NSMutableAttributedString {
        return (type == .Light) ? TriggerConstants.lightIcon : TriggerConstants.shutterIcon
    }
}
