//
//  TriggerView.swift
//  Domotique
//
//  Created by Yoni on 18/07/2016.
//  Copyright © 2016 Christophe Haguette. All rights reserved.
//

import UIKit

enum TriggerViewType {
    case Shutter
    case Light
}

class TriggerView: UIView {
    
    var enabled: Bool {
        get {
            return swipeReco.enabled
        }
        set {
            swipeReco.enabled = newValue
        }
    }
    
    let type: TriggerViewType
    
    //MARK: - UI Components
    
    lazy var iconLabel: UILabel = {
        let _iconLabel = UILabel()
        _iconLabel.textColor = UIColor.whiteColor().colorWithAlphaComponent(0.7)
        _iconLabel.textAlignment = .Center

        return _iconLabel
    }()
    
    private lazy var swipeReco: UISwipeGestureRecognizer = {
        var _swipeReco: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(triggerAction))
        _swipeReco.direction = [UISwipeGestureRecognizerDirection.Up, UISwipeGestureRecognizerDirection.Down]
        return _swipeReco
    }()

    
    //MARK: - View lifecycle
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(frame: CGRect, type: TriggerViewType) {
        self.type = type

        super.init(frame: frame)
        
        layer.cornerRadius = height/2.0
        backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.7)
        
        iconLabel.frame = bounds
        let icon = type == .Light ? NSMutableAttributedString.YOlightbulbO() : NSMutableAttributedString.YOlistAlt()
        icon.iconSize = height * 0.6
        iconLabel.attributedText = icon
        
        self.addSubview(iconLabel)
        
        self.addGestureRecognizer(swipeReco)
    }
    
    class func triggerOfType(type: TriggerViewType) -> TriggerView{
        return TriggerView(frame: CGRect(x: 0, y: 0, width: 60, height: 60), type: type)
    }
    
    func triggerAction(swipeReco: UISwipeGestureRecognizer){
//        switch swipeReco.direction {
//        case .Up:
//        
//        case .Down: 
//        
//        default:
//            <#code#>
//        }

    }
}
