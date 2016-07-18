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
    
    //MARK: - UI Components
    
    lazy var glyphLabel: UILabel = {
        let _glyphLabel = UILabel()
        _glyphLabel.textColor = UIColor.whiteColor().colorWithAlphaComponent(0.7)

        return _glyphLabel
    }()

    
    //MARK: - View lifecycle
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(frame: CGRect, type: TriggerViewType) {
        super.init(frame: frame)
        
        layer.cornerRadius = height/2.0
        backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.7)
        
        glyphLabel.frame = bounds
        let glyph = type == .Light ? NSMutableAttributedString.YOlightbulbO() : NSMutableAttributedString.YOlistAlt()
        glyph.iconSize = height * 0.6
        
        self.addSubview(glyphLabel)
        
        
    }
    
    class func trigger(type: TriggerViewType) -> TriggerView{
        return TriggerView(frame: CGRect(x: 0, y: 0, width: 60, height: 60), type: type)
    }
}
