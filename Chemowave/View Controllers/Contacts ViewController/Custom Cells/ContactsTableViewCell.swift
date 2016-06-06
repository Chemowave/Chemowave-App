//
//  ContactsTableViewCell.swift
//  Chemowave
//
//  Created by zaktech on 02/06/2016.
//  Copyright © 2016 Citrusbits. All rights reserved.
//

import UIKit
protocol ContactsTableViewCellDelegate {
    func titleButtonTapped(cell: ContactsTableViewCell)
}


class ContactsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleButton: UIButton!
    @IBOutlet weak var dataField: UITextField!
    @IBOutlet weak var disclosureImageView: UIImageView!
    
    var cellDelegate: ContactsTableViewCellDelegate?
    
    var showDisclosureImage : Bool = true {
        didSet {
            
            if showDisclosureImage {
                self.disclosureImageView.image = UIImage(named: "arrow")
                self.disclosureImageView.hidden = false
                titleButton.enabled = true
            }
            else {
               self.disclosureImageView.image = nil
                self.disclosureImageView.hidden = true
                self.titleButton.enabled = false
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    @IBAction func titleButtonTapped(sender: UIButton) {
        
        print("Cell tapped with tag \(sender.tag)")
        self.cellDelegate?.titleButtonTapped(self)
        
    }

}
