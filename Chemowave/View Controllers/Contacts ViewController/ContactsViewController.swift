//
//  ContactsViewController.swift
//  Chemowave
//
//  Created by zaktech on 31/05/2016.
//  Copyright © 2016 Citrusbits. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddContactsVCDelegate, ListPickerDelegate
{
    
    @IBOutlet weak var treatmentHospitalLabel: UILabel!
    @IBOutlet weak var treatmentHospitalImageView: CustomImageView!
    
    @IBOutlet weak var pharmacyLabel: UILabel!
    @IBOutlet weak var pharmacyImageView: CustomImageView!
    
    @IBOutlet weak var primaryDoctorLabel: UILabel!
    @IBOutlet weak var doctorImageView: CustomImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.blackColor()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    
    // MARK: - UITable Delegate Methods.
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  1//dataSource.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return 1
    }
    
     func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("personalContactsID", forIndexPath: indexPath)
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
        
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
    }
    
    
    // MARK: - Custom Methods
    
    
    
    
    // Cell IBAction Methods
    func addAnotherPhoneNumberButtonTapped() {
        
    }
    func addNotesButtonTapped() {
        
    }

    
    // MARK: ListPicker Delegate
    func didSelectItemFromList(selectedItem: String) {
        
    }
    
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let addContactVC = segue.destinationViewController as? AddContactsViewController
        
        if segue.identifier == "addHospitalInfo" {
            addContactVC!.titleString = "Add Treatment Hospital"
        }
        else if segue.identifier == "addPharmacyInfo" {
            addContactVC!.titleString = "Add Pharmacy"
        }
        else if segue.identifier == "addDoctorInfo" {
            addContactVC!.titleString = "Add Primary Doctor"
        }
        else if segue.identifier == "addPersonalContact" {
            addContactVC!.titleString = "Add Personal Contacts"
        }
        
    }
    
    // MARK: - AddContactsVCDelegate
    
    func didCancelButtonTapped() ->() {
        
    }
    func didSaveTreatmentHospitalInfo(contentObj:Contacts)->() {
        
    }
    func didSavePharmacyInfo(contentObj:Contacts) -> () {
        
    }
    func didSavePrimaryDoctorInfo(contentObj:Contacts) -> () {
        
    }
    func didSavePersonalContactInfor(contentObj:Contacts) -> () {
        
    }
    
}

