//
//  Profile_Picture_ViewController.swift
//  Chemowave
//
//  Created by zaktech on 6/2/16.
//  Copyright © 2016 Citrusbits. All rights reserved.
//

import UIKit
import MobileCoreServices

class Profile_Picture_ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate, RSKImageCropViewControllerDelegate,actionSheetViewDelegate {
    var actionSheet: CustomizableActionSheet?
    @IBOutlet weak var profileImageView: UIImageView!
    //var actionSheetDelegate: ActionSheetView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false
        self.title = "Profile Picture"
        let nextBtn = UIBarButtonItem(title: "Done", style: .Plain, target: self, action: #selector(doneProfilePicture))
        self.navigationItem.rightBarButtonItem = nextBtn
        self.navigationItem.rightBarButtonItem?.enabled = false
        // Do any additional setup after loading the view.
    }
  
    func doneProfilePicture(){
      
    }
    
       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
    @IBAction func showActionSheet(sender: UIButton) {
        var items = [CustomizableActionSheetItem]()
        // First view
        if let sampleView = UINib(nibName: "SampleView", bundle: nil).instantiateWithOwner(self, options: nil)[0] as? ActionSheetView {
            //sampleView.delegate = self
            let sampleViewItem = CustomizableActionSheetItem()
            sampleViewItem.type = .View
            sampleViewItem.view = sampleView
            sampleViewItem.height = 100
            items.append(sampleViewItem)
            sampleView.customActionSheetDelegate = self

        }
        
        // button
        let clearItem = CustomizableActionSheetItem()
        clearItem.type = .Button
        clearItem.label = "Cancel"
        clearItem.backgroundColor = UIColor(red: 1, green: 0.41, blue: 0.38, alpha: 1)
        clearItem.textColor = UIColor.whiteColor()
        clearItem.selectAction = { (actionSheet: CustomizableActionSheet) -> Void in
            self.view.backgroundColor = UIColor.whiteColor()
            actionSheet.dismiss()
        }
        items.append(clearItem)
        let actionSheet = CustomizableActionSheet()
        self.actionSheet = actionSheet
        actionSheet.showInView(self.view, items: items)
    }
    
    
    func takeAPhoto(){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            let imag = UIImagePickerController()
            imag.delegate = self
            imag.sourceType = UIImagePickerControllerSourceType.Camera;
            imag.mediaTypes = [kUTTypeImage as String]
            imag.allowsEditing = false
            self.presentViewController(imag, animated: true, completion: nil)
        }
    
    }

    func chooseFromCameraRoll(){
        if let actionSheet = self.actionSheet {
            actionSheet.dismiss()
        }
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .PhotoLibrary
        presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    
    // MARK: ImagePickerViewController Delegate Methods
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]){
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let imageCropperVC = RSKImageCropViewController(image: selectedImage, cropMode: .Circle)
        imageCropperVC.delegate = self
        self.navigationController?.pushViewController(imageCropperVC, animated: true)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    // MARK: RSKImageCropViewController Delegate Methods
    
    func imageCropViewControllerDidCancelCrop(controller: RSKImageCropViewController) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func imageCropViewController(controller: RSKImageCropViewController, didCropImage croppedImage: UIImage, usingCropRect cropRect: CGRect){
        let selecteImage = croppedImage
        self.profileImageView.image = selecteImage
        self.navigationController?.popViewControllerAnimated(true)
    }


}


