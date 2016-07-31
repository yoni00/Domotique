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
    
    lazy var iconLabel: UILabel = {
        let _iconLabel = UILabel()
        _iconLabel.textColor = .blueColor()
        return _iconLabel
    }()
    
    //MARK: - View lifecycle
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
    }
    
}
