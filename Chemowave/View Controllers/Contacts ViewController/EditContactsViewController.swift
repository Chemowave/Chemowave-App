//
//  EditContactsViewController.swift
//  Chemowave
//
//  Created by zaktech on 03/06/2016.
//  Copyright © 2016 Citrusbits. All rights reserved.
//

import UIKit

class EditContactsViewController: UIViewController {

    var contactObj : Contacts?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let saveButton = UIBarButtonItem(title: "Save", style: .Plain, target: self, action: #selector(saveButtonTapped))
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .Plain, target: self, action: #selector(cancelButtonTapped))
        self.navigationItem.leftBarButtonItem = cancelButton
        self.navigationItem.rightBarButtonItem = saveButton
        self.navigationItem.rightBarButtonItem?.enabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Custom Methods
    
    func saveButtonTapped() {
        
    }
    func cancelButtonTapped()  {
        self.navigationController?.popViewControllerAnimated(true)
    }


}
