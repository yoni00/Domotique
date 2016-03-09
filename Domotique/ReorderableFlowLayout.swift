//
//  ReorderableFlowLayout.swift
//  Domotique
//
//  Created by CHRISTOPHE HAGUETTE on 02/02/2016.
//  Copyright © 2016 Christophe Haguette. All rights reserved.
//

import UIKit

class ReorderableFlowLayout: UICollectionViewFlowLayout {

    override func layoutAttributesForInteractivelyMovingItemAtIndexPath(indexPath: NSIndexPath, withTargetPosition position: CGPoint) -> UICollectionViewLayoutAttributes {
        let attributes = super.layoutAttributesForInteractivelyMovingItemAtIndexPath(indexPath, withTargetPosition: position)
        attributes.alpha = 0.7
        attributes.transform = CGAffineTransformMakeScale(1.3, 1.3)
        return attributes
    }
    
}
