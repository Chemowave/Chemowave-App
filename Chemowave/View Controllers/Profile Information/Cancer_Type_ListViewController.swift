//
//  Cancer_Type_ListViewController.swift
//  Chemowave
//
//  Created by zaktech on 6/2/16.
//  Copyright © 2016 Citrusbits. All rights reserved.
//

import UIKit

class Cancer_Type_ListViewController: UIViewController,UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate{
    var searchActive : Bool = false
    var cancerTypeListArray = ["San Francisco","New York","San Jose","Chicago","Los Angeles","Austin","Seattle"]
    var filtered:[String] = []
    @IBOutlet weak var cancerListTable: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var checked = [Bool]()
    var lastSelectRowTxt : NSString = NSString()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cancer Type"
        let doneBtn = UIBarButtonItem(title: "Done", style: .Plain, target: self, action: #selector(doneButtonTapped))
        self.navigationItem.rightBarButtonItem = doneBtn
        self.navigationItem.rightBarButtonItem?.enabled = false
        searchBar.delegate = self
        self.searchBar.returnKeyType = .Done
        }
    
    func doneButtonTapped(){
      self.navigationController?.popViewControllerAnimated(true)
    }
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchActive) {
            return filtered.count
        }
        return cancerTypeListArray.count;
    }
    
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cancerTypeCell") as! Cancer_Type_CustmTableViewCell

        if(searchActive){
            cell.rowTitleLabel?.text = filtered[indexPath.row]
        } else {
            cell.rowTitleLabel?.text = cancerTypeListArray[indexPath.row];
        }
        
        if  self.lastSelectRowTxt.isEqualToString(self.cancerTypeListArray[indexPath.row]) {
              cell.checkMarkImage.image = UIImage(named: "filled_checkMark")
        }
        else{
             cell.checkMarkImage.image = UIImage(named: "empty_checkMark")
        }
        cell.selectionStyle = .None
        return cell;
       }
    
    
    
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        print("show me")
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchActive = false;
        self.searchBar.resignFirstResponder()
        self.cancerListTable.reloadData()
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        filtered = cancerTypeListArray.filter({ (text) -> Bool in
            let tmp: NSString = text
            let range = tmp.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            return range.location != NSNotFound
        })
        if(filtered.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }
        self.cancerListTable.reloadData()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! Cancer_Type_CustmTableViewCell
        let text = cell.rowTitleLabel?.text
        self.lastSelectRowTxt = text!
        searchActive = false;
        self.searchBar.resignFirstResponder()
        self.searchBar.text = ""
        self.navigationItem.rightBarButtonItem?.enabled = true
        tableView.reloadData()
    }
}
