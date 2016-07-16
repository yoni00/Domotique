//
//  HomeViewController.swift
//  Domotique
//
//  Created by Yoni on 11/07/2016.
//  Copyright © 2016 Christophe Haguette. All rights reserved.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController {
    var isEditingMode = false
    
    lazy var captureSession: AVCaptureSession = {
        let _captureSession = AVCaptureSession()
        _captureSession.sessionPreset = AVCaptureSessionPresetHigh
        
        return _captureSession
    }()
    
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
    
    lazy var backgroundPicture: UIImageView = {
        let _backgroundPicture = UIImageView()
        _backgroundPicture.contentMode = .ScaleAspectFill
        _backgroundPicture.autoresizingMask = [.FlexibleBottomMargin, .FlexibleTopMargin, .FlexibleLeftMargin, .FlexibleRightMargin]
        
        return _backgroundPicture
    }()
    
    //MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchToEditMode(nil)
        
        view.addSubview(pictureButton)
        pictureButton.centerInSuperview()
        
        view.addSubview(backgroundPicture)
        backgroundPicture.frame = view.bounds
        
        
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
        
    }
}
