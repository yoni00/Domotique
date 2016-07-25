//
//  TriggerExplanationView.swift
//  Domotique
//
//  Created by Yoni on 25/07/2016.
//  Copyright © 2016 Christophe Haguette. All rights reserved.
//

import UIKit

class TriggerExplanationView: UIView {

    //MARK: - UI Components
    
    lazy var upArrowLabel: UILabel = {
        let _upArrowLabel = UILabel()
        var upIcon = NSMutableAttributedString.YOchevronUp()
        upIcon.iconSize = 30.0
        _upArrowLabel.attributedText = upIcon
        _upArrowLabel.textAlignment = .Center
        _upArrowLabel.textColor = UIColor.blackColor().colorWithAlphaComponent(0.7)
        
        return _upArrowLabel
    }()

    lazy var downArrowLabel: UILabel = {
        let _downArrowLabel = UILabel()
        var downIcon = NSMutableAttributedString.YOchevronDown()
        downIcon.iconSize = 30.0
        _downArrowLabel.attributedText = downIcon
        _downArrowLabel.textAlignment = .Center
        _downArrowLabel.textColor = UIColor.blackColor().colorWithAlphaComponent(0.7)
        
        return _downArrowLabel
    }()

    //MARK: - View lifecycle

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(frame: CGRect, type: TriggerViewType) {
        super.init(frame: frame)
        
        layer.cornerRadius = width/2.0
        backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.7)
        
        upArrowLabel.width = width
        upArrowLabel.height = width
        addSubview(upArrowLabel)

        downArrowLabel.width = width
        downArrowLabel.height = width
        downArrowLabel.bottom = height
        addSubview(downArrowLabel)
}
    

    class func explanationOfType(type: TriggerViewType) -> TriggerExplanationView{
        return TriggerExplanationView(frame: CGRect(x: 0, y: 0, width: 44, height: 120), type: type)
    }
}
