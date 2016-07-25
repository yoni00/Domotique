//
//  UIView+Helpers.swift
//  Domotique
//
//  Created by Yoni on 12/07/2016.
//  Copyright © 2016 Christophe Haguette. All rights reserved.
//

import UIKit

extension UIView{
    
    var origin: CGPoint {
        set {
            var newFrame = self.frame
            newFrame.origin = newValue
            self.frame = newFrame
        }
        get {
            return self.frame.origin
        }
    }

    var x: CGFloat {
        set {
            var newFrame = self.frame
            newFrame.origin.x = newValue
            self.frame = newFrame
        }
        get {
            return self.frame.origin.x
        }
    }

    var y: CGFloat {
        set {
            var newFrame = self.frame
            newFrame.origin.y = newValue
            self.frame = newFrame
        }
        get {
            return self.frame.origin.y
        }
    }
    
    var right: CGFloat {
        set {
            var newFrame = self.frame
            newFrame.origin.x = newValue - self.frame.size.width
            self.frame = newFrame
        }
        get {
            return self.frame.origin.x + self.frame.size.width
        }
    }

    var bottom: CGFloat {
        set {
            var newFrame = self.frame
            newFrame.origin.y = newValue - self.frame.size.height
            self.frame = newFrame
        }
        get {
            return self.frame.origin.y + self.frame.size.height
        }
    }

    var size: CGSize {
        set {
            var newFrame = self.frame
            newFrame.size = newValue
            self.frame = newFrame
        }
        get {
            return self.frame.size
        }
    }

    var width: CGFloat {
        set {
            var newFrame = self.frame
            newFrame.size.width = newValue
            self.frame = newFrame
        }
        get {
            return self.frame.size.width
        }
    }

    var height: CGFloat {
        set {
            var newFrame = self.frame
            newFrame.size.height = newValue
            self.frame = newFrame
        }
        get {
            return self.frame.size.height
        }
    }

    var centerX: CGFloat {
        set {
            center = CGPointMake(newValue, self.center.y)
        }
        get {
            return self.center.x
        }
    }

    var centerY: CGFloat {
        set {
            center = CGPointMake(self.center.x, newValue)
        }
        get {
            return self.center.y
        }
    }
    
    func centerInSuperview(){
        if let _superview = superview{
            center = CGPointMake(_superview.width/2, _superview.height/2);
        }
    }
    
    func snapShot() -> UIImage{
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0);
        let ctx = UIGraphicsGetCurrentContext();
        
        if let _ctx = ctx {
            layer.renderInContext(_ctx)
        }
        
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image;
    }
    
    class func windowHeight() -> CGFloat?{
        return UIApplication.sharedApplication().keyWindow?.height;
    }

    class func windowWidth() -> CGFloat?{
        return UIApplication.sharedApplication().keyWindow?.width;
    }
    
//    class func isBigScreen() -> Bool?{
//        
//        if let width = UIApplication.sharedApplication().keyWindow?.width{
//            if let height = UIApplication.sharedApplication().keyWindow?.height{
//
//            }
//        }
//        
//        min(width, height)
//        return min(UIApplication.sharedApplication().keyWindow?.width, UIApplication.sharedApplication().keyWindow?.height) >= 360;
//    }

}
