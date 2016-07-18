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
    
    //MARK: - UI Components
    
    lazy var pictureButton: UIButton = {
        let _pictureButton = UIButton()
        
        _pictureButton.width = 66.0
        _pictureButton.height = 66.0
        _pictureButton.layer.cornerRadius = _pictureButton.width/2.0
        _pictureButton.autoresizingMask = [.FlexibleBottomMargin, .FlexibleTopMargin, .FlexibleLeftMargin, .FlexibleRightMargin]
        
        let attributedTitle = NSMutableAttributedString.YOcamera().iconSize(_pictureButton.width * 0.6)
        attributedTitle.fontColor = UIColor.whiteColor()
        _pictureButton.setAttributedTitle(attributedTitle, forState: .Normal)
        _pictureButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        _pictureButton.backgroundColor = UIColor.blackColor()
        _pictureButton.alpha = 0.7
        _pictureButton.addTarget(self, action: #selector(updatePicture), forControlEvents: .TouchUpInside)
        
        return _pictureButton
    }()
    
    private lazy var backgroundPicture: UIImageView = {
        let _backgroundPicture = UIImageView()
        _backgroundPicture.contentMode = .ScaleAspectFill
        _backgroundPicture.autoresizingMask = [.FlexibleBottomMargin, .FlexibleTopMargin, .FlexibleLeftMargin, .FlexibleRightMargin]
        
        let documentsUrl = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
        let imageUrl = documentsUrl.URLByAppendingPathComponent("test.png")
//        let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first! + "/" + fileName

        _backgroundPicture.image = UIImage(contentsOfFile: imageUrl.absoluteString)
        
        return _backgroundPicture
    }()
    
    //MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchToEditMode(nil)
        
        view.addSubview(backgroundPicture)
        backgroundPicture.frame = view.bounds
        
        view.addSubview(pictureButton)
        pictureButton.centerInSuperview()
        
    }
    
    //MARK: - Actions
    
    func switchToEditMode(sender: UIBarButtonItem?){
        isEditingMode = false
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Add", style: .Plain, target: self, action: #selector(displayOptions))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "OK", style: .Plain, target: self, action: #selector(switchToNormalMode))
        
        pictureButton.hidden = false
    }
    
    func switchToNormalMode(sender: UIBarButtonItem?){
        isEditingMode = false
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Options", style: .Plain, target: self, action: #selector(displayOptions))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Modifier", style: .Plain, target: self, action: #selector(switchToEditMode))
        
        pictureButton.hidden = true
    }
    
    func displayOptions(sender: UIBarButtonItem){
        
    }
    
    func addTrigger(sender: UIBarButtonItem){
        
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
        
        self.presentViewController(actionSheet, animated: true, completion: nil)
    }
    
    private func selectPicture(from: PictureFrom){
        let sourceType: UIImagePickerControllerSourceType = from == PictureFrom.Camera ? .Camera : .PhotoLibrary
        
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = sourceType
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }

    }
    
    
    //MARK: - Image Picker delegate
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        self.dismissViewControllerAnimated(true, completion: nil)
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        if let okImage = image {
            backgroundPicture.image = okImage
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
                let documentsURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
                let fileURL = documentsURL.URLByAppendingPathComponent("test.png")
                if let pngImageData = UIImagePNGRepresentation(okImage) {
                    pngImageData.writeToURL(fileURL, atomically: false)
                }
            }

        }
        

    }
}
