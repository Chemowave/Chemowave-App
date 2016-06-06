//
//  AddContactsViewController.swift
//  Chemowave
//
//  Created by zaktech on 01/06/2016.
//  Copyright © 2016 Citrusbits. All rights reserved.
//

import UIKit

enum phoneLabels {
    case Main
    case Home
    case Mobile
    case Work
}

protocol AddContactsVCDelegate {
    
    func didCancelButtonTapped() ->()
    func didSaveTreatmentHospitalInfo(contentObj:Contacts)->()
    func didSavePharmacyInfo(contentObj:Contacts) -> ()
    func didSavePrimaryDoctorInfo(contentObj:Contacts) -> ()
    func didSavePersonalContactInfor(contentObj:Contacts) -> ()
}


class AddContactsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ListPickerDelegate, ContactsTableViewCellDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, RSKImageCropViewControllerDelegate {
    
    var titleString: String?
    var contactObj: Contacts?
    var selectedIndexPath: NSIndexPath?
    let phoneCount = 3
    let notesCount = 10
    var rowsForSectionZeroCount = 4
    var rowsForSectionNotesCount = 0
    
    var customDelegate : AddContactsVCDelegate?
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: CustomImageView!
    @IBOutlet weak var footerViewForPhone: UIView!
    @IBOutlet weak var footerViewLabelForPhone: UILabel!
    @IBOutlet weak var footerViewForNote: UIView!
    @IBOutlet weak var footerViewLabelForNote: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = titleString
        
        let saveButton = UIBarButtonItem(title: "Save", style: .Plain, target: self, action: #selector(saveButtonTapped))
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .Plain, target: self, action: #selector(cancelButtonTapped))
        self.navigationItem.leftBarButtonItem = cancelButton
        self.navigationItem.rightBarButtonItem = saveButton
        self.navigationItem.rightBarButtonItem?.enabled = false
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - UITable Delegate Methods.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let sectionCount = section == 0 ? rowsForSectionZeroCount : rowsForSectionNotesCount
        
        return sectionCount
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        var footerView = UIView()
        
        if section == 0 {
            footerView = footerViewForPhone
        }
        else if section == 1 {
            footerView = footerViewForNote
        }
        return footerView
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return 2
    }
    
    func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = UITableViewCell()
        
        if indexPath.section == 0 {
            
            switch indexPath.row {
            case 0:
                let simpleCell = tableView.dequeueReusableCellWithIdentifier("simpleCell", forIndexPath: indexPath)
                
                let textField = simpleCell.contentView.viewWithTag(1567) as! UITextField
                if textField.text?.isEmpty == true {
                    textField.placeholder = "Name"
                }
                return simpleCell
                
            case 1:
                let simpleCell = tableView.dequeueReusableCellWithIdentifier("simpleCell", forIndexPath: indexPath)
                let textField = simpleCell.contentView.viewWithTag(1567) as! UITextField
                if textField.text?.isEmpty == true {
                    textField.placeholder = "Address"
                }
                return simpleCell
            case 2:
                let simpleCell = tableView.dequeueReusableCellWithIdentifier("simpleCell", forIndexPath: indexPath)
                let textField = simpleCell.contentView.viewWithTag(1567) as! UITextField
                if textField.text?.isEmpty == true {
                    textField.placeholder = "Email"
                }
                return simpleCell
                
            case 3,4,5:
                let contactCell = tableView.dequeueReusableCellWithIdentifier("ContactsTableViewCell", forIndexPath: indexPath) as! ContactsTableViewCell
                contactCell.titleButton.setTitle("Main", forState: .Normal)
                contactCell.titleButton.tag = indexPath.row
                contactCell.cellDelegate = self
                contactCell.showDisclosureImage = true
                return contactCell
            default:
                break
            }
        }
            
        else if indexPath.section == 1 {
            // Notes section
            let notesCell = tableView.dequeueReusableCellWithIdentifier("simpleCell", forIndexPath: indexPath)
            let textField = notesCell.contentView.viewWithTag(1567) as! UITextField
            if textField.text?.isEmpty == true {
                textField.placeholder = "Notes"
            }
           return notesCell
        }
        
