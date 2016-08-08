//
//  TriggerCell.swift
//  Domotique
//
//  Created by Yoni on 31/07/2016.
//  Copyright © 2016 Christophe Haguette. All rights reserved.
//

import UIKit

class TriggerCell: UITableViewCell {

    //MARK: - UI Components
    
    lazy var iconButton: UIButton = {
        let _iconButton = UIButton()
        return _iconButton
    }()

    lazy var upButton: UIButton = {
        let _upButton = UIButton()
        _upButton.setContentHuggingPriority(UILayoutPriorityDefaultLow, forAxis: .Horizontal)
        return _upButton
    }()

    lazy var downButton: UIButton = {
        let _downButton = UIButton()
        _downButton.setContentHuggingPriority(UILayoutPriorityDefaultLow, forAxis: .Horizontal)

        return _downButton
    }()

    lazy var okButton : UIButton = {
        let _okButton = UIButton()
        let okIcon = NSMutableAttributedString.YOplusCircle()
        okIcon.iconSize = 30.0
        okIcon.fontColor = UIColor.standardBlue
        _okButton.setAttributedTitle(okIcon, forState: .Normal)
        return _okButton
    }()

    //MARK: - View lifecycle
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(iconButton)
        contentView.addSubview(upButton)
        contentView.addSubview(downButton)
        contentView.addSubview(okButton)
        
        for view in contentView.subviews {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let views = [
            "iconButton" : iconButton,
            "upButton" : upButton,
            "downButton" : downButton,
            "okButton" : okButton,
        ]
        
        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-10-[iconButton]-10-[upButton]-10-[downButton(==upButton)]-10-[okButton]-10-|",
            options: .AlignAllCenterY,
            metrics: nil,
            views: views))
        
        contentView.addConstraint(NSLayoutConstraint(
            item: iconButton,
            attribute: .CenterY,
            relatedBy: .Equal,
            toItem: contentView,
            attribute: .CenterY,
            multiplier: 1.0,
            constant: 0.0))
        
    }
    

    //MARK: - Getters and Setters
    var internalType: TriggerType?
    var type: TriggerType? {
        get {
            return internalType
        }
        set {
            if let newType = newValue {
                let iconType = TriggerHelper.iconForType(newType)
                iconType.iconSize = 30.0
                iconType.fontColor = .blackColor()
                iconButton.setAttributedTitle(iconType, forState: .Normal)
                
                let upIcon: NSMutableAttributedString
                let downIcon: NSMutableAttributedString
                
                if newType == .Light {
                    upIcon = NSMutableAttributedString(string: "ON")
                    downIcon = NSMutableAttributedString(string: "OFF")
                } else {
                    upIcon = NSMutableAttributedString.YOarrowCircleUp()
                    downIcon = NSMutableAttributedString.YOarrowCircleDown()
                }
                
                upIcon.iconSize = 30.0
                upIcon.fontColor = UIColor.standardBlue
                upButton.setAttributedTitle(upIcon, forState: .Normal)

                downIcon.iconSize = 30.0
                downIcon.fontColor = UIColor.standardBlue
                downButton.setAttributedTitle(downIcon, forState: .Normal)

            }
        }
    }

    
}
