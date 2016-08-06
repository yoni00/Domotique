//
//  HomeViewController.swift
//  Domotique
//
//  Created by Yoni on 11/07/2016.
//  Copyright © 2016 Christophe Haguette. All rights reserved.
//

import UIKit
import AVFoundation

private enum PictureFrom : Int {
    
    case Camera
    case CameraRoll
}


class HomeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var isEditingMode = false
    var currentMovingTrigger: TriggerView?
    var triggers = [TriggerView]()

    //MARK: - UI Components
    
    private lazy var pictureButton: UIButton = {
        let _pictureButton = UIButton()
        
        _pictureButton.width = 66.0
        _pictureButton.height = 66.0
        _pictureButton.layer.cornerRadius = _pictureButton.width/2.0
        _pictureButton.layer.borderWidth = 2.0
        _pictureButton.layer.borderColor = UIColor.whiteColor().CGColor
        _pictureButton.autoresizingMask = [.FlexibleBottomMargin, .FlexibleTopMargin, .FlexibleLeftMargin, .FlexibleRightMargin]
        
        let attributedTitle = NSMutableAttributedString.YOcamera()
        attributedTitle.iconSize = _pictureButton.width * 0.6
        attributedTitle.fontColor = .whiteColor()
        _pictureButton.setAttributedTitle(attributedTitle, forState: .Normal)
        _pictureButton.setTitleColor(.whiteColor(), forState: .Normal)
        _pictureButton.backgroundColor = .redColor()
        _pictureButton.alpha = 0.7
        _pictureButton.addTarget(self, action: #selector(updatePicture), forControlEvents: .TouchUpInside)
        
        return _pictureButton
    }()
    
    private lazy var backgroundPicture: UIImageView = {
        let _backgroundPicture = UIImageView()
        _backgroundPicture.contentMode = .ScaleAspectFill
        _backgroundPicture.autoresizingMask = [.FlexibleBottomMargin, .FlexibleTopMargin, .FlexibleLeftMargin, .FlexibleRightMargin]
        
        _backgroundPicture.image = EGOCache.globalCache().imageForKey("test")
        
        return _backgroundPicture
    }()
    
    private lazy var lightExplanationView: TriggerExplanationView = {
        let _lightExplanationView = TriggerExplanationView.explanationOfType(.Light)
        _lightExplanationView.hidden = true
        return _lightExplanationView
    }()

    private lazy var shutterExplanationView: TriggerExplanationView = {
        let _shutterExplanationView = TriggerExplanationView.explanationOfType(.Light)
        _shutterExplanationView.hidden = true
        return _shutterExplanationView
    }()

    private lazy var panReco: UIPanGestureRecognizer = {
        let _panReco = UIPanGestureRecognizer(target: self, action: #selector(moveTrigger))

        return _panReco
    }()

    //MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = .None
        switchToNormalMode(nil)
        
        view.addSubview(backgroundPicture)
        backgroundPicture.frame = view.bounds
        
        view.addSubview(pictureButton)
        pictureButton.centerInSuperview()
        
        view.addSubview(shutterExplanationView)
        view.addSubview(lightExplanationView)
        
        let trigger1 = TriggerView.triggerOfType(.Shutter)
        trigger1.center = CGPoint(x: 100.0, y: 200.0)
        triggers.append(trigger1)
        view.addSubview(trigger1)
        
        let trigger2 = TriggerView.triggerOfType(.Light)
        trigger2.center = CGPoint(x: 200.0, y: 100.0)
        triggers.append(trigger2)
        view.addSubview(trigger2)
        
        
        
        view.addGestureRecognizer(panReco)
        
    }
    
    
    //MARK: - UI

    func displayExplanationForTrigger(triggerView: TriggerView){
        let explanationView = triggerView.type == .Light ? lightExplanationView : shutterExplanationView
        let margin: CGFloat = 8.0
        
        explanationView.centerY = triggerView.centerY
        if triggerView.x >= explanationView.width + 2 * margin {
            explanationView.right = triggerView.x - margin
        } else {
            explanationView.x = triggerView.right + margin
        }
        
        if explanationView.y < margin {
            explanationView.y = margin
        } else if explanationView.bottom > view.height - margin {
            explanationView.bottom = view.height - margin
        }
        
        explanationView.hidden = false
        explanationView.startAnimate()
    }
    
    func hideExplanations(){
        if !lightExplanationView.hidden {
            lightExplanationView.hidden = true
            lightExplanationView.stopAnimate()
        }
        
        if !shutterExplanationView.hidden {
            shutterExplanationView.hidden = true
            shutterExplanationView.stopAnimate()
            
        }
    }
    
    //MARK: - Actions
    
    func switchToEditMode(sender: UIBarButtonItem?){
        isEditingMode = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Add", style: .Plain, target: self, action: #selector(displayTriggerList))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "OK", style: .Plain, target: self, action: #selector(switchToNormalMode))
        
        pictureButton.hidden = false
        panReco.enabled = true
    }
    
    func switchToNormalMode(sender: UIBarButtonItem?){
        isEditingMode = false
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Options", style: .Plain, target: self, action: #selector(displaySettings))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Modifier", style: .Plain, target: self, action: #selector(switchToEditMode))
        
        pictureButton.hidden = true
        panReco.enabled = false
    }
    
    func displaySettings(sender: UIBarButtonItem){
        let navController = UINavigationController(rootViewController: SettingsViewController())
        presentViewController(navController, animated: true, completion: nil)
    }
    
    func displayTriggerList(sender: UIBarButtonItem){
        navigationController?.pushViewController(TriggerListViewController(), animated: true)
    }
    
    func updatePicture(sender :UIButton){
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Prendre photo", style: UIAlertActionStyle.Default, handler: { (action) in
            self.selectPicture(.Camera)
        }))
        actionSheet.addAction(UIAlertAction(title: "Pellicule", style: UIAlertActionStyle.Default, handler: { (action) in
            self.selectPicture(.CameraRoll)
        }))
        actionSheet.addAction(UIAlertAction(title: "Annuler", style: UIAlertActionStyle.Cancel, handler: { (action) in
            self.dismissViewControllerAnimated(true, completion: nil)
        }))
        
        presentViewController(actionSheet, animated: true, completion: nil)
    }
    
    private func selectPicture(from: PictureFrom){
        let sourceType: UIImagePickerControllerSourceType = from == PictureFrom.Camera ? .Camera : .PhotoLibrary
        
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = sourceType
            presentViewController(imagePicker, animated: true, completion: nil)
        }

    }
    
    func moveTrigger(panReco: UIPanGestureRecognizer){
        struct Temp { static var startPoint = CGPoint(x: 0.0, y: 0.0) }

        if let touchedTrigger = currentMovingTrigger{
            
            let location = panReco.locationInView(view)
            
            switch panReco.state {
                
            case .Began:
                Temp.startPoint.x = touchedTrigger.centerX - location.x
                Temp.startPoint.y = touchedTrigger.centerY - location.y
            case .Changed:
                touchedTrigger.centerX = location.x + Temp.startPoint.x
                touchedTrigger.centerY = location.y + Temp.startPoint.y
                
                // Bounding the trigger into the screen

                if touchedTrigger.bottom > view.height {
                    touchedTrigger.bottom = view.height
                } else if touchedTrigger.y < 0 {
                    touchedTrigger.y = 0
                }

                if touchedTrigger.right > view.width {
                    touchedTrigger.right = view.width
                } else if touchedTrigger.x < 0 {
                    touchedTrigger.x = 0
                }


            case .Ended, .Cancelled, .Failed:
                currentMovingTrigger = nil
            default:
                break
            }
        }
    }
    
    
    
    //MARK: - Image Picker delegate
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        dismissViewControllerAnimated(true, completion: nil)
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        if let okImage = image {
            backgroundPicture.image = okImage
            
            QueueManager.queueForPictureManagement().addOperationWithBlock({ 
                EGOCache.globalCache().setImage(okImage, forKey: "test")
            })
        }
        

    }
    
    
    //MARK: - UI view controller delegate

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touchedView = touches.first?.view{
            if touchedView.isKindOfClass(TriggerView) {
                if isEditingMode {
                    currentMovingTrigger = touchedView as? TriggerView
                } else {
                    hideExplanations()
                    displayExplanationForTrigger(touchedView as! TriggerView )
                }
            }
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        hideExplanations()
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        hideExplanations()
    }
    

}

