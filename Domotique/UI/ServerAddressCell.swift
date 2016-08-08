//
//  ServerAddressCell.swift
//  Domotique
//
//  Created by ysoleiman on 04/08/2016.
//  Copyright © 2016 Christophe Haguette. All rights reserved.
//

import UIKit

class ServerAddressCell: UITableViewCell{

    lazy var titleLabel : UILabel = {
        let  _titleLabel = UILabel()
        _titleLabel.text = "IP serveur:"
        _titleLabel.font = .boldSystemFontOfSize(12.0)
        _titleLabel.textColor = .darkGrayColor()
        return _titleLabel
    }()

    lazy var textField : UITextField = {
        let  _textField = UITextField()
        _textField.placeholder = "192.168.1.1"
        _textField.font = .systemFontOfSize(17.0, weight: 20.0)
        _textField.textColor = .blackColor()
        _textField.keyboardType = UIKeyboardType.DecimalPad
        return _textField
    }()

    //MARK: - View lifecycle
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor.whiteColor()
        contentView.addSubview(titleLabel)
        contentView.addSubview(textField)
        
        for view in contentView.subviews {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let views = [
            "titleLabel" : titleLabel,
            "textField" : textField,
            ]
        
        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-8-[titleLabel]-10-[textField]-8-|",
            options: .AlignAllCenterY,
            metrics: nil,
            views: views))
        
        contentView.addConstraint(NSLayoutConstraint(
            item: titleLabel,
            attribute: .CenterY,
            relatedBy: .Equal,
            toItem: contentView,
            attribute: .CenterY,
            multiplier: 1.0,
            constant: 0.0))
        
    }

}
