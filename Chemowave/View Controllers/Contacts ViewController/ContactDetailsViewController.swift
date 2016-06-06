//
//  ContactDetailsViewController.swift
//  Chemowave
//
//  Created by zaktech on 03/06/2016.
//  Copyright © 2016 Citrusbits. All rights reserved.
//

import UIKit

class ContactDetailsViewController: UIViewController {

    var contactObj : Contacts?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let saveButton = UIBarButtonItem(title: "Edit", style: .Plain, target: self, action: #selector(editButtonTapped))
        self.navigationItem.rightBarButtonItem = saveButton
        self.navigationItem.rightBarButtonItem?.enabled = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Custom Methods
    
    func editButtonTapped() {
        let storyboard = UIStoryboard(name: "Contacts", bundle: nil)
        let editContactVC = storyboard.instantiateViewControllerWithIdentifier("EditContactsViewController")
        self.navigationController?.pushViewController(editContactVC, animated: true)
    }

    
    
}
