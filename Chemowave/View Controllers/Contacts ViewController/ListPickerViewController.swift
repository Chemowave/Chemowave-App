//
//  ListPickerViewController.swift
//  Chemowave
//
//  Created by zaktech on 02/06/2016.
//  Copyright © 2016 Citrusbits. All rights reserved.
//

import UIKit

class PhoneLabel {
    let title : String
    var selected:Bool
    
    init(title: String, selected : Bool = false) {
        self.title = title
        self.selected = selected
    }
}

protocol ListPickerDelegate {
    func didSelectItemFromList(selectedItem: String)
}


class ListPickerViewController: UITableViewController {

    
    var dataSource:[PhoneLabel] = []//["Main", "Home", "Work", "Mobile"]
    var listDelegate : ListPickerDelegate?
    var selectedItem: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = [PhoneLabel(title: "Main",selected: false),
                      PhoneLabel(title: "Home",selected: false),
                      PhoneLabel(title: "Work",selected: false),
                      PhoneLabel(title: "Mobile",selected: false)
        ]
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .Plain, target: self, action: #selector(cancelButtonTapped))
        self.navigationItem.leftBarButtonItem = cancelButton
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        checkForSelectedLabel()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Custom Methods
    
    func checkForSelectedLabel() {
        if let i = dataSource.indexOf({$0.title == selectedItem}) {
            let obj = dataSource[i]
            obj.selected = true
        }
        tableView.reloadData()
    }
    
    func cancelButtonTapped()  {
        self.navigationController?.pop()
    }
    

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cancerTypeCell", forIndexPath: indexPath) as! Cancer_Type_CustmTableViewCell
        
        let phoneLabel = dataSource[indexPath.row]
        
        cell.rowTitleLabel?.text = phoneLabel.title
        
        if phoneLabel.selected {
            cell.checkMarkImage.image = UIImage(named: "filled_checkMark")
        }
        else {
            cell.checkMarkImage.image = UIImage(named: "empty_checkMark")
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let cell = tableView.cellForRowAtIndexPath(indexPath) as? Cancer_Type_CustmTableViewCell {
            
            selectedItem = dataSource[indexPath.row].title
            dataSource[indexPath.row].selected = true

            cell.checkMarkImage.image = UIImage(named: "filled_checkMark")
            self.listDelegate?.didSelectItemFromList(selectedItem!)
            tableView.reloadData()
            self.navigationController?.pop()
        }
    }
}