       return cell
    }
    
    //MARK: -ContactsTableViewCellDelegate
    func titleButtonTapped(cell: ContactsTableViewCell) {
        
        let indexPath = self.tableView.indexPathForCell(cell)
        self.selectedIndexPath = indexPath
        print(self.selectedIndexPath)
        
        let listPickerVC = UIStoryboard.init(name: "Contacts", bundle: nil).instantiateViewControllerWithIdentifier("ListPickerViewController") as! ListPickerViewController
        listPickerVC.listDelegate = self
        listPickerVC.selectedItem = cell.titleButton.titleLabel?.text
        self.navigationController?.push(viewController: listPickerVC)
    }
    
    
    // MARK: - ListPickerDelegate
    func didSelectItemFromList(selectedItem: String) {
        print(selectedItem)
        
        let cell = self.tableView.cellForRowAtIndexPath(self.selectedIndexPath!) as? ContactsTableViewCell
        cell?.titleButton.setTitle(selectedItem, forState: .Normal)
    }
    
    // MARK: - TapGesture Methods
    @IBAction func takePicture(sender: UITapGestureRecognizer) {
        print("Take Picture now")
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .PhotoLibrary
        presentViewController(imagePickerController, animated: true, completion: nil)

    }
    
    @IBAction func addPhoneViewTapped(sender: UITapGestureRecognizer) {
        print("Add Phone Number View Tapped")
        
        rowsForSectionZeroCount += 1
        if rowsForSectionNotesCount > 6 {
            // Present an Alert
        }
        else {
            self.tableView.beginUpdates()
            self.tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: rowsForSectionZeroCount-1, inSection: 0)],withRowAnimation: .Automatic)
            self.tableView.endUpdates()
        }
    }
    
    @IBAction func addNoteViewTapped(sender: UITapGestureRecognizer) {
        print("Add Note View Tapped")
        
        rowsForSectionNotesCount += 1
        if rowsForSectionNotesCount > 10 {
            // Present an Alert
        }
        else {
            self.tableView.beginUpdates()
            self.tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: rowsForSectionNotesCount-1, inSection: 1)],withRowAnimation: .Automatic)
            self.tableView.endUpdates()
        }
    }
    
    // MARK: - Custom Methods
    
    func saveButtonTapped() {
        
    }
    func cancelButtonTapped()  {
        self.navigationController?.popViewControllerAnimated(true)
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
        self.imageView.image = selecteImage
        self.navigationController?.popViewControllerAnimated(true)
    }

    
    
}

extension Contacts {
    
    var image : UIImage? {
        if let image = UIImage(named: "placeholder"){
            return image
        }
        else {
            return UIImage(named: "placeholder")
        }
    }
}

public extension UINavigationController {
    
    /**
     Pop current view controller to previous view controller.
     
     - parameter type:     transition animation type.
     - parameter duration: transition animation duration.
     */
    func pop(transitionType type: String = kCATransitionFromLeft, duration: CFTimeInterval = 0.3) {
        self.addTransition(transitionType: type, duration: duration)
        self.popViewControllerAnimated(false)
    }
    
    /**
     Push a new view controller on the view controllers's stack.
     
     - parameter vc:       view controller to push.
     - parameter type:     transition animation type.
     - parameter duration: transition animation duration.
     */
    func push(viewController vc: UIViewController, transitionType type: String = kCATransitionFromRight, duration: CFTimeInterval = 0.3) {
        self.addTransition(transitionType: type, duration: duration)
        self.pushViewController(vc, animated: false)
    }
    
    private func addTransition(transitionType type: String = kCATransitionFromRight, duration: CFTimeInterval = 0.3) {
        let transition = CATransition()
        transition.duration = duration
//        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        transition.type = type
        self.view.layer.addAnimation(transition, forKey: nil)
    }
    
}


//extension UIView {
//    func addBorderTop(size size: CGFloat, color: UIColor) {
//        addBorderUtility(x: 0, y: 0, width: frame.width, height: size, color: color)
//    }
//    func addBorderBottom(size size: CGFloat, color: UIColor) {
//        addBorderUtility(x: 0, y: frame.height - size, width: frame.width, height: size, color: color)
//    }
//    func addBorderLeft(size size: CGFloat, color: UIColor) {
//        addBorderUtility(x: 0, y: 0, width: size, height: frame.height, color: color)
//    }
//    func addBorderRight(size size: CGFloat, color: UIColor) {
//        addBorderUtility(x: frame.width - size, y: 0, width: size, height: frame.height, color: color)
//    }
//    private func addBorderUtility(x x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, color: UIColor) {
//        let border = CALayer()
//        border.backgroundColor = color.CGColor
//        border.frame = CGRect(x: x, y: y, width: width, height: height)
//        layer.addSublayer(border)
//    }
//}
